package com.common.system.mapper;

import com.common.system.entity.finance.ToLoan;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ToLoanMapper {

    @Select("select * from common_to_loan where user=#{user}")
    List<ToLoan> getToLoans(String user);

    @Insert("insert into common_to_loan(toLoan,money,interest,life,alreadyRepaid,surplus,user,createTime,startTime) values(#{toLoan},#{money},#{interest},#{life},#{alreadyRepaid},#{surplus},#{user},#{createTime},#{startTime})")
    Integer save(ToLoan toLoan);

    @Update("update common_to_loan set toLoan=#{toLoan},money=#{money},interest=#{interest},life=#{life},alreadyRepaid=#{alreadyRepaid},surplus=#{surplus}, user=#{user},createTime=#{createTime},startTime=#{startTime} where id=#{id}")
    Integer update(ToLoan toLoan);

    @Select("select * from common_to_loan where id=#{id}")
    ToLoan getById(int id);

    @Delete("delete from common_to_loan where id=#{id}")
    Integer delete(int id);

}
