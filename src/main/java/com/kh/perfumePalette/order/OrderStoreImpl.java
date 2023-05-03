package com.kh.perfumePalette.order;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.order.domain.AllOrderInfo;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;

@Repository
public class OrderStoreImpl implements OrderStore {
	
	
	// 결제 정보 조회 by orderNo StoreLogic
	@Override
	public OrderPayment selectPaymentInfo(SqlSession session, String orderNo) {
		OrderPayment oPayment = session.selectOne("OrderMapper.selectPaymentInfo", orderNo);
		return oPayment;
	}
	
	
	// 카트 정보 조회 by cartNo StoreLogic
	@Override
	public Cart selectByCartNo(SqlSession session, int cartNo) {
		Cart cart = session.selectOne("OrderMapper.selectByCartNo", cartNo);
		return cart;
	}

	
	// 결제 성공 시 관련 정보 DB 저장 StoreLogic - 1
	@Override
	public void insertOrder(SqlSession session, Order order) {
		session.insert("OrderMapper.insertOrder", order);
	}

	// 결제 성공 시 관련 정보 DB 저장 StoreLogic - 2
	@Override
	public void insertOrderDetail(SqlSession session, OrderDetail oDetail) {
		session.insert("OrderMapper.insertOrderDetail", oDetail);
	}

	// 결제 성공 시 관련 정보 DB 저장 StoreLogic - 3
	@Override
	public void insertOrderPayment(SqlSession session, OrderPayment oPayment) {
		session.insert("OrderMapper.insertOrderPayment", oPayment);
	}


	// 주문 내역 조회 시 관련 모든 정보 조회 by memberNo StoreLogic
	@Override
	public List<AllOrderInfo> selectAllOrderInfo(SqlSession session, int memberNo) {
		List<AllOrderInfo> allList = session.selectList("OrderMapper.selectAllOrderInfo", memberNo);
		return allList;
	}


	//  결제 상태 업데이트 by orderNo StoreLogic
	@Override
	public int updatePaymentInfo(SqlSession session, OrderPayment pInfo) {
		int result = session.update("OrderMapper.updatePaymentInfo", pInfo);
		return result;
	}


	
	// ReviewWrite - 후기 작성 여부 확인을 위해 OrderDetail 조회 by orderNo, perfumeNo StoreLogic
	@Override
	public OrderDetail selectOrderDetailBy(SqlSession session, OrderDetail odInfo) {
		OrderDetail oDetail = session.selectOne("OrderMapper.selectOrderDetailBy", odInfo);
		return oDetail;
	}

}
