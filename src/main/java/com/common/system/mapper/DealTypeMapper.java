package com.common.system.mapper;

import com.common.system.entity.DealType;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DealTypeMapper {

    @Select("select * from common_deal_type where inOrOut=#{inOrOut}")
    List<DealType> getDealTypesByInOrOut(int inOrOut);

    @Insert("insert into common_deal_type(type,note,inOrOut,createTime) values(#{type},#{note},#{inOrOut},#{createTime})")
    Integer save(DealType dealType);

    @Update("update common_deal_type set type=#{type},note=#{note},inOrOut=#{inOrOut},createTime=#{createTime} where id=#{id}")
    Integer update(DealType dealType);

    @Select("select * from common_deal_type where id=#{id}")
    DealType getById(int id);

    @Delete("delete from common_deal_type where id=#{id}")
    Integer delete(int id);

}
