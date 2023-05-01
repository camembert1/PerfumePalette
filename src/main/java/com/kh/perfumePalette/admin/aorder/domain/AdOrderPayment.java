package com.kh.perfumePalette.admin.aorder.domain;

import java.sql.Timestamp;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AdOrderPayment {
	
	
	// PAYMENT_TBL
	
	private String 		paymentNo;		// 결제 번호
	private String		orderNo;		// 주문 번호
	private Timestamp 	paymentDate;	// 결제 날짜
	private String		paymentMethod;	// 지불 방법
	private String		paymentStatus;	// 지불 체크(ready, paid)
	private int			paymentAmount;	// 지불 금액
	private int			cancelAmount; 	// 취소 금액
	private int			vBankNo;		// 은행 번호
	private String		vBankName;		// 은행 이름
	private Timestamp	vBankDate;		// 은행 날짜
	
	// for Timestamp
	private long 		paymentDateMilis; 
	
	
	public AdOrderPayment() {}


	public AdOrderPayment(String paymentNo, String orderNo, Timestamp paymentDate, String paymentMethod,
			String paymentStatus, int paymentAmount, int cancelAmount, int vBankNo, String vBankName,
			Timestamp vBankDate, long paymentDateMilis) {
		super();
		this.paymentNo = paymentNo;
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
		this.paymentAmount = paymentAmount;
		this.cancelAmount = cancelAmount;
		this.vBankNo = vBankNo;
		this.vBankName = vBankName;
		this.vBankDate = vBankDate;
		this.paymentDateMilis = paymentDateMilis;
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
		this.paymentDate = paymentDate;
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


	public int getvBankNo() {
		return vBankNo;
	}


	public void setvBankNo(int vBankNo) {
		this.vBankNo = vBankNo;
	}


	public String getvBankName() {
		return vBankName;
	}


	public void setvBankName(String vBankName) {
		this.vBankName = vBankName;
	}


	public Timestamp getvBankDate() {
		return vBankDate;
	}


	public void setvBankDate(Timestamp vBankDate) {
		this.vBankDate = vBankDate;
	}


	public long getPaymentDateMilis() {
		return paymentDateMilis;
	}


	public void setPaymentDateMilis(long paymentDateMilis) {
		this.paymentDateMilis = paymentDateMilis;
	}


	@Override
	public String toString() {
		return "AdOrderPayment [paymentNo=" + paymentNo + ", orderNo=" + orderNo + ", paymentDate=" + paymentDate
				+ ", paymentMethod=" + paymentMethod + ", paymentStatus=" + paymentStatus + ", paymentAmount="
				+ paymentAmount + ", cancelAmount=" + cancelAmount + ", vBankNo=" + vBankNo + ", vBankName=" + vBankName
				+ ", vBankDate=" + vBankDate + ", paymentDateMilis=" + paymentDateMilis + "]";
	}

	
	
	
}
