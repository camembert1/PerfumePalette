package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.Search;
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

	@Override
	public int deleteAdReview(int i) {
		return rStore.deleteAdReview(session, i);
	}

	@Override
	public int getListCount(Search search) {
		return rStore.getListCount(session, search);
	}

	@Override
	public List<Review> selectListByKeyword(Search search) {
		return rStore.selectListByKeyword(session, search);
	}
	
	
	

}
