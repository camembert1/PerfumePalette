package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.perfume.Perfume;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		Perfume perfume = rStore.selectOneByPerfumeNo(perfumeNo,session);
		return perfume;
	}


	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}


	@Override
	public List<Review> selectAllReview() {
		List<Review> rList = rStore.selectAllReview(session);
		return rList;
	}

}
