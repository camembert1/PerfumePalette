package com.kh.perfumePalette.admin.areview;

import java.sql.Timestamp;

import oracle.sql.CLOB;


public class AdReview {
	
	private int reviewNo; // 후기 번호
	private int perfumeNo; // 향수 번호
	private int memberNo;  // 작성자(MEMBER_NO)
	private int reportNo; // 신고 번호
	
	private String reviewContents;  //후기 내용
	private Timestamp reviewDate;   //후기 작성일
	private String rFilename;       //파일 네임
	
	private String rFilerename;     //파일 리네임
	private String rFilepath;       //파일 경로
	private int rViewcount;         //조회수
	
	private int rViewscore;         //별점
	private String memberNickname;  //멤버 닉네임
	private String perfumeBrand;    //향수 브랜드
	
	private String perfumeName;     //향수 이름
	private int perfumePrice;       //향수 가격
	private String pScentCategory;	// 향 분류
	private String pFilerename;	 	// 파일 리네임
	
	private String memberName;		// 이름
	private String memberId;		// 아이디
	private String memberNickName;	// 닉네임
	
	private int reportType;			// 신고 분류
	private String reportContent;	// 신고 내용
	private Timestamp reportDate;	// 신고 날짜
	private int reportCount;		// 신고 수
	
	
	public AdReview() {}




	

	public AdReview(int reviewNo, int perfumeNo, int memberNo, int reportNo, String reviewContents,
			Timestamp reviewDate, String rFilename, String rFilerename, String rFilepath, int rViewcount,
			int rViewscore, String memberNickname, String perfumeBrand, String perfumeName, int perfumePrice,
			String pScentCategory, String pFilerename, String memberName, String memberId, String memberNickName2,
			int reportType, String reportContent, Timestamp reportDate, int reportCount) {
		super();
		this.reviewNo = reviewNo;
		this.perfumeNo = perfumeNo;
		this.memberNo = memberNo;
		this.reportNo = reportNo;
		this.reviewContents = reviewContents;
		this.reviewDate = reviewDate;
		this.rFilename = rFilename;
		this.rFilerename = rFilerename;
		this.rFilepath = rFilepath;
		this.rViewcount = rViewcount;
		this.rViewscore = rViewscore;
		this.memberNickname = memberNickname;
		this.perfumeBrand = perfumeBrand;
		this.perfumeName = perfumeName;
		this.perfumePrice = perfumePrice;
		this.pScentCategory = pScentCategory;
		this.pFilerename = pFilerename;
		this.memberName = memberName;
		this.memberId = memberId;
		memberNickName = memberNickName2;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportCount = reportCount;
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


	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
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


	public String getrFilerename() {
		return rFilerename;
	}


	public void setrFilerename(String rFilerename) {
		this.rFilerename = rFilerename;
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


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberNickName() {
		return memberNickName;
	}


	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}


	public int getReportType() {
		return reportType;
	}


	public void setReportType(int reportType) {
		this.reportType = reportType;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public Timestamp getReportDate() {
		return reportDate;
	}


	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}


	@Override
	public String toString() {
		return "AdReview [reviewNo=" + reviewNo + ", perfumeNo=" + perfumeNo + ", memberNo=" + memberNo + ", reportNo="
				+ reportNo + ", reviewContents=" + reviewContents + ", reviewDate=" + reviewDate + ", rFilename="
				+ rFilename + ", rFilerename=" + rFilerename + ", rFilepath=" + rFilepath + ", rViewcount=" + rViewcount
				+ ", rViewscore=" + rViewscore + ", memberNickname=" + memberNickname + ", perfumeBrand=" + perfumeBrand
				+ ", perfumeName=" + perfumeName + ", perfumePrice=" + perfumePrice + ", pScentCategory="
				+ pScentCategory + ", pFilerename=" + pFilerename + ", memberName=" + memberName + ", memberId="
				+ memberId + ", memberNickName=" + memberNickName + ", reportType=" + reportType + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportCount=" + reportCount + "]";
	}







	
}
