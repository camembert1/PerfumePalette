package com.kh.perfumePalette.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.qnaBoard.QnaBoard;
import com.kh.perfumePalette.rcomment.ReviewComment;
import com.kh.perfumePalette.review.Review;

@Repository
public class MemberStroeImpl implements MemberStore {

	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member member) {
		int result = session.insert("memberMapper.insertMember", member);
		return result;
	}

//	@Override
//	public int login(Member member) {
//		int result = session.selectOne("memberMapper.login", member);
//		return result;
//	}
	@Override
	public Member login(Member member) {
		Member loginUser = session.selectOne("memberMapper.login", member);
		return loginUser;
	}

	@Override
	public Member selectMemberById(String memberId) {
		Member member = session.selectOne("memberMapper.selectMemberById", memberId);
		return member;
	}

	@Override
	public int checkId(String memberId) {
		int result = session.selectOne("memberMapper.checkId", memberId);
		return result;
	}

	@Override
	public int checkNickname(String memberNickname) {
		int result = session.selectOne("memberMapper.checkNickname", memberNickname);
		return result;
	}
	
	@Override
	public int checkEmail(String memberEmail) {
		int result = session.selectOne("memberMapper.checkEmail", memberEmail);
		return result;
	}

	@Override
	public int modifyMember(Member member) {
		int result = session.update("memberMapper.modifyMember", member);
		return result;
	}

	@Override
	public Member findId(Member member) {
		Member getUser = session.selectOne("memberMapper.findId", member);
		return getUser;
	}

	@Override
	public Member findPw(Member member) {
		Member getUser = session.selectOne("memberMapper.findPw", member);
		return getUser;
	}

	@Override
	public int updatePw(Member member) {
		int result = session.update("memberMapper.updatePw", member);
		return result;
	}

	@Override
	public Member checkPw(Member member) {
		Member result = session.selectOne("memberMapper.checkPw", member);
		return result;
	}
	
	@Override
	public int bye(Member member) {
		int result = session.update("memberMapper.bye", member);
		return result;
	}

	@Override
	public List<Review> myReviews(int memberNo) {
		List<Review> rList = session.selectList("memberMapper.myReviews", memberNo);
		return rList;
	}

	@Override
	public List<QnaBoard> myQna(int memberNo) {
		List<QnaBoard> qList = session.selectList("memberMapper.myQna", memberNo);
		return qList;
	}

	@Override
	public int removeReview(int i) {
		int result = session.delete("memberMapper.removeReview", i);
		return result;
	}

	@Override
	public int removeQna(int i) {
		int result = session.delete("memberMapper.removeQna", i);
		return result;
	}

	@Override
	public List<ReviewComment> myComment(int memberNo) {
		List<ReviewComment> cList = session.selectList("memberMapper.myComment", memberNo);
		return cList;
	}

	@Override
	public int removeComment(int i) {
		int result = session.delete("memberMapper.removeComment", i);
		return result;
	}




	

}
