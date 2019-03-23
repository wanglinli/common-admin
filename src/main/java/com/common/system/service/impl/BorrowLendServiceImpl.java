package com.common.system.service.impl;

import com.common.system.entity.finance.BorrowLend;
import com.common.system.mapper.BorrowLendMapper;
import com.common.system.service.BorrowLendService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BorrowLendServiceImpl implements BorrowLendService {

    @Resource
    private BorrowLendMapper mapper;

    @Override
    public PageInfo<BorrowLend> listForPage(Integer pageNum, Integer pageSize, String user) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<BorrowLend> roleList = mapper.queryByUser(user);
        return new PageInfo<>(roleList);
    }

    @Override
    public Result<BorrowLend> deleteById(Integer id) {
        Result<BorrowLend> result = new Result<>();
        int res = mapper.delete(id);
        if (res > 0 ){
            result.setMsg("成功!");
            result.setStatus(true);
            result.setCode(0);
        }
        return result;
    }

    @Override
    public Result<BorrowLend> selectById(Integer id) {
        Result<BorrowLend> result = new Result<>();
        BorrowLend res = mapper.getById(id);
        if (res != null ){
            result.setStatus(true);
            result.setData(res);
            result.setMsg("成功!");
            result.setCode(0);
        }
        return result;
    }

    @Override
    public Result<Integer> save(BorrowLend borrowLend) {
        Result<Integer> result = new Result<>();
        int res = mapper.save(borrowLend);
        return getIntegerResult(result, res);
    }

    @Override
    public Result<Integer> update(BorrowLend borrowLend) {
        Result<Integer> result = new Result<>();
        int res = mapper.update(borrowLend);
        return getIntegerResult(result, res);
    }

    private Result<Integer> getIntegerResult(Result<Integer> result, int res) {
        if (res > 0){
            result.setCode(0);
            result.setStatus(true);
            result.setMsg("成功!");
            result.setData(res);
        }
        return result;
    }
}
