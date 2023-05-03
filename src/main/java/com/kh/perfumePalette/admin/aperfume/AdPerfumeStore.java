package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;

public interface AdPerfumeStore {

	int insertPerfume(SqlSession session, AdPerfume perfume);
	
	int updatePerfume(SqlSession session, AdPerfume perfume);
	
	int deletePerfume(SqlSession session, int perfumeNo);

	List<AdPerfume> selectPerfumeList(SqlSession session, PageInfo pi);
	
	AdPerfume selectOneByNo(SqlSession session, int perfumeNo);

	int updateOkPerfume(SqlSession session, int i);

	int updateNoPerfume(SqlSession session, int i);

	int getListCount(SqlSession session, Search search);

	List<AdPerfume> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	int getListCount(SqlSession session);

	int getWishListCount(SqlSession session, int perfumeNo);

	List<AdPerfume> selectWishList(SqlSession session, int perfumeNo, PageInfo pi);

	int getCartListCount(SqlSession session, int perfumeNo);

	List<AdPerfume> selectCartList(SqlSession session, int perfumeNo, PageInfo pi);






}
