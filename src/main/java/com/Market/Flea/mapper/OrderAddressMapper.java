package com.Market.Flea.mapper;

import com.Market.Flea.entity.OrderAddress;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OrderAddressMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderAddress record);

    int insertSelective(OrderAddress record);

    OrderAddress selectByPrimaryKey(Long id);

    OrderAddress selectByOrderId(Long orderId);

    int updateByPrimaryKeySelective(OrderAddress record);

    int updateByPrimaryKey(OrderAddress record);
}
