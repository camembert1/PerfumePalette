package com.kh.perfumePalette.order.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderDetail {
	

	// ORDER_DETAIL_TBL
	
	private String 		orderNo;
	private int 		perfumeNo;
	private int			orderQuantity;
	private int			perfumePrice;
	
	
	public OrderDetail() {}
	public OrderDetail(
			String orderNo
			, int perfumeNo
			, int orderQuantity
			, int perfumePrice) {
		
		super();
		this.orderNo = orderNo;
		this.perfumeNo = perfumeNo;
		this.orderQuantity = orderQuantity;
		this.perfumePrice = perfumePrice;
	}


	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getPerfumeNo() {
		return perfumeNo;
	}

	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public int getPerfumePrice() {
		return perfumePrice;
	}

	public void setPerfumePrice(int perfumePrice) {
		this.perfumePrice = perfumePrice;
	}
	
	@Override
	public String toString() {
		return "OrderDetail [orderNo=" + orderNo + ", perfumeNo=" + perfumeNo + ", orderQuantity=" + orderQuantity
				+ ", perfumePrice=" + perfumePrice + "]";
	}

}
