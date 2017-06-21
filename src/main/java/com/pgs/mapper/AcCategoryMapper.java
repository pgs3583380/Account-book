package com.pgs.mapper;

import com.pgs.model.AcCategory;

public interface AcCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcCategory record);

    AcCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcCategory record);

}