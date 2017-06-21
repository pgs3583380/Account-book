package com.pgs.service;

import com.pgs.mapper.AcUserMapper;
import com.pgs.model.AcUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/6/21.
 */

public interface AcUserService {

    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcUser record);

    AcUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcUser record);

    /**
     * 通过用户名查询用户是否存在
     *
     * @param userName 用户名
     */
    AcUser selectUserByName(String userName);

}
