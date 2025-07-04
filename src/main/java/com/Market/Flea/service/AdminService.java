package com.Market.Flea.service;


import com.Market.Flea.entity.Admin;
import com.Market.Flea.vo.PageVo;


public interface AdminService {

    /**
     * 管理员登录
     *
     * @param accountNumber 用户名
     * @param adminPassword 用户密码
     * @return 管理员信息
     */
    Admin login(String accountNumber, String adminPassword);

    /**
     * 查询管理员列表
     *
     * @param page 分页大小
     * @param nums 分页页数
     * @return
     */
    PageVo<Admin> getAdminList(int page, int nums);

    /**
     * 添加管理员
     *
     * @param admin 管理员信息
     * @return 添加结果
     */
    boolean addAdmin(Admin admin);


}
