package com.kh.perfumePalette.review;

import java.util.List;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.like.Like;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.rcomment.ReviewComment;
import com.kh.perfumePalette.report.Report;

public interface ReviewService {

	Perfume selectOneByPerfumeNo(Integer perfumeNo);

	/**
	 * 후기 등록
	 * @param review
	 * @return int
	 */
	int insertReview(Review review);

	/**
	 * 후기 게시판 목록 보여주기
	 * @param pi 
	 * @return
	 */
	List<Review> selectAllReview(PageInfo pi);

	/**
	 * 후기 게시판 Detail 페이지 보여주기
	 * @param like
	 * @return
	 */
	Review selectOneReview(Integer reviewNo);

	/**
	 * 조회수 증가
	 * @param reviewNo
	 * @return int
	 */
	int updateReviewCount(Integer reviewNo);

	/**
	 * 후기 게시판 검색 Service
	 * @param search
	 * @return List<Review>
	 */
	List<Review> selectListByKeyword(PageInfo pi,Search search);

	/**
	 * 후기게시판 검색 게시물 전체 개수 Service
	 * 오버로딩
	 * @param search
	 * @return int
	 */
	public int getListCount(Search search);
	
	/**
	 * 페이징
	 * 후기게시판 게시물 전체 개수 Service
	 * @return int
	 */
	public int getListCount();

	/**
	 * 후기 게시판 수정 Service
	 * @param review
	 * @return int
	 */
	int updateReview(Review review);

	/**
	 * 후기 게시판 삭제 Service
	 * @param reviewNo
	 * @return
	 */
	int deleteReview(int reviewNo);
	
	/**
	 * 후기 게시판 신고 Service
	 * @param report
	 * @return
	 */
	int reviewReport(Report report);

	int selectReportCnt(Report report);
	
	/**
	 * 좋아요 
	 * @param like
	 * @return int
	 */
	int addLike(Like like);

	int selectCheckLike(Like like);

	int selectTotalCnt(Integer reviewNo);

	int removeLike(Like like);

	/**
	 * 댓글 작성
	 * @param rComment
	 * @return
	 */
	int insertComment(ReviewComment rComment);

	/**
	 * 댓글 리스트 
	 * @param reviewNo
	 * @return
	 */
	List<ReviewComment> listComment(int reviewNo);

	/**
	 * 댓글 삭제
	 * @param commentNo
	 * @return int
	 */
	int deleteComment(int commentNo);

	
}
