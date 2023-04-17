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

	@Override
	public int insertPerfume(Perfume perfume) {
		int result = pStore.insertPerfume(session, perfume);
		return result;
	}
	
	@Override
	public int updatePerfume(Perfume perfume) {
		int result = pStore.updatePerfume(session, perfume);
		return result;
	}

	@Override
	public int deletePerfume(int perfumeNo) {
		int result = pStore.deletePerfume(session, perfumeNo);
		return result;
	}

	@Override
	public List<Perfume> selectPerfumeList() {
		List<Perfume> pList = pStore.selectPerfumeList(session);
		return pList;
	}

	@Override
	public Perfume selectOneByNo(int perfumeNo) {
		Perfume perfume = pStore.selectOneByNo(session, perfumeNo);
		return perfume;
	}
	
	//유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 ServiceImpl
	 */
	@Override
	public List<Perfume> selectAvailablePerfumes(String scentCategory) {
		List<Perfume> pList = pStore.selectAvailablePerfumes(scentCategory);
		return pList;
	}

	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		Perfume perfume = pStore.selectOneByPerfumeNo(perfumeNo);
		return perfume;
	}

	
}
