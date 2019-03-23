package com.common.system.service;

import com.common.system.entity.finance.ToLoanHistory;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface ToLoanHistoryService {

    PageInfo<ToLoanHistory> listForPage(Integer pageNum, Integer pageSize, String toLoan);

    Result<ToLoanHistory> deleteById(Integer id);

    Result<ToLoanHistory> deleteByToLoan(String toLoan);

    Result<ToLoanHistory> selectById(Integer id);
    List<ToLoanHistory> selectByToLoan(String toLoan);

    Result<Integer> save(ToLoanHistory toLoanHistory);


}
