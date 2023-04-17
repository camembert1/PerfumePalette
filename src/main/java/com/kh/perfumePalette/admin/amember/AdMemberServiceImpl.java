package com.kh.perfumePalette.admin.amember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.member.Member;

@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Autowired
	private AdMemberStore amStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int updateAmModify(Member member) {
		return amStore.updateAmModify(session, member);
	}
	
	@Override
	public List<Member> selectAdMemberList() {
		List<Member> amList = amStore. selectAdMemberList(session);
		return amList;
	}

	@Override
	public Member selectOneByNo(int memberNo) {
		return amStore.selectOneByNo(session, memberNo);
	}


	
}
