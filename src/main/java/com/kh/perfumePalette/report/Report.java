package com.kh.perfumePalette.report;

import java.sql.Timestamp;

public class Report {
	private int reportNo;
	private int reviewNo;
	private int memberNo;
	private int reportType;
	private String reportContent;
	private Timestamp reportDate;
	
	public Report() {}

	public Report(int reportNo, int reviewNo, int memberNo, int reportType, String reportContent,
			Timestamp reportDate) {
		super();
		this.reportNo = reportNo;
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", reportType="
				+ reportType + ", reportContent=" + reportContent + ", reportDate=" + reportDate + "]";
	}

}
