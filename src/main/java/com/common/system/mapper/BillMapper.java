package com.common.system.mapper;

import com.common.system.entity.BillIncome;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BillMapper {

    @Select("select * from common_income")
    List<BillIncome> getIncomeBill();
}
