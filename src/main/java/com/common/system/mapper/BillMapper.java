package com.common.system.mapper;

import com.common.system.entity.finance.Bill;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface BillMapper {

    @Select("select * from common_bill where billUser=#{billUser} and billFlag=#{billFlag}")
    List<Bill> getbillBill(Bill bill);

    @Select("select * from common_bill")
    List<Bill> queryAll();

    @Update("update common_bill set billTime=#{billTime},billMoney=#{billMoney},billType=#{billType},billNote=#{billNote} where id=#{id}")
    Integer update(Bill dealType);

    @Select("select * from common_bill where id=#{id}")
    Bill getByID(int id);

    @Insert("insert into common_bill (billTime,billMoney,billType,billUser,billNote,billFlag,createtime) values (#{billTime},#{billMoney},#{billType},#{billUser},#{billNote},#{billFlag},#{createTime})")
    Integer save(Bill bill);
}
