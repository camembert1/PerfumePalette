package com.kh.perfumePalette.admin.areview;

import java.util.List;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.review.Review;

public interface AdReviewService {

	/**
	 * 관리자 리뷰 리스트 Service
	 * @return List<Review> 
	 */
	List<Review> selectAllReview(PageInfo pi);

	/**
	 * 관리자 리뷰 다중 삭제 Service
	 * @param i
	 * @return int
	 */
	int deleteAdReview(int i);

	/**
	 * 리뷰 검색 갯수 Service
	 * @param search
	 * @return int
	 */
	int getListCount(Search search);
	
	/**
	 * 리뷰 검색 Service
	 * @param search
	 * @return List<Review>
	 */
	List<Review> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 리뷰 페이징 Service
	 * @return int
	 */
	int getListCount();


	
}
