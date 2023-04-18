package com.kh.perfumePalette.admin.areview;

import java.util.List;

import com.kh.perfumePalette.review.Review;

public interface AdReviewService {

	/**
	 * 관리자 리뷰 리스트 Service
	 * @return List<Review> 
	 */
	List<Review> selectAllReview();

	
}
