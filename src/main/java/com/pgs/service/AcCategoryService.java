package com.pgs.service;

import com.pgs.model.AcCategory;

/**
 * Created by Administrator on 2017/6/21.
 */
public interface AcCategoryService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcCategory record);

    AcCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcCategory record);
}
