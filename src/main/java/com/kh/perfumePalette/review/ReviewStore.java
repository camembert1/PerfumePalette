package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.perfume.Perfume;

public interface ReviewStore {

	Perfume selectOneByPerfumeNo(Integer perfumeNo, SqlSession session);

	/**
	 * 후기 등록
	 * @param session
	 * @param review
	 * @return int
	 */
	int insertReview(SqlSession session, Review review);

	/**
	 * 후기게시판 목록 보여주기
	 * @param session
	 * @return List<Review>
	 */
	List<Review> selectAllReview(SqlSession session);

	/**
	 * 후기게시판 Detail 보여주기
	 * @param session
	 * @param reviewNo
	 * @return Review
	 */
	Review selectOneReview(SqlSession session, Integer reviewNo);

}
