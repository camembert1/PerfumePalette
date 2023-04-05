package com.kh.perfumePalette.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberStroeImpl implements MemberStore {

	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member member) {
		int result = session.insert("memberMapper.insertMember", member);
		return result;
	}

	@Override
	public int login(Member member) {
		int result = session.selectOne("memberMapper.login", member);
		return result;
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

}
