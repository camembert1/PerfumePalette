package com.kh.perfumePalette.review;

import java.sql.Timestamp;

public class Review {
	private int reviewNo;
	private int perfumeNo;  //향수 번호
	private String reviewContents;
	private Timestamp reviewDate;
	private int memberNo;  //멤버 번호
	private String rFilename;
	private String fFilerename;
	private String rFilepath;
	private int rViewcount;
	private int rViewscore;
	
	public Review() {}

	public Review(int reviewNo, int perfumeNo, String reviewContents, Timestamp reviewDate, int memberNo,
			String rFilename, String fFilerename, String rFilepath, int rViewcount, int rViewscore) {
		super();
		this.reviewNo = reviewNo;
		this.perfumeNo = perfumeNo;
		this.reviewContents = reviewContents;
		this.reviewDate = reviewDate;
		this.memberNo = memberNo;
		this.rFilename = rFilename;
		this.fFilerename = fFilerename;
		this.rFilepath = rFilepath;
		this.rViewcount = rViewcount;
		this.rViewscore = rViewscore;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", perfumeNo=" + perfumeNo + ", reviewContents=" + reviewContents
				+ ", reviewDate=" + reviewDate + ", memberNo=" + memberNo + ", rFilename=" + rFilename
				+ ", fFilerename=" + fFilerename + ", rFilepath=" + rFilepath + ", rViewcount=" + rViewcount
				+ ", rViewscore=" + rViewscore + "]";
	}
	
}
