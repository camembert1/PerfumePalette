package com.kh.perfumePalette.admin.areview;

import java.util.List;

import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.review.Review;

public interface AdReviewService {

	/**
	 * 관리자 리뷰 리스트 Service
	 * @return List<Review> 
	 */
	List<Review> selectAllReview();

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
	List<Review> selectListByKeyword(Search search);


	
}
