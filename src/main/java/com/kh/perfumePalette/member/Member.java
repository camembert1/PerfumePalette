package com.kh.perfumePalette.member;

import java.sql.Timestamp;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberNickname;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberAddr;
	private Timestamp memberDate;
	private Timestamp memberEndDate;
	private int memberStatus;
	private int memberType;
	
	public Member() {
		super();
	}

	public Member(int memberNo, String memberId, String memberNickname, String memberPw, String memberName,
			String memberEmail, String memberPhone, String memberAddr, Timestamp memberDate, Timestamp memberEndDate,
			int memberStatus, int memberType) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberDate = memberDate;
		this.memberEndDate = memberEndDate;
		this.memberStatus = memberStatus;
		this.memberType = memberType;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public Timestamp getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}

	public Timestamp getMemberEndDate() {
		return memberEndDate;
	}

	public void setMemberEndDate(Timestamp memberEndDate) {
		this.memberEndDate = memberEndDate;
	}

	public int getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus) {
		this.memberStatus = memberStatus;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberNickname=" + memberNickname
				+ ", memberPw=" + memberPw + ", memberName=" + memberName + ", memberEmail=" + memberEmail
				+ ", memberPhone=" + memberPhone + ", memberAddr=" + memberAddr + ", memberDate=" + memberDate
				+ ", memberEndDate=" + memberEndDate + ", memberStatus=" + memberStatus + ", memberType=" + memberType
				+ "]";
	}
	
}
