package com.kh.perfumePalette.chatting;

import java.sql.Timestamp;

public class Chatting {
	
	private int chatNo;
	private String memberId;
	private String memberNickname;
	private String chatContent;
	private Timestamp chatDate;
	
	public Chatting() {
		super();
	}

	public Chatting(int chatNo, String memberId, String memberNickname, String chatContent, Timestamp chatDate) {
		super();
		this.chatNo = chatNo;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
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

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Timestamp getChatDate() {
		return chatDate;
	}

	public void setChatDate(Timestamp chatDate) {
		this.chatDate = chatDate;
	}

	@Override
	public String toString() {
		return "Chatting [chatNo=" + chatNo + ", memberId=" + memberId + ", memberNickname=" + memberNickname
				+ ", chatContent=" + chatContent + ", chatDate=" + chatDate + "]";
	}
	
}