package com.kh.perfumePalette.perfume;

import java.util.List;


import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.wish.Wish;

public interface PerfumeService {

	
	// 향수 목록 조회 / 페이징 + 필터링 + STATUS1 Service
	List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter);

	// 목록 - 향수 총 개수 / 페이징 + 필터링 + STATUS1 Service
	int selectTotalPerfumeCount(PageAndFilter pageAndFilter);
	
	
	// 향수 디테일 조회 by perfumeNo Service
	Perfume selectOneByPerfumeNo(Integer perfumeNo);
	
	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo Service
	int reviewCntByPerfumeNo(Integer perfumeNo);

	
	// 목록, 디테일 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo Service
	int checkWish(Wish wish);
	
	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo Service
	int wishCnt(Wish wish);
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo Service
	int getWishNo(Wish wish);


	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo Service
	int checkCart(Cart cart);
	

	// 디테일 - 재입고 알림 신청 by memberNo, perfumeNo Service
	int insertRestockAlert(ShopAlert rAlert);
	
	// 디테일 - 로그인한 회원의 재입고알림 신청 여부 조회 by memberNo, perfumeNo Service
	int checkAlert(ShopAlert rAlertInfo);
	
		
	// 주문서 - 구매 성공 시 재고 감소 by cartNo Service
	int minusStock(int cartNo);

	
	// 헤더 알림창 - 안 읽은 알림 개수 by memberNo Service
	int selectUnclickAlertCnt(int memberNo);

	// 헤더 알림창 - 안 읽은 알림 목록 by memberNo Service
	List<ShopAlert> selectUnclickAlert(int memberNo);

	// 헤더 알림창 - 알림 클릭 시 읽음 처리 by alertNo Service
	int clickAlert(Integer alertNo);


	
}
