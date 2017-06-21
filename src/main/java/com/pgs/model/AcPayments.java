package com.pgs.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 流水表
 */
public class AcPayments implements Serializable {
    private Integer id;

    private Integer userid;

    private Date createtime;

    private Date updatetime;

    private Date time;

    private Integer categoryType;

    private Integer moneyType;

    private String remark;

    private BigDecimal money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(Integer categoryType) {
        this.categoryType = categoryType;
    }

    public Integer getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(Integer moneyType) {
        this.moneyType = moneyType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }
}