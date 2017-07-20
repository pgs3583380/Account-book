package com.pgs.model;

import lombok.Data;

import java.io.Serializable;

/**
 * 类别表
 */
@Data
public class AcCategory implements Serializable {
    private Integer id;

    private Integer parentId;

    private String categoryName;

    private Integer level;

    private Integer orderlist;
}