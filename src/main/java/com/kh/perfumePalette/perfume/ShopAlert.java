package com.kh.perfumePalette.perfume;

import java.sql.Timestamp;

public class ShopAlert {
		
	private int 		alertNo;
	private String 		alertCategory;
	
	private int 		memberNo;
	private int 		perfumeNo;
	private int 		reviewNo;
	private int 		pCommentNo;
	
	private Timestamp 	aRequestDate;
	private Timestamp 	alertDate;
	private int 		aClickStatus;
	
	
	// for JOIN
	
	private String		perfumeName;
	private String		perfumeBrand;
	private String		reviewContents;
	private String		likeMemberNickname;
	private String		pCommentContent;
	
	public ShopAlert() {}

	public int getAlertNo() {
		return alertNo;
	}

	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}

	public String getAlertCategory() {
		return alertCategory;
	}

	public void setAlertCategory(String alertCategory) {
		this.alertCategory = alertCategory;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPerfumeNo() {
		return perfumeNo;
	}

	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getpCommentNo() {
		return pCommentNo;
	}

	public void setpCommentNo(int pCommentNo) {
		this.pCommentNo = pCommentNo;
	}

	public Timestamp getaRequestDate() {
		return aRequestDate;
	}

	public void setaRequestDate(Timestamp aRequestDate) {
		this.aRequestDate = aRequestDate;
	}

	public Timestamp getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(Timestamp alertDate) {
		this.alertDate = alertDate;
	}

	public int getaClickStatus() {
		return aClickStatus;
	}

	public void setaClickStatus(int aClickStatus) {
		this.aClickStatus = aClickStatus;
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

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public String getLikeMemberNickname() {
		return likeMemberNickname;
	}

	public void setLikeMemberNickname(String likeMemberNickname) {
		this.likeMemberNickname = likeMemberNickname;
	}

	public String getpCommentContent() {
		return pCommentContent;
	}

	public void setpCommentContent(String pCommentContent) {
		this.pCommentContent = pCommentContent;
	}

	@Override
	public String toString() {
		return "RestockAlert [alertNo=" + alertNo + ", alertCategory=" + alertCategory + ", memberNo=" + memberNo
				+ ", perfumeNo=" + perfumeNo + ", reviewNo=" + reviewNo + ", pCommentNo=" + pCommentNo
				+ ", aRequestDate=" + aRequestDate + ", alertDate=" + alertDate + ", aClickStatus=" + aClickStatus
				+ ", perfumeName=" + perfumeName + ", perfumeBrand=" + perfumeBrand + ", reviewContents="
				+ reviewContents + ", likeMemberNickname=" + likeMemberNickname + ", pCommentContent=" + pCommentContent
				+ "]";
	}

	
	
	

	
}
