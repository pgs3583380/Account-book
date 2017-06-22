package com.pgs.service;

import com.pgs.model.AcPayments;
import com.pgs.vo.AcPaymentsVo;

import java.util.List;

/**
 * Created by Administrator on 2017/6/21.
 */
public interface AcPaymentsService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(AcPayments record);

    AcPayments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcPayments record);

    /**
     * 根据条件查询相关的流水信息
     */
    List<AcPaymentsVo> selectByCondition(AcPaymentsVo vo);
}
