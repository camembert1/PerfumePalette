package com.kh.perfumePalette.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

@Repository
public class OrderStoreImpl implements OrderStore {

	@Override
	public void insertOrder(SqlSession session, Order order) {
		session.insert("OrderMapper.insertOrder", order);
	}

	@Override
	public void insertOrderDetail(SqlSession session, OrderDetail oDetail) {
		session.insert("OrderMapper.insertOrderDetail", oDetail);
	}

	@Override
	public void insertOrderPayment(SqlSession session, OrderPayment oPayment) {
		session.insert("OrderMapper.insertOrderPayment", oPayment);
	}



}
