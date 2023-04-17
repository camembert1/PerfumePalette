package com.kh.perfumePalette.perfume;

import java.util.List;

import org.springframework.stereotype.Service;

public interface PerfumeService {

	
	// 유정
	// 쇼핑몰 - 향수 목록 출력 Service
	List<Perfume> selectAvailablePerfumes(String scentCategory);

	Perfume selectOneByPerfumeNo(Integer perfumeNo);





}
