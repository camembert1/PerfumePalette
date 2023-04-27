package com.kh.perfumePalette.perfume;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.perfumePalette.wish.Wish;

public interface PerfumeService {

	
	// 유정
	// 쇼핑몰 - 향수 목록 출력 페이징 + 필터링 + STATUS1 Service
	List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter);

	// 향수 번호로 향수 객체 가져오기 Service
	Perfume selectOneByPerfumeNo(Integer perfumeNo);

	// 향수 총 개수 - 페이징 + 필터링 + STATUS1 Service
	int selectTotalPerfumeCount(PageAndFilter pageAndFilter);

	int checkWish(Wish wish);

	int getWishNo(Wish wish);

	int wishCnt(Wish wish);

	int reviewCntByPerfumeNo(Integer perfumeNo);





}
