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
	public int insertPerfume(SqlSession session, AdPerfume perfume) {
		int result = session.insert("AdminMapper.insertPerfume", perfume);
		return result;
	}
	
	@Override
	public int updatePerfume(SqlSession session, AdPerfume perfume) {
		int result = session.update("AdminMapper.updatePerfume", perfume);
		return result;
	}
	
	@Override
	public int deletePerfume(SqlSession session, int perfumeNo) {
		int result = session.delete("AdminMapper.deletePerfume", perfumeNo);
		return result;
	}

	@Override
	public List<AdPerfume> selectPerfumeList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdPerfume> pList = session.selectList("AdminMapper.selectPerfumeList", null, rowBounds);
		return pList;
	}
	
	@Override
	public AdPerfume selectOneByNo(SqlSession session, int perfumeNo) {
		AdPerfume perfume = session.selectOne("AdminMapper.selectOneByNo", perfumeNo);
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
	public List<AdPerfume> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectListByKeyword", search, rowBounds);
	}

	@Override
	public int getListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getListCount");
	}

	@Override
	public int getWishListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getWishListCount");
	}

	@Override
	public List<AdPerfume> selectWishList(SqlSession session, int perfumeNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectWishList", perfumeNo, rowBounds);
	}

	@Override
	public int getCartListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getCartListCount");
	}

	@Override
	public List<AdPerfume> selectCartList(SqlSession session, int perfumeNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectCartList", perfumeNo, rowBounds);
	}




}
