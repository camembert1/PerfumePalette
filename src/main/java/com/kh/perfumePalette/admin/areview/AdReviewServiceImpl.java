package com.kh.perfumePalette.admin.areview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.PageInfo;

@Service
public class AdReviewServiceImpl implements AdReviewService{

	@Autowired
	private AdReviewStore rStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdReview> selectAllReview(PageInfo pi) {
		return rStore.selectAllReview(session, pi);
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
	public List<AdReview> selectListByKeyword(PageInfo pi, Search search) {
		return rStore.selectListByKeyword(session, pi, search);
	}

	@Override
	public int getListCount() {
		return rStore.getListCount(session);
	}

	@Override
	public int getRListCount() {
		return rStore.getRListCount(session);
	}

	@Override
	public List<AdReview> selectAllReport(int reviewNo, PageInfo pi) {
		return rStore.selectAllReport(session, reviewNo, pi);
	}
	
	
	

}
