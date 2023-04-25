package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;
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
	 * @param pi 
	 * @return List<Review>
	 */
	List<Review> selectAllReview(SqlSession session, PageInfo pi);

	/**
	 * 후기게시판 Detail 보여주기
	 * @param session
	 * @param reviewNo
	 * @return Review
	 */
	Review selectOneReview(SqlSession session, Integer reviewNo);

	/**
	 * 조회수 증가
	 * @param session
	 * @param reviewNo
	 * @return int
	 */
	int updateReviewCount(SqlSession session, Integer reviewNo);

	/**
	 * 후기게시판 검색 Store
	 * @param session
	 * @param search
	 * @return List<Review>
	 */
	List<Review> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	/**
	 * 후기게시판 검색 전체 개수 Store
	 * @param session
	 * @param search
	 * @return int
	 */
	int getListCount(SqlSession session, Search search);

	/**
	 * 페이징
	 * 후기게시판 게시물 전체 개수 Store
	 * @param session
	 * @return int
	 */
	int getListCount(SqlSession session);

	/**
	 * 후기 게시판 수정 Store
	 * @param session
	 * @param review
	 * @return int
	 */
	int updateReview(SqlSession session, Review review);
}
