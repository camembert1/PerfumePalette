package com.kh.perfumePalette.order;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.order.domain.AllOrderInfo;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

public interface OrderStore {

	
	// 결제 정보 조회 by orderNo Store
	OrderPayment selectPaymentInfo(SqlSession session, String orderNo);
	
	
	// 카트 정보 조회 by cartNo Store
	Cart selectByCartNo(SqlSession session, int cartNo);
	
	
	// 결제 성공 시 관련 정보 DB 저장 Store
	void insertOrder(SqlSession session, Order order);
	void insertOrderDetail(SqlSession session, OrderDetail oDetail);
	void insertOrderPayment(SqlSession session, OrderPayment oPayment);

	
	// 주문 내역 조회 시 관련 모든 정보 조회 by memberNo Store
	List<AllOrderInfo> selectAllOrderInfo(SqlSession session, int memberNo);


	//  결제 상태 업데이트 by orderNo Store
	int updatePaymentInfo(SqlSession session, OrderPayment pInfo);


	
	// ReviewWrite - 후기 작성 여부 확인을 위해 OrderDetail 조회 by orderNo, perfumeNo Store
	OrderDetail selectOrderDetailBy(SqlSession session, OrderDetail odInfo);
}
