package trade.service.Impl;

import trade.entity.OrderAddress;
import trade.mapper.OrderAddressMapper;
import trade.service.OrderAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class OrderAddressServiceImpl implements OrderAddressService {
    @Resource
    private OrderAddressMapper orderAddressMapper;

    @Override
    public boolean addOrderAddress(OrderAddress orderAddressModel) {
        return orderAddressMapper.insert(orderAddressModel) == 1;
    }

    @Override
    public boolean updateOrderAddress(OrderAddress orderAddressModel) {
        orderAddressModel.setOrderId(null);
        return orderAddressMapper.updateByPrimaryKeySelective(orderAddressModel) == 1;
    }

    @Override
    public OrderAddress getOrderAddress(Long orderId) {
        return orderAddressMapper.selectByOrderId(orderId);
    }

}
