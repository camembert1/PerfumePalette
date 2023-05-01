package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.review.Review;

@Repository
public class AdReviewStoreImpl implements AdReviewStore{

	@Override
	public List<AdReview> selectAllReview(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectAdReviewList", null, rowBounds);
	}

	@Override
	public int deleteAdReview(SqlSession session, int i) {
		return session.delete("AdminMapper.deleteReview", i);
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		return session.selectOne("AdminMapper.getSearchRListCount", search);
	}

	@Override
	public List<AdReview> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectRListByKeyword", search, rowBounds);
	}

	@Override
	public int getListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getRListCount");
	}

	@Override
	public int getRListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getReportListCount");
	}

	@Override
	public List<AdReview> selectAllReport(SqlSession session, int reviewNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectAllReport", reviewNo, rowBounds);
	}

	

}
