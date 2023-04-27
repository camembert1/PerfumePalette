package com.kh.perfumePalette.chatting;

import java.sql.Timestamp;

public class Chat {
	
	private int chatNo;
	private String chatContent;
	private Timestamp chatDate;
	private int roomNo;
	private String memberId;
	private String memberNickname;
	
	public Chat() {
		super();
	}

	public Chat(int chatNo, String chatContent, Timestamp chatDate, int roomNo, String memberId,
			String memberNickname) {
		super();
		this.chatNo = chatNo;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
		this.roomNo = roomNo;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
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

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatContent=" + chatContent + ", chatDate=" + chatDate + ", roomNo="
				+ roomNo + ", memberId=" + memberId + ", memberNickname=" + memberNickname + "]";
	}
	
}
