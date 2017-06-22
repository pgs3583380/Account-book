package com.pgs.service;

import com.pgs.model.AcCategory;

import java.util.List;

/**
 * Created by Administrator on 2017/6/21.
 */
public interface AcCategoryService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcCategory record);

    AcCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcCategory record);

    /**
     * 获得1级目录
     * @return
     */
    List<AcCategory> selectByLevel(int level);

    /**
     * 获得下一级目录
     * @return
     */
    List<AcCategory> selectChild(int parentId);

}
