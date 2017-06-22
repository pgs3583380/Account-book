package com.pgs.service.impl;

import com.pgs.mapper.AcCategoryMapper;
import com.pgs.model.AcCategory;
import com.pgs.service.AcCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/21.
 */
@Service
public class AcCategoryServiceImpl implements AcCategoryService {
    @Autowired
    AcCategoryMapper acCategoryMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return acCategoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(AcCategory record) {
        return acCategoryMapper.insertSelective(record);
    }

    @Override
    public AcCategory selectByPrimaryKey(Integer id) {
        return acCategoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AcCategory record) {
        return acCategoryMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<AcCategory> selectByLevel(int level) {
        return acCategoryMapper.selectByLevel(level);
    }

    @Override
    public List<AcCategory> selectChild(int parentId) {
        return acCategoryMapper.selectChild(parentId);
    }
}
