package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import com.kh.perfumePalette.perfume.Perfume;


public interface AdPerfumeService {

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

	/**
	 * 상품 체크 노출 Service
	 * @param i
	 * @return int
	 */
	int updateOkPerfume(int i);

	/**
	 * 상품 체크 비노출 Service
	 * @param i
	 * @return int
	 */
	int updateNoPerfume(int i);
	
	


}
