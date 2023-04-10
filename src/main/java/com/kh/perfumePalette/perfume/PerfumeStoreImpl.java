package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerfumeStoreImpl implements PerfumeStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertPerfume(SqlSession session, Perfume perfume) {
		int result = session.insert("PerfumeMapper.insertPerfume", perfume);
		return result;
	}
	
	@Override
	public int updatePerfume(SqlSession session, Perfume perfume) {
		int result = session.update("PerfumeMapper.updatePerfume", perfume);
		return result;
	}
	
	@Override
	public int deletePerfume(SqlSession session, int perfumeNo) {
		int result = session.delete("PerfumeMapper.deletePerfume", perfumeNo);
		return result;
	}

	@Override
	public List<Perfume> selectPerfumeList(SqlSession session) {
		List<Perfume> pList = session.selectList("PerfumeMapper.selectPerfumeList");
		return pList;
	}
	
	@Override
	public Perfume selectOneByNo(SqlSession session, int perfumeNo) {
		Perfume perfume = session.selectOne("PerfumeMapper.selectOneByNo", perfumeNo);
		return perfume;
	}



}
