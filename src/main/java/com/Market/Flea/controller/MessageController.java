package com.Market.Flea.controller;

import com.Market.Flea.entity.Message;
import com.Market.Flea.enums.ErrorMsg;
import com.Market.Flea.service.MessageService;
import com.Market.Flea.vo.R;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;


@CrossOrigin
@RestController
@RequestMapping("/message")
public class MessageController {
    @Resource
    private MessageService messageService;

    /**
     * 发送留言
     *
     * @param shUserId 用户id
     * @param message  留言信息
     * @return 发送结果
     */
    @PostMapping("/send")
    public R sendMessage(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestBody Message message
    ) {
        message.setUserId(Long.valueOf(shUserId));
        message.setCreateTime(new Date());
        if (messageService.addMessage(message)) {
            return R.success(message);
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }

    /**
     * 查询留言信息
     *
     * @param id 留言id
     * @return 留言信息
     */
    @GetMapping("/info")
    public R getMessage(@RequestParam Long id) {
        return R.success(messageService.getMessage(id));
    }

    /**
     * 获取某个用户收到的所有留言
     *
     * @param idleId 闲置
     * @return 用户留言
     */
    @GetMapping("/idle")
    public R getAllIdleMessage(@RequestParam Long idleId) {
        return R.success(messageService.getAllIdleMessage(idleId));
    }

    /**
     * 获取我的留言
     *
     * @param shUserId 用户id
     * @return 留言
     */
    @GetMapping("/my")
    public R getAllMyMessage(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId
    ) {
        return R.success(messageService.getAllMyMessage(Long.valueOf(shUserId)));
    }

    /**
     * 删除留言
     *
     * @param id 留言id
     * @return 删除结果
     */
    @GetMapping("/delete")
    public R deleteMessage(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @RequestParam Long id
    ) {
        if (messageService.deleteMessage(id)) {
            return R.success();
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }
}
