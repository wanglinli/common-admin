package com.common.system.mapper;

import com.common.system.entity.finance.Remind;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RemindMapper {

    @Select("select * from common_remind where user=#{user}")
    List<Remind> getReminds(String user);

    @Insert("insert into common_remind(time,content,status,user) values(#{time},#{content},#{status},#{user})")
    Integer save(Remind remind);

    @Update("update common_remind set time=#{time},content=#{content},status=#{status},user=#{user} where id=#{id}")
    Integer update(Remind remind);

    @Select("select * from common_remind where id=#{id}")
    Remind getById(int id);

    @Delete("delete from common_remind where id=#{id}")
    Integer delete(int id);

}
