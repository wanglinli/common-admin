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
    public PageInfo<DealType> listForPage(Integer pageNum, Integer pageSize) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<DealType> roleList = mapper.getDealTypes();
        return new PageInfo<>(roleList);
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public Result<DealType> selectById(Integer id) {
        return null;
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
    public Result<Integer> save(DealType type, List<Integer> permissionIds) {
        return null;
    }

    @Override
    public Result<Integer> update(DealType type) {
        return null;
    }

    @Override
    public List<RcRoleWrapper> getRoleWrapperList() {
        return null;
    }
}
