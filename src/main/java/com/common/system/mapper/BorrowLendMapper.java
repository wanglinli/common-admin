package com.common.system.mapper;

import com.common.system.entity.finance.BorrowLend;
import com.common.system.entity.finance.ToLoan;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BorrowLendMapper {

    @Select("select * from common_borrow_lend where borrowUser=#{user}or lendUser=#{user}")
    List<BorrowLend> queryByUser(String user);

    @Insert("insert into common_borrow_lend(borrowLendTime,money,note,borrowUser,lendUser,status,createTime) values(#{borrowLendTime},#{money},#{note},#{borrowUser},#{lendUser},#{status},#{createTime})")
    Integer save(BorrowLend borrowLend);

    @Update("update common_borrow_lend set borrowLendTime=#{borrowLendTime},money=#{money},note=#{note},borrowUser=#{borrowUser},lendUser=#{lendUser},status=#{status}, createTime=#{createTime} where id=#{id}")
    Integer update(BorrowLend borrowLend);

    @Select("select * from common_borrow_lend where id=#{id}")
    BorrowLend getById(int id);

    @Delete("delete from common_borrow_lend where id=#{id}")
    Integer delete(int id);

}
