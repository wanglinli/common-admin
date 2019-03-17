package com.common.system.service.impl;

import com.common.system.entity.Bill;
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
    public PageInfo<Bill> listForPage(Integer pageNum, Integer pageSize) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<Bill> roleList = mapper.getbillBill();

        return new PageInfo<Bill>(roleList);
    }



    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public Result<Bill> selectById(Integer id) {
        Result<Bill> result = new Result<Bill>();
        Bill bill =  mapper.getByID(id);
        if(bill!=null){
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("SUCCESS!");
            result.setData(bill);
        }
        return result;
    }

    @Override
    public Bill selectByRoleName(String roleName) {
        return null;
    }

    @Override
    public Bill selectByRoleValue(String roleValue) {
        return null;
    }

    @Override
    public Result<Integer> save(Bill type, List<Integer> permissionIds) {
        return null;
    }

    @Override
    public Result<Integer> update(Bill type) {
        int res = mapper.update(type);
        return getIntegerResult(new Result<Integer>(),res);
    }

    @Override
    public List<RcRoleWrapper> getRoleWrapperList() {
        return null;
    }


    private Result<Integer> getIntegerResult(Result<Integer> result, int res) {
        if (res > 0){
            result.setData(res);
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }
}
