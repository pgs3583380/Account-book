package com.pgs.mapper;

import com.pgs.model.AcUser;
import org.springframework.stereotype.Component;

@Component
public interface AcUserMapper {
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