package com.pgs.model;

import java.io.Serializable;

/**
 * 类别表
 */
public class AcCategory implements Serializable {
    private Integer id;

    private Integer parentId;

    private String categoryName;

    private Integer level;

    private Integer orderlist;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getOrderlist() {
        return orderlist;
    }

    public void setOrderlist(Integer orderlist) {
        this.orderlist = orderlist;
    }
}