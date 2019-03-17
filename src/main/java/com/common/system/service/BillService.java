package com.common.system.service;

import com.common.system.entity.Bill;
import com.common.system.entity.RcRoleWrapper;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Mr.Yangxiufeng on 2017/6/22.
 * Time:14:15
 * ProjectName:Common-admin
 */
public interface BillService {

    PageInfo<Bill> listForPage(Integer pageNum, Integer pageSize);

    int deleteById(Integer id);

    Result<Bill> selectById(Integer id);

    Bill selectByRoleName(String roleName);

    Bill selectByRoleValue(String roleValue);

    Result<Integer> save(Bill type, List<Integer> permissionIds);

    Result<Integer> update(Bill type);

    List<RcRoleWrapper> getRoleWrapperList();


}
