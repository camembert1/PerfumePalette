package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.perfume.Perfume;

@Repository
public class ReviewStoreImpl implements ReviewStore{

	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo, SqlSession session) {
		Perfume perfume = session.selectOne("ReviewMapper.selectOneByPerfumeNo", perfumeNo);
		return perfume;
	}

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public List<Review> selectAllReview(SqlSession session) {
		List<Review> rList = session.selectList("ReviewMapper.selectAllReview");
		return rList;
	}

	@Override
	public Review selectOneReview(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneReview", reviewNo);
		return review;
	}

}
