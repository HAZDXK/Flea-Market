package com.Market.Flea.service.Impl;

import com.Market.Flea.entity.IdleItem;
import com.Market.Flea.entity.User;
import com.Market.Flea.mapper.IdleItemMapper;
import com.Market.Flea.mapper.UserMapper;
import com.Market.Flea.service.IdleItemService;
import com.Market.Flea.vo.PageVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class IdleItemServiceImpl implements IdleItemService {
    @Resource
    private IdleItemMapper idleItemMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public boolean addIdleItem(IdleItem idleItem) {
        return idleItemMapper.insert(idleItem) == 1;
    }

    @Override
    public IdleItem getIdleItem(Long id) {
        IdleItem idleItem = idleItemMapper.selectByPrimaryKey(id);
        if (idleItem != null) {
            idleItem.setUser(userMapper.selectByPrimaryKey(idleItem.getUserId()));
        }
        return idleItem;
    }

    @Override
    public List<IdleItem> getAllIdelItem(Long userId) {
        return idleItemMapper.getAllIdleItem(userId);
    }

    @Override
    public PageVo<IdleItem> findIdleItem(String findValue, int page, int nums) {
        List<IdleItem> list = idleItemMapper.findIdleItem(findValue, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItem(findValue);
        return new PageVo<>(list, count);
    }

    @Override
    public PageVo<IdleItem> findIdleItemByLable(int idleLabel, int page, int nums) {
        List<IdleItem> list = idleItemMapper.findIdleItemByLable(idleLabel, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItemByLable(idleLabel);
        return new PageVo<>(list, count);
    }

    @Override
    public boolean updateIdleItem(IdleItem idleItem) {
        return idleItemMapper.updateByPrimaryKeySelective(idleItem) == 1;
    }

    @Override
    public PageVo<IdleItem> adminGetIdleList(int status, int page, int nums) {
        List<IdleItem> list = idleItemMapper.getIdleItemByStatus(status, (page - 1) * nums, nums);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (IdleItem i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (IdleItem i : list) {
                i.setUser(map.get(i.getUserId()));
            }
        }
        int count = idleItemMapper.countIdleItemByStatus(status);
        return new PageVo<>(list, count);
    }
}
