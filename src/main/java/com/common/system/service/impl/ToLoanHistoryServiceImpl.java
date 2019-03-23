package com.common.system.service.impl;

import com.common.system.entity.finance.ToLoanHistory;
import com.common.system.mapper.ToLoanHistoryMapper;
import com.common.system.service.ToLoanHistoryService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ToLoanHistoryServiceImpl implements ToLoanHistoryService {

    @Resource
    private ToLoanHistoryMapper mapper;

    @Override
    public PageInfo<ToLoanHistory> listForPage(Integer pageNum, Integer pageSize, String toLoan) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<ToLoanHistory> roleList = mapper.getToLoanHistory(toLoan);
        return new PageInfo<>(roleList);
    }

    @Override
    public Result<ToLoanHistory> deleteById(Integer id) {
        Result<ToLoanHistory> result = new Result<>();
        int res = mapper.delete(id);
        if (res > 0 ){
            result.setMsg("成功!");
            result.setCode(0);
            result.setStatus(true);
        }
        return result;
    }

    @Override
    public Result<ToLoanHistory> deleteByToLoan(String toLoan) {
        Result<ToLoanHistory> result = new Result<>();
        int res = mapper.deleteByToLoan(toLoan);
        if (res > 0 ){
            result.setCode(0);
            result.setStatus(true);
            result.setMsg("成功!");
        }
        return result;
    }

    @Override
    public Result<ToLoanHistory> selectById(Integer id) {
        Result<ToLoanHistory> result = new Result<>();
        ToLoanHistory res = mapper.getById(id);
        if (res != null ){
            result.setCode(0);
            result.setStatus(true);
            result.setMsg("成功!");
            result.setData(res);
        }
        return result;
    }

    @Override
    public List<ToLoanHistory> selectByToLoan(String toLoan) {
        return mapper.getToLoanHistory(toLoan);
    }

    @Override
    public Result<Integer> save(ToLoanHistory toLoanHistory) {
        Result<Integer> result = new Result<>();
        int res = mapper.save(toLoanHistory);
        return getIntegerResult(result, res);
    }


    private Result<Integer> getIntegerResult(Result<Integer> result, int res) {
        if (res > 0){
            result.setCode(0);
            result.setStatus(true);
            result.setData(res);
            result.setMsg("成功!");
        }
        return result;
    }
}
