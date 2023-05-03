package com.kh.perfumePalette.like;

public class Like {

	private int likeNo;
	private int reviewNo;
	private int memberNo;
	private int likeCount;
	
	public Like() {}

	public Like(int likeNo, int reviewNo, int memberNo, int likeCount) {
		super();
		this.likeNo = likeNo;
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.likeCount = likeCount;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", likeCount="
				+ likeCount + "]";
	}

}
