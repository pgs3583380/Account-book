package com.pgs.vo;

import com.pgs.model.AcPayments;

/**
 * Created by Administrator on 2017/6/22.
 * 流水表扩展类
 */
public class AcPaymentsVo extends AcPayments {
    private String startTime;

    private String endTime;

    private String categoryName;

    private String Year;

    private int months;

    private String moneys;

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getYear() {
        return Year;
    }

    public void setYear(String year) {
        Year = year;
    }

    public int getMonths() {
        return months;
    }

    public void setMonths(int months) {
        this.months = months;
    }

    public String getMoneys() {
        return moneys;
    }

    public void setMoneys(String moneys) {
        this.moneys = moneys;
    }
}
