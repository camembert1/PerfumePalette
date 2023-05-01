package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.wish.Wish;

public interface PerfumeStore {

	
	// 향수 목록 조회 / 페이징 + 필터링 + STATUS1 Store
	List<Perfume> selectAvailablePerfumes(SqlSession session, PageAndFilter pageAndFilter);

	// 목록 - 향수 총 개수 / 페이징 + 필터링 + STATUS1 Store
	int selectTotalPerfumeCount(SqlSession session, PageAndFilter pageAndFilter);
	
	
	// 향수 디테일 조회 by perfumeNo Store
	Perfume selectOneByPerfumeNo(SqlSession session, Integer perfumeNo);

	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo Store
	int reviewCntByPerfumeNo(SqlSession session, Integer perfumeNo);

	
	// 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo Store
	int checkWish(SqlSession session, Wish wish);

	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo Store
	int wishCnt(SqlSession session, Wish wish);
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo Store
	int getWishNo(SqlSession session, Wish wish);

	
	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo Store
	int checkCart(SqlSession session, Cart cart);

	// 주문서 - 구매 성공 시 재고 감소 by cartNo Store
	int minusStock(SqlSession session, int cartNo);

}
