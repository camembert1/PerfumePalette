package com.kh.perfumePalette.qnaBoard;

import java.sql.Timestamp;

public class QnaReply {
	
	private int replyNo;
	private int repQnaNo;
	private int memberNo;
	private String memberNickname;
	private String replyContents;
	private String replyStatus;
	private Timestamp repDate;
	
	public QnaReply () {}

	public QnaReply(int replyNo, int repQnaNo, int memberNo, String memberNickname, String replyContents,
			String replyStatus, Timestamp repDate) {
		super();
		this.replyNo = replyNo;
		this.repQnaNo = repQnaNo;
		this.memberNo = memberNo;
		this.memberNickname = memberNickname;
		this.replyContents = replyContents;
		this.replyStatus = replyStatus;
		this.repDate = repDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRepQnaNo() {
		return repQnaNo;
	}

	public void setRepQnaNo(int repQnaNo) {
		this.repQnaNo = repQnaNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public Timestamp getRepDate() {
		return repDate;
	}

	public void setRepDate(Timestamp repDate) {
		this.repDate = repDate;
	}

	@Override
	public String toString() {
		return "QnaReply [replyNo=" + replyNo + ", repQnaNo=" + repQnaNo + ", memberNo=" + memberNo
				+ ", memberNickname=" + memberNickname + ", replyContents=" + replyContents + ", replyStatus="
				+ replyStatus + ", repDate=" + repDate + "]";
	}

	

	
	
	
}
