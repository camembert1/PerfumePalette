package com.kh.perfumePalette.member;

import java.util.List;

import com.kh.perfumePalette.qnaBoard.QnaBoard;
import com.kh.perfumePalette.rcomment.ReviewComment;
import com.kh.perfumePalette.review.Review;

public interface MemberStore {

	int insertMember(Member member);

//	int login(Member member);
	Member login(Member member);

	Member selectMemberById(String memberId);

	int checkId(String memberId);
	
	int checkNickname(String memberNickname);
	
	int checkEmail(String memberEmail);

	int modifyMember(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updatePw(Member member);

	Member checkPw(Member member);
	
	int bye(Member member);

	List<Review> myReviews(int memberNo);

	List<QnaBoard> myQna(int memberNo);

	int removeReview(int i);

	int removeQna(int i);

	List<ReviewComment> myComment(int memberNo);

	int removeComment(int i);


	

}
