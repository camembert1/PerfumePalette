package com.kh.perfumePalette.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.order.domain.AllOrderInfo;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderStore oStore;
	
	@Autowired
	private SqlSession session;
	
	
	// 결제 정보 조회 by orderNo ServiceImpl
	@Override
	public OrderPayment selectPaymentInfo(String orderNo) {
		OrderPayment oPayment = oStore.selectPaymentInfo(session, orderNo);
		return oPayment;
	}

	
	// 카트 정보 조회 by cartNo ServiceImple
	@Override
	public Cart selectByCartNo(int cartNo) {
		Cart cart = oStore.selectByCartNo(session, cartNo);
		return cart;
	}

	
	// 결제 성공 시 관련 정보 DB 저장 ServiceImpl
	@Override
	public int paySuccess(Order order, List<OrderDetail> oDetails, OrderPayment oPayment) {
		
		// oStore.insertOrder(session, order);
		oStore.insertOrder(session, order);
		
		for (OrderDetail oDetail : oDetails) {
			oStore.insertOrderDetail(session, oDetail);
		}
		
		oStore.insertOrderPayment(session, oPayment);
		
		return 1;
	}


	// 주문 내역 조회 시 관련 모든 정보 조회 by memberNo ServiceImpl
	@Override
	public List<AllOrderInfo> selectAllOrderInfo(int memberNo) {
		List<AllOrderInfo> allList = oStore.selectAllOrderInfo(session, memberNo);
		return allList;
	}


	// 결제 상태 업데이트 by orderNo ServiceImpl
	@Override
	public int updatePaymentInfo(OrderPayment pInfo) {
		int result = oStore.updatePaymentInfo(session, pInfo);
		return result;
	}

	// ReviewWrite - 후기 작성 여부 확인을 위해 OrderDetail 조회 by orderNo, perfumeNo ServiceImpl
	@Override
	public OrderDetail selectOrderDetailBy(OrderDetail odInfo) {
		OrderDetail oDetail = oStore.selectOrderDetailBy(session, odInfo);
		return oDetail;
	}

}
