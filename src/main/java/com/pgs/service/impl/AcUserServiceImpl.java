package com.pgs.service.impl;

import com.pgs.mapper.AcUserMapper;
import com.pgs.model.AcUser;
import com.pgs.service.AcUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/6/21.
 */
@Service
public class AcUserServiceImpl implements AcUserService {
    @Autowired
    private AcUserMapper acUserMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return acUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(AcUser record) {
        return acUserMapper.insertSelective(record);
    }

    @Override
    public AcUser selectByPrimaryKey(Integer id) {
        return acUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AcUser record) {
        return acUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public AcUser selectUserByName(String userName) {
        return acUserMapper.selectUserByName(userName);
    }
}