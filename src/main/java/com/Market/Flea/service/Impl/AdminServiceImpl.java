package com.Market.Flea.service.Impl;


import com.Market.Flea.entity.Admin;
import com.Market.Flea.mapper.AdminMapper;
import com.Market.Flea.service.AdminService;
import com.Market.Flea.vo.PageVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin login(String accountNumber, String adminPassword) {
        return adminMapper.login(accountNumber, adminPassword);
    }

    @Override
    public PageVo<Admin> getAdminList(int page, int nums) {
        List<Admin> list = adminMapper.getList((page - 1) * nums, nums);
        int count = adminMapper.getCount();
        return new PageVo<>(list, count);
    }

    @Override
    public boolean addAdmin(Admin admin) {
        return adminMapper.insert(admin) == 1;
    }
}
