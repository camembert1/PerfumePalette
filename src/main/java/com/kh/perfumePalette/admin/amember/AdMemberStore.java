package com.kh.perfumePalette.admin.amember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.member.Member;

public interface AdMemberStore {

	int updateAmModify(SqlSession session, Member member);
	
	List<Member> selectAdMemberList(SqlSession session);

	Member selectOneByNo(SqlSession session, int memberNo);

	int deleteAdMember(SqlSession session, int memberNo);


}
