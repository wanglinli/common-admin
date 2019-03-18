package com.common.system.service.impl;

import com.common.system.entity.Remind;
import com.common.system.mapper.RemindMapper;
import com.common.system.service.RemindService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RemindServiceImpl implements RemindService {

    @Resource
    private RemindMapper mapper;

    @Override
    public PageInfo<Remind> listForPage(Integer pageNum, Integer pageSize) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<Remind> roleList = mapper.getReminds();
        return new PageInfo<>(roleList);
    }

    @Override
    public Result<Remind> deleteById(Integer id) {
        Result<Remind> result = new Result<>();
        int res = mapper.delete(id);
        if (res > 0 ){
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }

    @Override
    public Result<Remind> selectById(Integer id) {
        Result<Remind> result = new Result<>();
        Remind res = mapper.getById(id);
        if (res != null ){
            result.setData(res);
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }

    @Override
    public Result<Integer> save(Remind remind) {
        Result<Integer> result = new Result<>();
        int res = mapper.save(remind);
        return getIntegerResult(result, res);
    }

    @Override
    public Result<Integer> update(Remind remind) {
        Result<Integer> result = new Result<>();
        int res = mapper.update(remind);
        return getIntegerResult(result, res);
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
