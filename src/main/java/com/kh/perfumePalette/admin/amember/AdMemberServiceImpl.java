package com.kh.perfumePalette.admin.amember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.Search;
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
	public List<Member> selectAdMemberList(PageInfo pi) {
		List<Member> amList = amStore. selectAdMemberList(session, pi);
		return amList;
	}

	@Override
	public Member selectOneByNo(int memberNo) {
		return amStore.selectOneByNo(session, memberNo);
	}

	@Override
	public int deleteAdMember(int memberNo) {
		return amStore.deleteAdMember(session, memberNo);
	}

	@Override
	public int getListCount(Search search) {
		return amStore.getListCount(session, search);
	}

	@Override
	public List<Member> selectListByKeyword(PageInfo pi, Search search) {
		return amStore.selectListByKeyword(session, pi, search);
	}

	@Override
	public int getListCount() {
		return amStore.getListCount(session);
	}

	@Override
	public int updateStopMember(int i) {
		return amStore.updateStopMember(session, i);
	}

	@Override
	public int updateStartMember(int i) {
		return amStore.updateStartMember(session, i);
	}


	
}
