package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerfumeServiceImpl implements PerfumeService{
	
	@Autowired
	private PerfumeStore pStore;
	@Autowired
	private SqlSession session;

	
	//유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 ServiceImpl
	 */
	@Override
	public List<Perfume> selectAvailablePerfumes(String scentCategory) {
		List<Perfume> pList = pStore.selectAvailablePerfumes(scentCategory);
		return pList;
	}

	
}
