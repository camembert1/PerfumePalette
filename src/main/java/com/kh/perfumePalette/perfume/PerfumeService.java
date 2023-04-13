package com.kh.perfumePalette.perfume;

import java.util.List;

public interface PerfumeService {


	// 쇼핑몰 - 향수 목록 출력 Service
	List<Perfume> selectAvailablePerfumes(String scentCategory);



}
