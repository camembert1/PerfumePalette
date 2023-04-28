package com.kh.perfumePalette.member;

import java.util.List;

import com.kh.perfumePalette.qnaBoard.QnaBoard;
import com.kh.perfumePalette.review.Review;

public interface MemberService {

	int insertMember(Member member);

	//int login(Member member);
	Member login(Member member);

	Member selectMemberById(String memberId);

	int checkId(String memberId);

	int checkEmail(String memberEmail);

	int checkNickname(String memberNickname);

	int modifyMember(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updatePw(Member member);

	Member checkPw(Member member);
	
	int bye(Member member);

	List<Review> getMyReviews(int memberNo);

	List<QnaBoard> getMyQna(int memberNo);

	int removeReview(int i);

}
