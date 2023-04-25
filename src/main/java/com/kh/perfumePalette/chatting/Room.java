package com.kh.perfumePalette.chatting;

public class Room {
	
	private int roomNo;
	private String roomStatus;
	private String memberId;
	private String memberNickname;
	private int cnt;
	
	public Room() {
		super();
	}

	public Room(int roomNo, String roomStatus, String memberId, String memberNickname, int cnt) {
		super();
		this.roomNo = roomNo;
		this.roomStatus = roomStatus;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.cnt = cnt;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomStatus=" + roomStatus + ", memberId=" + memberId + ", memberNickname="
				+ memberNickname + ", cnt=" + cnt + "]";
	}
	
}
