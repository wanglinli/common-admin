package com.common.system.service;

import com.common.system.entity.finance.BorrowLend;
import com.common.system.entity.finance.ToLoan;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;


public interface BorrowLendService {

    PageInfo<BorrowLend> listForPage(Integer pageNum, Integer pageSize, String user);

    Result<BorrowLend> deleteById(Integer id);

    Result<BorrowLend> selectById(Integer id);

    Result<Integer> save(BorrowLend borrowLend);

    Result<Integer> update(BorrowLend borrowLend);

}
