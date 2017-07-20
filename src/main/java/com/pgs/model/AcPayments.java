package com.pgs.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 流水表
 */
@Data
public class AcPayments implements Serializable {
    private Integer id;

    private Integer userid;

    private String createtime;

    private String updatetime;

    private String editTime;

    private Integer categoryType;

    private Integer categoryParent;

    private Integer moneyType;

    private String remark;

    private BigDecimal money;
}