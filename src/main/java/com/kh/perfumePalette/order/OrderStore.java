package com.kh.perfumePalette.order;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

public interface OrderStore {

	void insertOrder(SqlSession session, Order order);

	void insertOrderDetail(SqlSession session, OrderDetail oDetail);

	void insertOrderPayment(SqlSession session, OrderPayment oPayment);



}
