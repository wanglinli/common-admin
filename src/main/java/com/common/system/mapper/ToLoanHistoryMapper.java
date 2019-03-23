package com.common.system.mapper;

import com.common.system.entity.finance.ToLoanHistory;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ToLoanHistoryMapper {

    @Select("select * from common_to_loan_history where toLoan=#{toLoan}")
    List<ToLoanHistory> getToLoanHistory(String toLoan);

    @Insert("insert into common_to_loan_history(toLoan,returnMoney,createTime,returnTime) values(#{toLoan},#{returnMoney},#{createTime},#{returnTime})")
    Integer save(ToLoanHistory toLoanHistory);

    @Select("select * from common_to_loan where id=#{id}")
    ToLoanHistory getById(int id);

    @Delete("delete from common_to_loan where id=#{id}")
    Integer delete(int id);

    @Delete("delete from common_to_loan where toLoan=#{toLoan}")
    Integer deleteByToLoan(String toLoan);

}
