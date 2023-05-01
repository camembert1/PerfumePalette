package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.like.Like;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.report.Report;

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
	 * @param like
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
	
	/**
	 * 후기 게시판 삭제 Store
	 * @param session
	 * @param reviewNo
	 * @return int
	 */
	int deleteReview(SqlSession session, int reviewNo);

	/**
	 * 신고하기 Store
	 * @param session
	 * @param report
	 * @return int
	 */
	int reviewReport(SqlSession session, Report report);

	int selectReportCnt(SqlSession session, Report report);

	/**
	 * 좋아요
	 * @param session 
	 * @param like
	 * @return int 
	 */
	int addLike(SqlSession session, Like like);

	/**
	 * 좋아요 삭제 
	 * @param likeNo
	 * @return int
	 */
	int removeLike(SqlSession session, int likeNo);

}
