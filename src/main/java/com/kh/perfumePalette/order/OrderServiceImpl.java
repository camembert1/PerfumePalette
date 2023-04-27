package com.kh.perfumePalette.order;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderStore oStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int paySuccess(Order order, List<OrderDetail> oDetails, OrderPayment oPayment) {
		
		oStore.insertOrder(session, order);
		
		for (OrderDetail oDetail : oDetails) {
			oStore.insertOrderDetail(session, oDetail);
		}
		
		oStore.insertOrderPayment(session, oPayment);
		
		return 1;
	}



}
