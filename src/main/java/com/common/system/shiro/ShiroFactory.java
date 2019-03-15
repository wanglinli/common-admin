package com.common.system.shiro;

import com.common.system.entity.*;
import com.common.system.service.MenuService;
import com.common.system.service.PrivilegeService;
import com.common.system.service.RcUserRoleService;
import com.common.system.service.RoleService;
import com.common.system.service.UserService;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShiroFactory {

    private final UserService userService;

    private final RoleService roleService;

    private final RcUserRoleService userRoleService;

    private final PrivilegeService privilegeService;

    private final MenuService menuService;

    @Autowired
    public ShiroFactory(RcUserRoleService userRoleService, PrivilegeService privilegeService, MenuService menuService, UserService userService, RoleService roleService) {
        this.userRoleService = userRoleService;
        this.privilegeService = privilegeService;
        this.menuService = menuService;
        this.userService = userService;
        this.roleService = roleService;
    }

    public RcUser user(String username) {
//        RcUser user = userMapper.getUserByName(username);
        RcUser user = userService.getByUserName(username).getData();
        // 账号不存在
        if (null == user) {
            throw new CredentialsException();
        }
        return user;
    }
    ShiroUser shiroUser(RcUser user) {
        ShiroUser shiroUser = new ShiroUser();
        shiroUser.setId(user.getId());            // 账号id
        shiroUser.setUsername(user.getUsername());// 账号
        shiroUser.setName(user.getName());        // 用户名称
        List<RcUserRole> userRoleList = userRoleService.getByUserId(user.getId());
        List<RcRole> roleList = new ArrayList<>();
        if (userRoleList != null && userRoleList.size() > 0){
            for (RcUserRole r: userRoleList
                 ) {
                RcRole role = roleService.selectById(r.getRoleId()).getData();
                roleList.add(role);
            }
            shiroUser.setRoleList(roleList);
        }
        shiroUser.setCreateTime(user.getCreateTime());

        if (roleList != null && roleList.size() >0 ){
            //权限菜单值
            List<String> permissionValues = new ArrayList<>();
            List<String> roleValues = new ArrayList<>();
            //角色权限菜单
            List<RcPrivilege> privilegeList = new ArrayList<>();
            for (RcRole r:roleList
                    ) {
                roleValues.add(r.getValue());
                List<RcPrivilege> ll = privilegeService.getByRoleId(r.getId());
                privilegeList.addAll(ll);
            }
            shiroUser.setRoleValues(roleValues);

            shiroUser.setPrivilegeList(privilegeList);
            List<String> ids = new ArrayList<>();
            for (RcPrivilege p : privilegeList){
                //去重
                if (!ids.contains(p.getMenuId())){
                    ids.add(p.getMenuId());
                }
            }
            List<RcMenu> menuList = menuService.selectInIds(ids,null);

            for (RcMenu p:menuList
                    ) {
                permissionValues.add(p.getCode());
            }
            shiroUser.setPermissionValues(permissionValues);
        }
        return shiroUser;
    }
    public SimpleAuthenticationInfo buildAuthenticationInfo(ShiroUser shiroUser, RcUser user, String realmName) {
        String credentials = user.getPassword();
        // 密码加盐处理
        String source = user.getSalt();
        ByteSource credentialsSalt = new Md5Hash(source);
        return new SimpleAuthenticationInfo(shiroUser, credentials, credentialsSalt, realmName);
    }
}
