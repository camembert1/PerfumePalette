package com.kh.perfumePalette.review;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.like.Like;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.report.Report;

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
	public List<Review> selectAllReview(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectAllReview", null, rowBounds);
		return rList;
	}

	@Override
	public Review selectOneReview(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneReview", reviewNo);
		return review;
	}

	@Override
	public int updateReviewCount(SqlSession session, Integer reviewNo) {
		return session.update("ReviewMapper.updateReviewCount", reviewNo);
	}

	@Override
	public List<Review> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> searchList = session.selectList("ReviewMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("ReviewMapper.getSearchListCount", search);
		return result;
	}
	
	// 페이징
	@Override
		public int getListCount(SqlSession session) {
			int result = session.selectOne("ReviewMapper.getListCount");
			return result;
		}

	@Override
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.updateReview", review);
		return result;
	}
	@Override
		public int deleteReview(SqlSession session, int reviewNo) {
			int result = session.delete("ReviewMapper.deleteReview", reviewNo);
;			return result;
	}
	
	@Override
	public int reviewReport(SqlSession session, Report report) {
		int result = session.insert("ReviewMapper.reviewReport", report);
		return result;
	}

	@Override
	public int selectReportCnt(SqlSession session, Report report) {
		int result = session.selectOne("ReviewMapper.selectReportCnt",report);
		return result;
	}

	@Override
	public int addLike(SqlSession session, Like like) {
		int result = session.insert("ReviewMapper.addLike", like);
		return result;
	}

	@Override
	public int removeLike(SqlSession session, int likeNo) {
		int result = session.delete("ReviewMapper.removeLike", likeNo);
		return result;
	}

	

}
