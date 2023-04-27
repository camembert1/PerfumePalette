package com.kh.perfumePalette.review;

import java.sql.Timestamp;

import oracle.sql.CLOB;


public class Review {
	private int reviewNo; // 후기 번호
	private int perfumeNo; // 향수 번호
	private int memberNo;  // 작성자(MEMBER_NO)
	
	private String reviewContents;  //후기 내용
	private Timestamp reviewDate;  //후기 작성일
	private String rFilename;      //파일 네임
	
	private String fFilerename;    //파일 리네임
	private String rFilepath;      //파일 경로
	private int rViewcount;       //조회수
	
	private int rViewscore;       //별점
	private String memberNickname; //멤버 닉네임
	private String perfumeBrand;  //향수 브랜드
	
	private String perfumeName;   //향수 이름
	private int perfumePrice;     //향수 가격
	private String pScentCategory;	// 향 분류
	private String pFilerename;	 
	
	public Review() {}

	public Review(int reviewNo, int perfumeNo, int memberNo, String reviewContents, Timestamp reviewDate,
			String rFilename, String fFilerename, String rFilepath, int rViewcount, int rViewscore,
			String memberNickname, String perfumeBrand, String perfumeName, int perfumePrice, String pScentCategory,
			String pFilerename) {
		super();
		this.reviewNo = reviewNo;
		this.perfumeNo = perfumeNo;
		this.memberNo = memberNo;
		this.reviewContents = reviewContents;
		this.reviewDate = reviewDate;
		this.rFilename = rFilename;
		this.fFilerename = fFilerename;
		this.rFilepath = rFilepath;
		this.rViewcount = rViewcount;
		this.rViewscore = rViewscore;
		this.memberNickname = memberNickname;
		this.perfumeBrand = perfumeBrand;
		this.perfumeName = perfumeName;
		this.perfumePrice = perfumePrice;
		this.pScentCategory = pScentCategory;
		this.pFilerename = pFilerename;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getPerfumeNo() {
		return perfumeNo;
	}

	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public Timestamp getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getrFilename() {
		return rFilename;
	}

	public void setrFilename(String rFilename) {
		this.rFilename = rFilename;
	}

	public String getfFilerename() {
		return fFilerename;
	}

	public void setfFilerename(String fFilerename) {
		this.fFilerename = fFilerename;
	}

	public String getrFilepath() {
		return rFilepath;
	}

	public void setrFilepath(String rFilepath) {
		this.rFilepath = rFilepath;
	}

	public int getrViewcount() {
		return rViewcount;
	}

	public void setrViewcount(int rViewcount) {
		this.rViewcount = rViewcount;
	}

	public int getrViewscore() {
		return rViewscore;
	}

	public void setrViewscore(int rViewscore) {
		this.rViewscore = rViewscore;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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

	public int getPerfumePrice() {
		return perfumePrice;
	}

	public void setPerfumePrice(int perfumePrice) {
		this.perfumePrice = perfumePrice;
	}

	public String getpScentCategory() {
		return pScentCategory;
	}

	public void setpScentCategory(String pScentCategory) {
		this.pScentCategory = pScentCategory;
	}

	public String getpFilerename() {
		return pFilerename;
	}

	public void setpFilerename(String pFilerename) {
		this.pFilerename = pFilerename;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", perfumeNo=" + perfumeNo + ", memberNo=" + memberNo
				+ ", reviewContents=" + reviewContents + ", reviewDate=" + reviewDate + ", rFilename=" + rFilename
				+ ", fFilerename=" + fFilerename + ", rFilepath=" + rFilepath + ", rViewcount=" + rViewcount
				+ ", rViewscore=" + rViewscore + ", memberNickname=" + memberNickname + ", perfumeBrand=" + perfumeBrand
				+ ", perfumeName=" + perfumeName + ", perfumePrice=" + perfumePrice + ", pScentCategory="
				+ pScentCategory + ", pFilerename=" + pFilerename + "]";
	}



	
}
