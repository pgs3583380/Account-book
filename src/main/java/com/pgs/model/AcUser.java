package com.pgs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户表
 */
@Data
public class AcUser implements Serializable {
    private Integer id;

    private String username;

    private String password;

    private String createtime;

    private String updatetime;

    private String lastlogintime;
}