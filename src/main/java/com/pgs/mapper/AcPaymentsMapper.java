package com.pgs.mapper;

import com.pgs.model.AcPayments;

public interface AcPaymentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcPayments record);

    AcPayments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcPayments record);

}