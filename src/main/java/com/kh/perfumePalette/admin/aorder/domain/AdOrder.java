package com.kh.perfumePalette.admin.aorder.domain;

import java.sql.Timestamp;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AdOrder {
	
	
	// ORDER_TBL
	
	private String 		orderNo;			// 주문 번호.
	private Timestamp 	orderDate;			// 주문 일자.
	private String 		orderStatus;		// 주문 상태.(임금대기, 결제완료, 배송준비중, 배송중, 배송완료, 취소)
	private int			memberNo;			// 회원 넘버.
	private String 		recipientName;		// 수취인 이름.
	private String 		recipientPhone;		// 수취인 번호.
	private String 		deliveryAddr;		// 배송 주소.
	private String 		deliveryMsg;		// 배송 메세지.
	private String		trackingNo;			// 송장 번호
	
	// ORDER_DETAIL_TBL
	
	private int 		perfumeNo;			// 향수 번호
	private int			orderQuantity;		// 주문 수량
	private int			perfumePrice;		// 향수 가격
	private int			reviewStatus;		// 리뷰 작성 여부(0,1)
	
	// PAYMENT_TBL
	
	private String 		paymentNo;			// 결제 번호
	private Timestamp 	paymentDate;		// 결제 날짜
	private String		paymentMethod;		// 결제 수단(vbank, card, point ...)
	private String		paymentStatus;		// 지불 체크(ready, paid, cancelled, failed)
	private int			paymentAmount;		// 결제 금액
	private int			cancelAmount; 		// 취소 금액
	private String		vBankNo;			// 계좌 번호
	private String		vBankName;			// 은행명
	private Timestamp	vBankDate;			// 계좌 입금기한
	
	// MEMBER_TBL
	
	private String 		memberName;			// 멤버 이름
	private String 		memberPhone;		// 멤버 전화번호
	
	// PERFUME_TBL
	
	private String 		perfumeBrand;		// 향수 브랜드
	private String		perfumeName;		// 향수 이름
	
	
	// for Timestamp
	private long  		orderDateMilis;


	public AdOrder() {}


	public AdOrder(String orderNo, Timestamp orderDate, String orderStatus, int memberNo, String recipientName,
			String recipientPhone, String deliveryAddr, String deliveryMsg, String trackingNo, int perfumeNo,
			int orderQuantity, int perfumePrice, int reviewStatus, String paymentNo, Timestamp paymentDate,
			String paymentMethod, String paymentStatus, int paymentAmount, int cancelAmount, String vBankNo,
			String vBankName, Timestamp vBankDate, String memberName, String memberPhone, String perfumeBrand,
			String perfumeName, long orderDateMilis) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.memberNo = memberNo;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.deliveryAddr = deliveryAddr;
		this.deliveryMsg = deliveryMsg;
		this.trackingNo = trackingNo;
		this.perfumeNo = perfumeNo;
		this.orderQuantity = orderQuantity;
		this.perfumePrice = perfumePrice;
		this.reviewStatus = reviewStatus;
		this.paymentNo = paymentNo;
		this.paymentDate = paymentDate;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
		this.paymentAmount = paymentAmount;
		this.cancelAmount = cancelAmount;
		this.vBankNo = vBankNo;
		this.vBankName = vBankName;
		this.vBankDate = vBankDate;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.perfumeBrand = perfumeBrand;
		this.perfumeName = perfumeName;
		this.orderDateMilis = orderDateMilis;
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
		this.orderDate = orderDate;
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


	public String getTrackingNo() {
		return trackingNo;
	}


	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
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


	public int getReviewStatus() {
		return reviewStatus;
	}


	public void setReviewStatus(int reviewStatus) {
		this.reviewStatus = reviewStatus;
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


	public String getvBankNo() {
		return vBankNo;
	}


	public void setvBankNo(String vBankNo) {
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


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public String getPerfumeBrand() {
		return perfumeBrand;
	}


	public void setPerfumeBrand(String perfumeBrand) {
		this.perfumeBrand = perfumeBrand;
	}


	public String getPerfumeName() {
		return perfumeName;
	}


	public void setPerfumeName(String perfumeName) {
		this.perfumeName = perfumeName;
	}


	public long getOrderDateMilis() {
		return orderDateMilis;
	}


	public void setOrderDateMilis(long orderDateMilis) {
		this.orderDateMilis = orderDateMilis;
	}


	@Override
	public String toString() {
		return "AdOrder [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", memberNo=" + memberNo + ", recipientName=" + recipientName + ", recipientPhone=" + recipientPhone
				+ ", deliveryAddr=" + deliveryAddr + ", deliveryMsg=" + deliveryMsg + ", trackingNo=" + trackingNo
				+ ", perfumeNo=" + perfumeNo + ", orderQuantity=" + orderQuantity + ", perfumePrice=" + perfumePrice
				+ ", reviewStatus=" + reviewStatus + ", paymentNo=" + paymentNo + ", paymentDate=" + paymentDate
				+ ", paymentMethod=" + paymentMethod + ", paymentStatus=" + paymentStatus + ", paymentAmount="
				+ paymentAmount + ", cancelAmount=" + cancelAmount + ", vBankNo=" + vBankNo + ", vBankName=" + vBankName
				+ ", vBankDate=" + vBankDate + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", perfumeBrand=" + perfumeBrand + ", perfumeName=" + perfumeName + ", orderDateMilis="
				+ orderDateMilis + "]";
	}




}
