package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.review.Review;

@Repository
public class AdReviewStoreImpl implements AdReviewStore{

	@Override
	public List<Review> selectAllReview(SqlSession session) {
		return session.selectList("AdminMapper.selectAdReview");
	}

	

}
