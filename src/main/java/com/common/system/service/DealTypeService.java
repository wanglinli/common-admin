package com.common.system.service;

import com.common.system.entity.DealType;
import com.common.system.entity.RcRole;
import com.common.system.entity.RcRoleWrapper;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Mr.Yangxiufeng on 2017/6/22.
 * Time:14:15
 * ProjectName:Common-admin
 */
public interface DealTypeService {

    PageInfo<DealType> listForPage(Integer pageNum, Integer pageSize);

    int deleteById(Integer id);

    Result<DealType> selectById(Integer id);

    DealType selectByRoleName(String roleName);

    DealType selectByRoleValue(String roleValue);

    Result<Integer> save(DealType type, List<Integer> permissionIds);
    Result<Integer> update(DealType type);

    List<RcRoleWrapper> getRoleWrapperList();
}
