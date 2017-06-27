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

    /**
     * 根据条件查询相关的流水信息
     */
    List<AcPaymentsVo> selectByCondition(AcPaymentsVo vo);

    /**
     * 获取某时间段的总支出和总支出
     *
     * @param vo
     * @return
     */
    List<AcPaymentsVo> selectPayAndIncome(AcPaymentsVo vo);

    /**
     * 获取某时间段的二级支出和收入
     * @param vo
     * @return
     */
    List<AcPaymentsVo> selectForStats(AcPaymentsVo vo);

}