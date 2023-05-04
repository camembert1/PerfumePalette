package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;

public interface AdReviewStore {

	List<AdReview> selectAllReview(SqlSession session, PageInfo pi);

	int deleteAdReview(SqlSession session, int i);

	int getListCount(SqlSession session, Search search);

	List<AdReview> selectListByKeyword(SqlSession session, PageInfo pi,  Search search);

	int getListCount(SqlSession session);

	int getRListCount(SqlSession session, int reviewNo);

	List<AdReview> selectAllReport(SqlSession session, int reviewNo, PageInfo pi);

	
}
