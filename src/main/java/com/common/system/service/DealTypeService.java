package com.common.system.service;

import com.common.system.entity.DealType;
import com.common.system.entity.RcRole;
import com.common.system.entity.RcRoleWrapper;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DealTypeService {

    PageInfo<DealType> listForPage(Integer pageNum, Integer pageSize,int inOrOut,String user);

//    PageInfo<DealType> listForPage(Integer pageNum, Integer pageSize);

    Result<DealType> deleteById(Integer id);

    Result<DealType> selectById(Integer id);

    Result<Integer> save(DealType type);

    Result<Integer> update(DealType type);

    List<DealType> queryAllByUser(String user);

}
