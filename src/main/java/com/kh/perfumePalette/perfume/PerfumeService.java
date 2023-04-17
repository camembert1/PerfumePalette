package com.kh.perfumePalette.perfume;

import java.util.List;

import org.springframework.stereotype.Service;

public interface PerfumeService {

	/**
	 * 상품 등록 Service
	 * @param perfume
	 * @return int
	 */
	int insertPerfume(Perfume perfume);

	/**
	 * 상품 수정 Service
	 * @param perfume
	 * @return int
	 */
	int updatePerfume(Perfume perfume);
	
	/**
	 * 상품 삭제 Service
	 * @param perfumeNo
	 * @return int
	 */
	int deletePerfume(int perfumeNo);
	
	/**
	 * 상품 리스트 Service
	 * @return List<Perfume>
	 */
	List<Perfume> selectPerfumeList();
	
	/**
	 * 상품 상세 관리자 Service
	 * @param perfumeNo
	 * @return perfume
	 */
	Perfume selectOneByNo(int perfumeNo);
	
	
	// 유정
	// 쇼핑몰 - 향수 목록 출력 Service
	List<Perfume> selectAvailablePerfumes(String scentCategory);

	Perfume selectOneByPerfumeNo(Integer perfumeNo);





}
