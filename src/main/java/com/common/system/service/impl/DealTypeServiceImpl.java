package com.common.system.service.impl;

import com.common.system.entity.DealType;
import com.common.system.entity.RcRoleWrapper;
import com.common.system.mapper.DealTypeMapper;
import com.common.system.service.DealTypeService;
import com.common.system.util.Result;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DealTypeServiceImpl implements DealTypeService {

    @Resource
    private DealTypeMapper mapper;

    @Override
    public PageInfo<DealType> listForPage(Integer pageNum, Integer pageSize,int inOrOut) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<DealType> roleList = mapper.getDealTypesByInOrOut(inOrOut);
        return new PageInfo<>(roleList);
    }

    @Override
    public Result<DealType> deleteById(Integer id) {
        Result<DealType> result = new Result<>();
        int res = mapper.delete(id);
        if (res > 0 ){
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }

    @Override
    public Result<DealType> selectById(Integer id) {
        Result<DealType> result = new Result<>();
        DealType res = mapper.getById(id);
        if (res != null ){
            result.setData(res);
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }

    @Override
    public DealType selectByRoleName(String roleName) {
        return null;
    }

    @Override
    public DealType selectByRoleValue(String roleValue) {
        return null;
    }

    @Override
    public Result<Integer> save(DealType type) {
        Result<Integer> result = new Result<>();
        int res = mapper.save(type);
        return getIntegerResult(result, res);
    }

    @Override
    public Result<Integer> update(DealType type) {
        Result<Integer> result = new Result<>();
        int res = mapper.update(type);
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

    @Override
    public List<RcRoleWrapper> getRoleWrapperList() {
        return null;
    }
}
