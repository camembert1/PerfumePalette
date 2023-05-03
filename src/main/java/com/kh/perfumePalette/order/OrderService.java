package com.kh.perfumePalette.order;

import java.util.List;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.order.domain.AllOrderInfo;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

public interface OrderService {

	
	// 결제 정보 조회 by orderNo Service
	OrderPayment selectPaymentInfo(String orderNo);
	
	
	// 카트 정보 조회 by cartNo Service
	Cart selectByCartNo(int cartNo);
	
	
	// 결제 성공 시 관련 정보 DB 저장 Service
	int paySuccess(Order order, List<OrderDetail> oDetails, OrderPayment oPayment);


	// 주문 내역 조회 시 관련 모든 정보 조회 by memberNo Service
	List<AllOrderInfo> selectAllOrderInfo(int memberNo);


	// 결제 상태 업데이트 by orderNo Service
	int updatePaymentInfo(OrderPayment pInfo);


	// ReviewWrite - 후기 작성 여부 확인을 위해 OrderDetail 조회 by orderNo, perfumeNo Service
	OrderDetail selectOrderDetailBy(OrderDetail odInfo);
	
}
