package com.Market.Flea.service.Impl;

import com.Market.Flea.entity.IdleItem;
import com.Market.Flea.entity.Message;
import com.Market.Flea.entity.User;
import com.Market.Flea.mapper.IdleItemMapper;
import com.Market.Flea.mapper.MessageMapper;
import com.Market.Flea.mapper.UserMapper;
import com.Market.Flea.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class MessageServiceImpl implements MessageService {
    @Resource
    private MessageMapper messageMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private IdleItemMapper idleItemMapper;

    @Override
    public boolean addMessage(Message message) {
        return messageMapper.insert(message) == 1;
    }

    @Override
    public boolean deleteMessage(Long id) {
        return messageMapper.deleteByPrimaryKey(id) == 1;
    }

    @Override
    public Message getMessage(Long id) {
        return messageMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Message> getAllMyMessage(Long userId) {
        List<Message> list = messageMapper.getMyMessage(userId);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (Message i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (Message i : list) {
                i.setFromU(map.get(i.getUserId()));
            }

            List<Long> idleIdList = new ArrayList<>();
            for (Message i : list) {
                idleIdList.add(i.getIdleId());
            }
            List<IdleItem> idleList = idleItemMapper.findIdleByList(idleIdList);
            Map<Long, IdleItem> idleMap = new HashMap<>();
            for (IdleItem idle : idleList) {
                idleMap.put(idle.getId(), idle);
            }
            for (Message i : list) {
                i.setIdle(idleMap.get(i.getIdleId()));
            }
        }
        return list;
    }

    @Override
    public List<Message> getAllIdleMessage(Long idleId) {
        List<Message> list = messageMapper.getIdleMessage(idleId);
        if (list.size() > 0) {
            List<Long> idList = new ArrayList<>();
            for (Message i : list) {
                idList.add(i.getUserId());
            }
            List<User> userList = userMapper.findUserByList(idList);
            Map<Long, User> map = new HashMap<>();
            for (User user : userList) {
                map.put(user.getId(), user);
            }
            for (Message i : list) {
                i.setFromU(map.get(i.getUserId()));
            }
            Map<Long, Message> mesMap = new HashMap<>();
            for (Message i : list) {
                mesMap.put(i.getId(), i);
            }
            for (Message i : list) {
                Message toM = new Message();
                User toU = new User();
                if (i.getToMessage() != null) {
                    toM.setContent(mesMap.get(i.getToMessage()).getContent());
                    toU.setNickname(map.get(i.getToUser()).getNickname());
                }
                i.setToM(toM);
                i.setToU(toU);
            }
        }
        return list;
    }
}
