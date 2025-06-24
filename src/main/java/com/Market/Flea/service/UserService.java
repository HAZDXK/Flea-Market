package com.Market.Flea.service;

import com.Market.Flea.entity.User;
import com.Market.Flea.vo.PageVo;


public interface UserService {

    /**
     * 获取某个用户的公开信息
     *
     * @param id 用户id
     * @return 用户的公开信息
     */
    User getUser(Long id);

    /**
     * 登录
     *
     * @param accountNumber 账号
     * @param userPassword  密码
     * @return 结果
     */
    User userLogin(String accountNumber, String userPassword);

    /**
     * 注册
     *
     * @param user 用户信息
     * @return 结果
     */
    boolean userSignIn(User user);

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    boolean updateUserInfo(User user);

    /**
     * 修改密码
     *
     * @param newPassword 新密码
     * @param oldPassword 旧密码
     * @param id 用户id
     * @return 结果
     */
    boolean updatePassword(String newPassword, String oldPassword, Long id);

    PageVo<User> getUserByStatus(int status, int page, int nums);

}
