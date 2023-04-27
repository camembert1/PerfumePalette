package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.PageInfo;

@Service
public class AdPerfumeServiceImpl implements AdPerfumeService{
	
	@Autowired
	private AdPerfumeStore pStore;
	@Autowired
	private SqlSession session;

	@Override
	public int insertPerfume(AdPerfume perfume) {
		int result = pStore.insertPerfume(session, perfume);
		return result;
	}
	
	@Override
	public int updatePerfume(AdPerfume perfume) {
		int result = pStore.updatePerfume(session, perfume);
		return result;
	}

	@Override
	public int deletePerfume(int perfumeNo) {
		int result = pStore.deletePerfume(session, perfumeNo);
		return result;
	}

	@Override
	public List<AdPerfume> selectPerfumeList(PageInfo pi) {
		List<AdPerfume> pList = pStore.selectPerfumeList(session, pi);
		return pList;
	}

	@Override
	public AdPerfume selectOneByNo(int perfumeNo) {
		AdPerfume perfume = pStore.selectOneByNo(session, perfumeNo);
		return perfume;
	}

	@Override
	public int updateOkPerfume(int i) {
		return pStore.updateOkPerfume(session, i);
	}

	@Override
	public int updateNoPerfume(int i) {
		return pStore.updateNoPerfume(session, i);
	}

	@Override
	public int getListCount(Search search) {
		return pStore.getListCount(session, search);
	}

	@Override
	public List<AdPerfume> selectListByKeyword(PageInfo pi, Search search) {
		return pStore.selectListByKeyword(session, pi, search);
	}

	@Override
	public int getListCount() {
		return pStore.getListCount(session);
	}

	@Override
	public int getWishListCount() {
		return pStore.getWishListCount(session);
	}

	@Override
	public List<AdPerfume> selectWishList(int perfumeNo, PageInfo pi) {
		return pStore.selectWishList(session, perfumeNo, pi);
	}

	@Override
	public int getCartListCount() {
		return pStore.getCartListCount(session);
	}

	@Override
	public List<AdPerfume> selectCartList(int perfumeNo, PageInfo pi) {
		return pStore.selectCartList(session, perfumeNo, pi);
	}


	
}
