package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface PerfumeStore {




	// 유정
	// 쇼핑몰 - 향수 목록 출력 페이징 + 필터링 + STATUS1 Store
	List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter);

	// 향수 번호로 향수 객체 가져오기 Store
	Perfume selectOneByPerfumeNo(Integer perfumeNo);

	// 향수 총 개수 - 페이징 + 필터링 + STATUS1 Store
	int selectTotalPerfumeCount(PageAndFilter pageAndFilter);


}
