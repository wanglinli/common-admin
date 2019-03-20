package com.common.system.service.impl;

import com.common.system.entity.finance.ToLoan;
import com.common.system.mapper.ToLoanMapper;
import com.common.system.service.ToLoanService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ToLoanServiceImpl implements ToLoanService {

    @Resource
    private ToLoanMapper mapper;

    @Override
    public PageInfo<ToLoan> listForPage(Integer pageNum, Integer pageSize, String user) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<ToLoan> roleList = mapper.getToLoans(user);
        return new PageInfo<>(roleList);
    }

    @Override
    public Result<ToLoan> deleteById(Integer id) {
        Result<ToLoan> result = new Result<>();
        int res = mapper.delete(id);
        if (res > 0 ){
            result.setStatus(true);
            result.setMsg("成功!");
            result.setCode(0);
        }
        return result;
    }

    @Override
    public Result<ToLoan> selectById(Integer id) {
        Result<ToLoan> result = new Result<>();
        ToLoan res = mapper.getById(id);
        if (res != null ){
            result.setStatus(true);
            result.setMsg("成功!");
            result.setData(res);
            result.setCode(0);
        }
        return result;
    }

    @Override
    public Result<Integer> save(ToLoan toLoan) {
        Result<Integer> result = new Result<>();
        int res = mapper.save(toLoan);
        return getIntegerResult(result, res);
    }

    @Override
    public Result<Integer> update(ToLoan toLoan) {
        Result<Integer> result = new Result<>();
        int res = mapper.update(toLoan);
        return getIntegerResult(result, res);
    }

    private Result<Integer> getIntegerResult(Result<Integer> result, int res) {
        if (res > 0){
            result.setData(res);
            result.setCode(0);
            result.setStatus(true);
            result.setMsg("成功!");
        }
        return result;
    }
}
