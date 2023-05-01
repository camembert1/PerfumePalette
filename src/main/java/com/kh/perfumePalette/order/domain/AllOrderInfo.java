package com.kh.perfumePalette.order.domain;

import java.sql.Timestamp;

public class AllOrderInfo {
	
	// ORDER_DETAIL
	private String 		orderNo;
	private int 		perfumeNo;
	private int			orderQuantity;
	private int 		reviewStatus;
	
	// ORDER
//	private String 		orderNo;
	private Timestamp 	orderDate;
	private String 		orderStatus;
	private int			memberNo;
	
	private String 		recipientName;
	private String 		recipientPhone;
	
	private String 		deliveryAddr;
	private String 		deliveryMsg;
	private String		trackingNo;
	
	// PAYMENT
	private String 		paymentNo;
//	private String		orderNo;
	
	private Timestamp 	paymentDate;
	private String		paymentMethod;
	private String		paymentStatus;
	
	private int			paymentAmount;
	private int			cancelAmount;
	
	private String		vbankNo;
	private String		vbankName;
	private Timestamp	vbankDate;
	
	// PERFUME
//	private int perfumeNo;					// 품번
	private String 		perfumeName;		// 품명
	private String 		perfumeBrand;		// 브랜드
	private int 		perfumeVolume;		// 용량
	private int 		perfumePrice;		// 가격
	private int 		perfumeQuantity;	// 수량
	private String 		pScentCategory;		// 향 분류
	private String 		pImageCategory;		// 이미지 분류
	private String 		pFilename;			// 파일 네임
	private String 		pFilerename;		// 파일 리네임
	private String 		pFilepath;			// 파일 경로
	private Timestamp 	perfumeDate;		// 등록일
	private int 		perfumeStatus;		// 노출 여부
	
	public AllOrderInfo() {}

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

	public int getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(int reviewStatus) {
		this.reviewStatus = reviewStatus;
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
		this.vbankDate = vbankDate;
	}

	public String getPerfumeName() {
		return perfumeName;
	}

	public void setPerfumeName(String perfumeName) {
		this.perfumeName = perfumeName;
	}

	public String getPerfumeBrand() {
		return perfumeBrand;
	}

	public void setPerfumeBrand(String perfumeBrand) {
		this.perfumeBrand = perfumeBrand;
	}

	public int getPerfumeVolume() {
		return perfumeVolume;
	}

	public void setPerfumeVolume(int perfumeVolume) {
		this.perfumeVolume = perfumeVolume;
	}

	public int getPerfumePrice() {
		return perfumePrice;
	}

	public void setPerfumePrice(int perfumePrice) {
		this.perfumePrice = perfumePrice;
	}

	public int getPerfumeQuantity() {
		return perfumeQuantity;
	}

	public void setPerfumeQuantity(int perfumeQuantity) {
		this.perfumeQuantity = perfumeQuantity;
	}

	public String getpScentCategory() {
		return pScentCategory;
	}

	public void setpScentCategory(String pScentCategory) {
		this.pScentCategory = pScentCategory;
	}

	public String getpImageCategory() {
		return pImageCategory;
	}

	public void setpImageCategory(String pImageCategory) {
		this.pImageCategory = pImageCategory;
	}

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	public String getpFilerename() {
		return pFilerename;
	}

	public void setpFilerename(String pFilerename) {
		this.pFilerename = pFilerename;
	}

	public String getpFilepath() {
		return pFilepath;
	}

	public void setpFilepath(String pFilepath) {
		this.pFilepath = pFilepath;
	}

	public Timestamp getPerfumeDate() {
		return perfumeDate;
	}

	public void setPerfumeDate(Timestamp perfumeDate) {
		this.perfumeDate = perfumeDate;
	}

	public int getPerfumeStatus() {
		return perfumeStatus;
	}

	public void setPerfumeStatus(int perfumeStatus) {
		this.perfumeStatus = perfumeStatus;
	}

	@Override
	public String toString() {
		return "AllOrderInfo [orderNo=" + orderNo + ", perfumeNo=" + perfumeNo + ", orderQuantity=" + orderQuantity
				+ ", reviewStatus=" + reviewStatus + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", memberNo=" + memberNo + ", recipientName=" + recipientName + ", recipientPhone=" + recipientPhone
				+ ", deliveryAddr=" + deliveryAddr + ", deliveryMsg=" + deliveryMsg + ", trackingNo=" + trackingNo
				+ ", paymentNo=" + paymentNo + ", paymentDate=" + paymentDate + ", paymentMethod=" + paymentMethod
				+ ", paymentStatus=" + paymentStatus + ", paymentAmount=" + paymentAmount + ", cancelAmount="
				+ cancelAmount + ", vbankNo=" + vbankNo + ", vbankName=" + vbankName + ", vbankDate=" + vbankDate
				+ ", perfumeName=" + perfumeName + ", perfumeBrand=" + perfumeBrand + ", perfumeVolume=" + perfumeVolume
				+ ", perfumePrice=" + perfumePrice + ", perfumeQuantity=" + perfumeQuantity + ", pScentCategory="
				+ pScentCategory + ", pImageCategory=" + pImageCategory + ", pFilename=" + pFilename + ", pFilerename="
				+ pFilerename + ", pFilepath=" + pFilepath + ", perfumeDate=" + perfumeDate + ", perfumeStatus="
				+ perfumeStatus + "]";
	}
	
	

}
