package com.kh.perfumePalette.order.domain;

import java.sql.Timestamp;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Order {
	
	
	// ORDER_TBL
	
	private String 		orderNo;
	private Timestamp 	orderDate;
	private String 		orderStatus;
	private int			memberNo;
	
	private String 		recipientName;
	private String 		recipientPhone;
	
	private String 		deliveryAddr;
	private String 		deliveryMsg;
	private String		trackingNo;
	
	// for TimeStamp
	private long  		orderDateMilis;


	public Order() {}
	public Order(
			String orderNo
			, String orderStatus
			, int memberNo
			, String recipientName
			, String recipientPhone
			, String deliveryAddr
			, String deliveryMsg
			, String trackingNo
			
			, long orderDateMilis) {
		
		super();
		this.orderNo = orderNo;
		this.orderDate = new Timestamp(orderDateMilis);
		this.orderStatus = orderStatus;
		this.memberNo = memberNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.deliveryAddr = deliveryAddr;
		this.deliveryMsg = deliveryMsg;
		this.trackingNo = trackingNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = new Timestamp(this.orderDateMilis);
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getDeliveryMsg() {
		return deliveryMsg;
	}

	public void setDeliveryMsg(String deliveryMsg) {
		this.deliveryMsg = deliveryMsg;
	}

	public long getOrderDateMilis() {
		return orderDateMilis;
	}

	public void setOrderDateMilis(long orderDateMilis) {
		this.orderDateMilis = orderDateMilis;
	}
	
	public String getTrackingNo() {
		return trackingNo;
	}
	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", memberNo="
				+ memberNo + ", recipientName=" + recipientName + ", recipientPhone=" + recipientPhone
				+ ", deliveryAddr=" + deliveryAddr + ", deliveryMsg=" + deliveryMsg + ", trackingNo=" + trackingNo
				+ ", orderDateMilis=" + orderDateMilis + "]";
	}
	
	
	
}
