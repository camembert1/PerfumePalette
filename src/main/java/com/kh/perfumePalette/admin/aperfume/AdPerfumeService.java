package com.kh.perfumePalette.admin.aperfume;

import java.util.List;

import com.kh.perfumePalette.PageInfo;


public interface AdPerfumeService {

	/**
	 * 상품 등록 Service
	 * @param perfume
	 * @return int
	 */
	int insertPerfume(AdPerfume perfume);

	/**
	 * 상품 수정 Service
	 * @param perfume
	 * @return int
	 */
	int updatePerfume(AdPerfume perfume);
	
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
	List<AdPerfume> selectPerfumeList(PageInfo pi);
	
	/**
	 * 상품 상세 관리자 Service
	 * @param perfumeNo
	 * @return perfume
	 */
	AdPerfume selectOneByNo(int perfumeNo);

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

	/**
	 * 상품 검색 갯수 Service
	 * @param search
	 * @return int
	 */
	int getListCount(Search search);

	/**
	 * 상품 검색 Service 
	 * @param search
	 * @return List<Perfume>
	 */
	List<AdPerfume> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 페이징 Service
	 * @return int
	 */
	int getListCount();

	/**
	 * 찜한 멤버 갯수 Service
	 * @param perfumeNo 
	 * @return int
	 */
	int getWishListCount(int perfumeNo);

	/**
	 * 찜한 멤버 리스트 Service
	 * @param perfumeNo
	 * @param pi
	 * @return List<AdPerfume>
	 */
	List<AdPerfume> selectWishList(int perfumeNo, PageInfo pi);

	/**
	 * 장바구니 멤버 갯수 Service
	 * @param perfumeNo 
	 * @return int
	 */
	int getCartListCount(int perfumeNo);

	/**
	 * 장바구니 멤버 리스트 Service
	 * @param perfumeNo
	 * @param pi
	 * @return List<AdPerfume> 
	 */
	List<AdPerfume> selectCartList(int perfumeNo, PageInfo pi);

	
	


}
