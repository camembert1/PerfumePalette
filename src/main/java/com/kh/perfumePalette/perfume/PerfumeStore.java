package com.kh.perfumePalette.perfume;

import java.util.List;

public interface PerfumeStore {

	// 쇼핑몰 - 향수 목록 출력 Store
	List<Perfume> selectAvailablePerfumes(String scentCategory);

}
