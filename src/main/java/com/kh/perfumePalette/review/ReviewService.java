package com.kh.perfumePalette.review;

import java.util.List;

import com.kh.perfumePalette.perfume.Perfume;

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
	 * @return
	 */
	List<Review> selectAllReview();

}
