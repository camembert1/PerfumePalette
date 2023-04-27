package com.kh.perfumePalette.order;

import java.util.List;

import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

public interface OrderService {

	int paySuccess(Order order, List<OrderDetail> oDetails, OrderPayment oPayment);



}
