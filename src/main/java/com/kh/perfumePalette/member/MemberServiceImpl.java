package com.kh.perfumePalette.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.review.Review;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberStore mStore;

	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(member);
		return result;
	}

//	@Override
//	public int login(Member member) {
//		int result = mStore.login(member);
//		return result;
//	}
	
	@Override
	public Member login(Member member) {
		Member loginUser = mStore.login(member);
		return loginUser;
	}

	@Override
	public Member selectMemberById(String memberId) {
		Member member = mStore.selectMemberById(memberId);
		return member;
	}

	@Override
	public int checkId(String memberId) {
		int result = mStore.checkId(memberId);
		return result;
	}
	
	@Override
	public int checkNickname(String memberNickname) {
		int result = mStore.checkNickname(memberNickname);
		return result;
	}
	
	@Override
	public int checkEmail(String memberEmail) {
		int result = mStore.checkEmail(memberEmail);
		return result;
	}

	@Override
	public int modifyMember(Member member) {
		int result = mStore.modifyMember(member);
		return result;
	}

	@Override
	public Member findId(Member member) {
		Member getUser = mStore.findId(member);
		return getUser;
	}

	@Override
	public Member findPw(Member member) {
		Member getUser = mStore.findPw(member);
		return getUser;
	}

	@Override
	public int updatePw(Member member) {
		int result = mStore.updatePw(member);
		return result;
	}

	@Override
	public Member checkPw(Member member) {
		Member result = mStore.checkPw(member);
		return result;
	}

	@Override
	public int bye(Member member) {
		int result = mStore.bye(member);
		return result;
	}

	@Override
	public List<Review> getMyReviews(int memberNo) {
		List<Review> rList = mStore.myReviews(memberNo);
		return rList;
	}


	

	

}
