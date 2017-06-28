package com.pgs.service.impl;

import com.pgs.mapper.AcPaymentsMapper;
import com.pgs.model.AcPayments;
import com.pgs.service.AcPaymentsService;
import com.pgs.vo.AcPaymentsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<AcPaymentsVo> selectByCondition(AcPaymentsVo vo) {
        return acPaymentsMapper.selectByCondition(vo);
    }

    @Override
    public List<AcPaymentsVo> selectPayAndIncome(AcPaymentsVo vo) {
        return acPaymentsMapper.selectPayAndIncome(vo);
    }

    @Override
    public List<AcPaymentsVo> selectForStats(AcPaymentsVo vo) {
        return acPaymentsMapper.selectForStats(vo);
    }

    @Override
    public int selectAllDays(Integer userId) {
        return acPaymentsMapper.selectAllDays(userId);
    }
}
