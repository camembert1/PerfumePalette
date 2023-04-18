package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Perfume> selectPerfumeList(SqlSession session) {
		List<Perfume> pList = session.selectList("AdminMapper.selectPerfumeList");
		return pList;
	}
	
	@Override
	public Perfume selectOneByNo(SqlSession session, int perfumeNo) {
		Perfume perfume = session.selectOne("AdminMapper.selectOneByNo", perfumeNo);
		return perfume;
	}



}
