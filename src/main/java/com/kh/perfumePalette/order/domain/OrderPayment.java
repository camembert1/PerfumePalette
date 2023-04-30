package com.kh.perfumePalette.order.domain;

import java.sql.Timestamp;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderPayment {
	
	
	// PAYMENT_TBL
	
	private String 		paymentNo;
	private String		orderNo;
	private Timestamp 	paymentDate;
	private String		paymentMethod;
	private int			paymentAmount;
	
	// for Timestamp
	private long 		paymentDateMilis;
	
	
	public OrderPayment() {}
	public OrderPayment(
			String paymentNo
			, String orderNo
			, String paymentMethod
			, int paymentAmount
			
			, long paymentDateMilis) {
		
		super();
		
		this.paymentNo = paymentNo;
		this.orderNo = orderNo;
		this.paymentDate = new Timestamp(paymentDateMilis);
		this.paymentMethod = paymentMethod;
		this.paymentAmount = paymentAmount;
	}


	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public Timestamp getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(long paymentDateMilis) {
		this.paymentDate =  new Timestamp(this.paymentDateMilis);
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public long getPaymentDateMilis() {
		return paymentDateMilis;
	}

	public void setPaymentDateMilis(long paymentDateMilis) {
		this.paymentDateMilis = paymentDateMilis;
	}
	
	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", orderNo=" + orderNo + ", paymentDate=" + paymentDate
				+ ", paymentMethod=" + paymentMethod + ", paymentAmount=" + paymentAmount + ", paymentDateMilis="
				+ paymentDateMilis + "]";
	}

	
	
}
