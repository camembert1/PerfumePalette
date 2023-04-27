package com.kh.perfumePalette.admin.aperfume;

import java.sql.Timestamp;

public class AdPerfume {
	
	private int perfumeNo;			// 품번
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
	
	private int wishNo;				// 찜 번호
	private Timestamp wishDate;		// 찜 날짜
	private int wishCount;			// 찜 수
	
	private int cartNo;				// 장바구니 번호
	private int cartQuantity;		// 물품 수량
	private Timestamp cartDate;		// 장바구니 등록일
	private int cartCount;			// 장바구니 수
	
	private String memberId;		// 회원 아이디

	public AdPerfume() {}

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

	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}

	public Timestamp getWishDate() {
		return wishDate;
	}

	public void setWishDate(Timestamp wishDate) {
		this.wishDate = wishDate;
	}

	public int getWishCount() {
		return wishCount;
	}

	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
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

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AdPerfume [perfumeNo=" + perfumeNo + ", perfumeName=" + perfumeName + ", perfumeBrand=" + perfumeBrand
				+ ", perfumeVolume=" + perfumeVolume + ", perfumePrice=" + perfumePrice + ", perfumeQuantity="
				+ perfumeQuantity + ", pScentCategory=" + pScentCategory + ", pImageCategory=" + pImageCategory
				+ ", pFilename=" + pFilename + ", pFilerename=" + pFilerename + ", pFilepath=" + pFilepath
				+ ", perfumeDate=" + perfumeDate + ", perfumeStatus=" + perfumeStatus + ", wishNo=" + wishNo
				+ ", wishDate=" + wishDate + ", wishCount=" + wishCount + ", cartNo=" + cartNo + ", cartQuantity="
				+ cartQuantity + ", cartDate=" + cartDate + ", cartCount=" + cartCount + ", memberId=" + memberId + "]";
	}
	
	
	
	
}
