package com.Market.Flea.entity;

import lombok.Data;

import java.io.Serializable;


@Data
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增主键
     */
    private Long id;

    /**
     * 管理员账号
     */
    private String accountNumber;

    /**
     * 密码
     */
    private String adminPassword;

    /**
     * 管理员名字
     */
    private String adminName;

}