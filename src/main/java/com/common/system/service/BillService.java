package com.common.system.service;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.system.RcRoleWrapper;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;

/**
 * Created by Mr.Yangxiufeng on 2017/6/22.
 * Time:14:15
 * ProjectName:Common-admin
 */
public interface BillService {

    PageInfo<Bill> listForPage(Integer pageNum, Integer pageSize,Bill bill);

    PageInfo<Bill> queryAll();

    Result<Integer> deleteById(Integer id);

    Result<Bill> selectById(Integer id);

    Result<Integer> save(Bill bill);

    Result<Integer> update(Bill type);

    String getDataByParamsIn(String param);

    String getDataByParamsOut(String param);
    PageInfo<Bill> queryByDate(Bill bill);
}
