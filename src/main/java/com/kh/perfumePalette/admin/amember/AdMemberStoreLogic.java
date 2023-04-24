package com.kh.perfumePalette.admin.amember;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.member.Member;

@Repository
public class AdMemberStoreLogic implements AdMemberStore {

	
	@Override
	public int updateAmModify(SqlSession session, Member member) {
		return session.update("AdminMapper.updateAdMemberModify", member);
	}
	
	@Override
	public List<Member> selectAdMemberList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> amList = session.selectList("AdminMapper.selectAdMemberList", null, rowBounds);
		return amList;
	}

	@Override
	public Member selectOneByNo(SqlSession session, int memberNo) {
		return session.selectOne("AdminMapper.selectAdMemberDetail", memberNo);
	}

	@Override
	public int deleteAdMember(SqlSession session, int memberNo) {
		return session.delete("AdminMapper.deleteMember", memberNo);
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		return session.selectOne("AdminMapper.getSearchMListCount", search);
	}

	@Override
	public List<Member> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectMListByKeyword", search, rowBounds);
	}

	@Override
	public int getListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getMListCount");
	}


}
