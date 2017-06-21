package com.pgs.service.impl;

import com.pgs.mapper.AcPaymentsMapper;
import com.pgs.model.AcPayments;
import com.pgs.service.AcPaymentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/6/21.
 */
@Service
public class AcPaymentsServiceImpl implements AcPaymentsService {
    @Autowired
    private AcPaymentsMapper acPaymentsMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return acPaymentsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(AcPayments record) {
        return acPaymentsMapper.insertSelective(record);
    }

    @Override
    public AcPayments selectByPrimaryKey(Integer id) {
        return acPaymentsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AcPayments record) {
        return acPaymentsMapper.updateByPrimaryKeySelective(record);
    }
}
