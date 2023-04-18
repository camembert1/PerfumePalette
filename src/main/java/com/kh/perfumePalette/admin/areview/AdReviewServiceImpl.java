package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.review.Review;

@Service
public class AdReviewServiceImpl implements AdReviewService{

	@Autowired
	private AdReviewStore rStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Review> selectAllReview() {
		return rStore.selectAllReview(session);
	}
	
	
	

}
