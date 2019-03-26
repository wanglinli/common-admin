package com.common.system.service.impl;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.system.RcRoleWrapper;
import com.common.system.mapper.BillMapper;
import com.common.system.service.BillService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {

    @Resource
    private BillMapper mapper;

    @Override
    public PageInfo<Bill> listForPage(Integer pageNum, Integer pageSize,Bill bill) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<Bill> roleList = mapper.getbillBill(bill);

        return new PageInfo<>(roleList);
    }

    @Override
    public PageInfo<Bill> queryAll() {
        List<Bill> roleList = mapper.queryAll();
        return new PageInfo<>(roleList);
    }


    @Override
    public Result<Integer> deleteById(Integer id) {
        Result<Integer> result = new Result<Integer>();
        int res =  mapper.delete(id);
        getIntegerResult(result,res);
        return result;
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
    public Result<Integer> save(Bill bill) {
        int res = mapper.save(bill);
        return getIntegerResult(new Result<Integer>(),res);
    }

    @Override
    public Result<Integer> update(Bill type) {
        int res = mapper.update(type);
        return getIntegerResult(new Result<Integer>(),res);
    }

    @Override
    public String getDataByMonthAndYearIn(String param) {
        List<Bill> list = mapper.getDataByMonthAndYear(param+"%");
        String res = "0";
        for (Bill money:list) {
            if (1 == money.getBillFlag()){
                res += (new Double(res) + new Double(money.getBillMoney()));
            }
        }
        return res;
    }

    @Override
    public String getDataByMonthAndYearOut(String param) {
        List<Bill> list = mapper.getDataByMonthAndYear(param + "%");
        String res = "0";
        for (Bill money:list) {
            if (0 == money.getBillFlag()){
                res += (new Double(res) + new Double(money.getBillMoney()));
            }
        }
        return res;
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
