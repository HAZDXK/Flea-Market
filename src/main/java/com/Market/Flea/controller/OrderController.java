package com.Market.Flea.controller;

import com.Market.Flea.entity.Order;
import com.Market.Flea.enums.ErrorMsg;
import com.Market.Flea.service.OrderService;
import com.Market.Flea.utils.IdFactoryUtil;
import com.Market.Flea.utils.OrderTaskHandler;
import com.Market.Flea.vo.R;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;


@CrossOrigin
@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    /**
     * 添加订单
     *
     * @param shUserId 用户id
     * @param order    订单信息
     * @return 添加结果
     */
    @PostMapping("/add")
    public R addOrder(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestBody Order order
    ) {
        if (OrderTaskHandler.orderService == null) {
            OrderTaskHandler.orderService = orderService;
        }
        order.setOrderNumber(IdFactoryUtil.getOrderId());
        order.setCreateTime(new Date());
        order.setUserId(Long.valueOf(shUserId));
        order.setOrderStatus((byte) 0);
        order.setPaymentStatus((byte) 0);
        if (orderService.addOrder(order)) {
            return R.success(order);
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }

    /**
     * 获取订单信息
     *
     * @param shUserId 用户id
     * @param id       订单id
     * @return 订单信息
     */
    @GetMapping("/info")
    public R getOrderInfo(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestParam Long id
    ) {
        Order order = orderService.getOrder(id);
        if (order.getUserId().equals(Long.valueOf(shUserId)) ||
                order.getIdleItem().getUserId().equals(Long.valueOf(shUserId))) {
            return R.success(order);
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }

    /**
     * 更新订单信息
     *
     * @param shUserId 用户id
     * @param order    订单信息
     * @return
     */
    @PostMapping("/update")
    public R updateOrder(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestBody Order order
    ) {
        if (order.getPaymentStatus() != null && order.getPaymentStatus().equals((byte) 1)) {
            order.setPaymentTime(new Date());
        }
        if (orderService.updateOrder(order)) {
            return R.success(order);
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }

    /**
     * 获取我的订单
     *
     * @param shUserId 用户id
     * @return 订单信息
     */
    @GetMapping("/my")
    public R getMyOrder(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId
    ) {
        return R.success(orderService.getMyOrder(Long.valueOf(shUserId)));
    }

    /**
     * 获取我的出售信息
     *
     * @param shUserId 用户id
     * @return 出售信息
     */
    @GetMapping("/my-sold")
    public R getMySoldIdle(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId
    ) {
        return R.success(orderService.getMySoldIdle(Long.valueOf(shUserId)));
    }
}
