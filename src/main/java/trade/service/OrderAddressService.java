package trade.service;

import trade.entity.OrderAddress;


public interface OrderAddressService {
    /**
     * 为订单添加地址信息
     *
     * @param orderAddress 订单地址信息
     * @return 结果
     */
    boolean addOrderAddress(OrderAddress orderAddress);

    /**
     * 更新订单的地址信息
     *
     * @param orderAddress 订单信息
     * @return 结果
     */
    boolean updateOrderAddress(OrderAddress orderAddress);

    /**
     * 获取订单的地址信息
     *
     * @param orderId 订单id
     * @return 订单地址信息
     */
    OrderAddress getOrderAddress(Long orderId);

}
