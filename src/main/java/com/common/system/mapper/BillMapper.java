package com.common.system.mapper;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.finance.count.WeekData;
import org.apache.ibatis.annotations.*;

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

    @Delete("delete from common_bill  where id=#{id}")
    Integer delete(int id);

    @Select("select * from common_bill where billTime like #{param}")
    List<Bill> getDataByParam(String param);

    @Select("select * from common_bill where billTime like #{one} or billTime like #{two} or billTime like #{three} or billTime like #{four} or billTime like #{five} or billTime like #{six} or billTime like #{seven}")
    List<Bill> getDataByTypeWeek(WeekData weekData);

    List<Bill> getDataByMonthAndYear(String param);
    @Select("select * from common_bill where billTime>=#{startDate} and billTime<=#{endDate}")
    List<Bill> queryByDate(Bill bill);
}
