package com.common.system.service;

import com.common.system.entity.finance.ToLoan;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;


public interface ToLoanService {

    PageInfo<ToLoan> listForPage(Integer pageNum, Integer pageSize, String user);

    Result<ToLoan> deleteById(Integer id);

    Result<ToLoan> selectById(Integer id);

    Result<Integer> save(ToLoan toLoan);

    Result<Integer> update(ToLoan toLoan);

}
