package com.common.system.mapper;

import com.common.system.entity.DealType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DealTypeMapper {

    @Select("select * from common_deal_type")
    List<DealType> getDealTypes();
}
