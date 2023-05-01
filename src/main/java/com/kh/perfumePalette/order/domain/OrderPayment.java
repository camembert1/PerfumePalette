package com.kh.perfumePalette.order.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderPayment {
	
	
	// PAYMENT_TBL
	
	private String 		paymentNo;
	private String		orderNo;
	
	private Timestamp 	paymentDate;
	private String		paymentMethod;
	private String		paymentStatus;
	
	private int			paymentAmount;
	private int			cancelAmount;
	
	private String		vbankNo;
	private String		vbankName;
	private Timestamp	vbankDate;
	
	// for TimeStamp
	private long 		paymentDateMilis;
	private long 		vbankDateMilis;
	
	
	public OrderPayment() {}
	public OrderPayment(
			String paymentNo
			, String orderNo
			, String paymentMethod
			, String paymentStatus
			, int paymentAmount
			, int cancelAmount
			, String vbankNo
			, String vbankName
			
			, long paymentDateMilis
			, long vbankDateMilis) {
		
		super();
		
		this.paymentNo = paymentNo;
		this.orderNo = orderNo;
		this.paymentDate = new Timestamp(paymentDateMilis);
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
		this.paymentAmount = paymentAmount;
		this.cancelAmount = cancelAmount;
		this.vbankNo = vbankNo;
		this.vbankName = vbankName;
		this.vbankDate = new Timestamp(vbankDateMilis);
	}
	
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		if(this.paymentDateMilis != 0) this.paymentDate = new Timestamp(this.paymentDateMilis);
		else this.paymentDate = paymentDate;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public int getCancelAmount() {
		return cancelAmount;
	}
	public void setCancelAmount(int cancelAmount) {
		this.cancelAmount = cancelAmount;
	}
	public String getVbankNo() {
		return vbankNo;
	}
	public void setVbankNo(String vbankNo) {
		this.vbankNo = vbankNo;
	}
	public String getVbankName() {
		return vbankName;
	}
	public void setVbankName(String vbankName) {
		this.vbankName = vbankName;
	}
	public Timestamp getVbankDate() {
		return vbankDate;
	}
	public void setVbankDate(Timestamp vbankDate) {
		if(this.vbankDateMilis != 0) this.vbankDate = new Timestamp(this.vbankDateMilis);
		else this.vbankDate = vbankDate;
	}
	public long getPaymentDateMilis() {
		return paymentDateMilis;
	}
	public void setPaymentDateMilis(long paymentDateMilis) {
		this.paymentDateMilis = paymentDateMilis;
	}
	public long getVbankDateMilis() {
		return vbankDateMilis;
	}
	public void setVbankDateMilis(long vbankDateMilis) {
		this.vbankDateMilis = vbankDateMilis;
	}
	@Override
	public String toString() {
		return "OrderPayment [paymentNo=" + paymentNo + ", orderNo=" + orderNo + ", paymentDate=" + paymentDate
				+ ", paymentMethod=" + paymentMethod + ", paymentStatus=" + paymentStatus + ", paymentAmount="
				+ paymentAmount + ", cancelAmount=" + cancelAmount + ", vbankNo=" + vbankNo + ", vbankName=" + vbankName
				+ ", vbankDate=" + vbankDate + ", paymentDateMilis=" + paymentDateMilis + ", vbankDateMilis="
				+ vbankDateMilis + "]";
	}


	
	
	
	
	
}
