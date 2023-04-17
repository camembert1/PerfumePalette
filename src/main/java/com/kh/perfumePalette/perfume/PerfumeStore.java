package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface PerfumeStore {




	// 유정
	// 쇼핑몰 - 향수 목록 출력 Store
	List<Perfume> selectAvailablePerfumes(String scentCategory);

	Perfume selectOneByPerfumeNo(Integer perfumeNo);


}
