package com.pgs.mapper;

import com.pgs.model.AcPayments;
import com.pgs.vo.AcPaymentsVo;

import java.util.List;

public interface AcPaymentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AcPayments record);

    int insertSelective(AcPayments record);

    AcPayments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcPayments record);

    int updateByPrimaryKey(AcPayments record);

    /**
     * 根据条件查询相关的流水信息
     */
    List<AcPaymentsVo> selectByCondition(AcPaymentsVo vo);
}