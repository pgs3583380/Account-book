package com.pgs.mapper;

import com.pgs.model.AcCategory;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AcCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcCategory record);

    AcCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcCategory record);

    /**
     * 获得1级目录
     *
     * @return
     */
    List<AcCategory> selectByLevel(int level);

    /**
     * 获得下一级目录
     *
     * @return
     */
    List<AcCategory> selectChild(int parentId);

}