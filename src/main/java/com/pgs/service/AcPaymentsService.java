package com.pgs.service;

import com.pgs.model.AcPayments;

/**
 * Created by Administrator on 2017/6/21.
 */
public interface AcPaymentsService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcPayments record);

    AcPayments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcPayments record);
}
