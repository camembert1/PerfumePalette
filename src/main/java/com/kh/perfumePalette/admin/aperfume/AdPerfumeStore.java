package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.perfume.Perfume;

public interface AdPerfumeStore {

	int insertPerfume(SqlSession session, Perfume perfume);
	
	int updatePerfume(SqlSession session, Perfume perfume);
	
	int deletePerfume(SqlSession session, int perfumeNo);

	List<Perfume> selectPerfumeList(SqlSession session);
	
	Perfume selectOneByNo(SqlSession session, int perfumeNo);





}
