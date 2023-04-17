package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerfumeStoreImpl implements PerfumeStore{
	
	@Autowired
	private SqlSession session;


	// 유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 StoreLogic
	 */
	@Override
	public List<Perfume> selectAvailablePerfumes(String scentCategory) {
		List<Perfume> pList = session.selectList("PerfumeMapper.selectAvailablePerfumes", scentCategory);
;		return pList;
	}


}
