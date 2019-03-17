package com.common.system.service;

import com.common.system.entity.BillIncome;
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

    PageInfo<BillIncome> listForPage(Integer pageNum, Integer pageSize);

    int deleteById(Integer id);

    Result<BillIncome> selectById(Integer id);

    BillIncome selectByRoleName(String roleName);

    BillIncome selectByRoleValue(String roleValue);

    Result<Integer> save(BillIncome type, List<Integer> permissionIds);
    Result<Integer> update(BillIncome type);

    List<RcRoleWrapper> getRoleWrapperList();
}
