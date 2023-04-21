package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.perfume.Perfume;

@Repository
public class AdPerfumeStoreImpl implements AdPerfumeStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertPerfume(SqlSession session, Perfume perfume) {
		int result = session.insert("AdminMapper.insertPerfume", perfume);
		return result;
	}
	
	@Override
	public int updatePerfume(SqlSession session, Perfume perfume) {
		int result = session.update("AdminMapper.updatePerfume", perfume);
		return result;
	}
	
	@Override
	public int deletePerfume(SqlSession session, int perfumeNo) {
		int result = session.delete("AdminMapper.deletePerfume", perfumeNo);
		return result;
	}

	@Override
	public List<Perfume> selectPerfumeList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Perfume> pList = session.selectList("AdminMapper.selectPerfumeList", null, rowBounds);
		return pList;
	}
	
	@Override
	public Perfume selectOneByNo(SqlSession session, int perfumeNo) {
		Perfume perfume = session.selectOne("AdminMapper.selectOneByNo", perfumeNo);
		return perfume;
	}

	@Override
	public int updateOkPerfume(SqlSession session, int i) {
		return session.update("AdminMapper.updateShow", i);
	}

	@Override
	public int updateNoPerfume(SqlSession session, int i) {
		return session.update("AdminMapper.updateNoShow", i);
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		return session.selectOne("AdminMapper.getSearchListCount", search);
	}

	@Override
	public List<Perfume> selectListByKeyword(SqlSession session, Search search) {
		return session.selectList("AdminMapper.selectListByKeyword", search);
	}

	@Override
	public int getListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getListCount");
	}




}
