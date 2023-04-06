package com.kh.perfumePalette.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberStore mStore;

	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(member);
		return result;
	}

	@Override
	public int login(Member member) {
		int result = mStore.login(member);
		return result;
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

	

	

}
