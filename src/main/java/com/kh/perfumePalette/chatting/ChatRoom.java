package com.kh.perfumePalette.chatting;

public class ChatRoom {
	
	private String memberId;
	private int roomNo;
	
	public ChatRoom() {
		super();
	}

	public ChatRoom(String memberId, int roomNo) {
		super();
		this.memberId = memberId;
		this.roomNo = roomNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "ChatRoom [memberId=" + memberId + ", roomNo=" + roomNo + "]";
	}
	
}
