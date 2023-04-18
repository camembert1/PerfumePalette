package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.perfume.Perfume;

@Service
public class AdPerfumeServiceImpl implements AdPerfumeService{
	
	@Autowired
	private AdPerfumeStore pStore;
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

	@Override
	public int updateOkPerfume(int i) {
		return pStore.updateOkPerfume(session, i);
	}

	@Override
	public int updateNoPerfume(int i) {
		return pStore.updateNoPerfume(session, i);
	}

	
}
