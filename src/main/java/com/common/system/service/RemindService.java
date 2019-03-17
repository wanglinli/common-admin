package com.common.system.service;

import com.common.system.entity.Remind;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;

/**
 * Created by Mr.Yangxiufeng on 2017/6/22.
 * Time:14:15
 * ProjectName:Common-admin
 */
public interface RemindService {

    PageInfo<Remind> listForPage(Integer pageNum, Integer pageSize);

    Result<Remind> deleteById(Integer id);

    Result<Remind> selectById(Integer id);

    Result<Integer> save(Remind remind);

    Result<Integer> update(Remind remind);

}
