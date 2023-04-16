package com.kh.perfumePalette.cart;

import java.sql.Timestamp;

public class Cart {
	
	private int cartNo;
	private int cartQuantity;
	private Timestamp cartDate;
	private String memberId;
	private int perfumeNo;
	private String perfumeName;		// 품명
	private String perfumeBrand;	// 브랜드
	private int perfumeVolume;		// 용량
	private int perfumePrice;		// 가격
	private int perfumeQuantity;	// 수량
	private String pScentCategory;	// 향 분류
	private String pImageCategory;	// 이미지 분류
	private String pFilename;		// 파일 네임
	private String pFilerename;		// 파일 리네임
	private String pFilepath;		// 파일 경로
	private Timestamp perfumeDate;	// 등록일
	private int perfumeStatus;		// 노출 여부

	
	public Cart() {
		super();
	}


	public Cart(int cartNo, int cartQuantity, Timestamp cartDate, String memberId, int perfumeNo, String perfumeName,
			String perfumeBrand, int perfumeVolume, int perfumePrice, int perfumeQuantity, String pScentCategory,
			String pImageCategory, String pFilename, String pFilerename, String pFilepath, Timestamp perfumeDate,
			int perfumeStatus) {
		super();
		this.cartNo = cartNo;
		this.cartQuantity = cartQuantity;
		this.cartDate = cartDate;
		this.memberId = memberId;
		this.perfumeNo = perfumeNo;
		this.perfumeName = perfumeName;
		this.perfumeBrand = perfumeBrand;
		this.perfumeVolume = perfumeVolume;
		this.perfumePrice = perfumePrice;
		this.perfumeQuantity = perfumeQuantity;
		this.pScentCategory = pScentCategory;
		this.pImageCategory = pImageCategory;
		this.pFilename = pFilename;
		this.pFilerename = pFilerename;
		this.pFilepath = pFilepath;
		this.perfumeDate = perfumeDate;
		this.perfumeStatus = perfumeStatus;
	}


	public int getCartNo() {
		return cartNo;
	}


	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}


	public int getCartQuantity() {
		return cartQuantity;
	}


	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}


	public Timestamp getCartDate() {
		return cartDate;
	}


	public void setCartDate(Timestamp cartDate) {
		this.cartDate = cartDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getPerfumeNo() {
		return perfumeNo;
	}


	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
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
		return "Cart [cartNo=" + cartNo + ", cartQuantity=" + cartQuantity + ", cartDate=" + cartDate + ", memberId="
				+ memberId + ", perfumeNo=" + perfumeNo + ", perfumeName=" + perfumeName + ", perfumeBrand="
				+ perfumeBrand + ", perfumeVolume=" + perfumeVolume + ", perfumePrice=" + perfumePrice
				+ ", perfumeQuantity=" + perfumeQuantity + ", pScentCategory=" + pScentCategory + ", pImageCategory="
				+ pImageCategory + ", pFilename=" + pFilename + ", pFilerename=" + pFilerename + ", pFilepath="
				+ pFilepath + ", perfumeDate=" + perfumeDate + ", perfumeStatus=" + perfumeStatus + "]";
	}

}
