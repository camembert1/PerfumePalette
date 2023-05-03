package com.kh.perfumePalette.admin.aorder;

import java.util.List;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.admin.aorder.domain.AdOrder;

public interface AdOrderService {

	/**
	 * 주문내역 페이징 Service
	 * 
	 * @return int
	 */
	int getOrderListCount();

	/**
	 * 주문내역 Service
	 * 
	 * @param pi
	 * @return List<AdOrder>
	 */
	List<AdOrder> selectAdminOrderList(PageInfo pi);

	/**
	 * 주문내역 상세조회 Service
	 * @param orderNo
	 * @return List<AdOrder>
	 */
	List<AdOrder> selectOneByNo(long orderNo);

}
