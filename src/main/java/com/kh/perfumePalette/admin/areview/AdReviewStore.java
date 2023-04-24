package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.review.Review;

public interface AdReviewStore {

	List<Review> selectAllReview(SqlSession session, PageInfo pi);

	int deleteAdReview(SqlSession session, int i);

	int getListCount(SqlSession session, Search search);

	List<Review> selectListByKeyword(SqlSession session, PageInfo pi,  Search search);

	int getListCount(SqlSession session);

	
}
