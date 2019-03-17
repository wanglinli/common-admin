package com.common.system.service.impl;

import com.common.system.entity.BillIncome;
import com.common.system.entity.RcRoleWrapper;
import com.common.system.mapper.BillMapper;
import com.common.system.service.BillService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {

    @Resource
    private BillMapper mapper;

    @Override
    public PageInfo<BillIncome> listForPage(Integer pageNum, Integer pageSize) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<BillIncome> roleList = mapper.getIncomeBill();
        return new PageInfo<BillIncome>(roleList);
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public Result<BillIncome> selectById(Integer id) {
        return null;
    }

    @Override
    public BillIncome selectByRoleName(String roleName) {
        return null;
    }

    @Override
    public BillIncome selectByRoleValue(String roleValue) {
        return null;
    }

    @Override
    public Result<Integer> save(BillIncome type, List<Integer> permissionIds) {
        return null;
    }

    @Override
    public Result<Integer> update(BillIncome type) {
        return null;
    }

    @Override
    public List<RcRoleWrapper> getRoleWrapperList() {
        return null;
    }
}
