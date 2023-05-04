package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.wish.Wish;

@Service
public class PerfumeServiceImpl implements PerfumeService{
	
	@Autowired
	private PerfumeStore pStore;
	
	@Autowired
	private SqlSession session;


	// 향수 목록 조회 / 페이징 + 필터링 + STATUS1 ServiceImpl
	@Override
	public List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter) {
		return pStore.selectAvailablePerfumes(session, pageAndFilter);
	}

	// 목록 - 향수 총 개수 / 페이징 + 필터링 + STATUS1 ServiceImpl
	@Override
	public int selectTotalPerfumeCount(PageAndFilter pageAndFilter) {
		return pStore.selectTotalPerfumeCount(session, pageAndFilter);
	}
	
	
	// 향수 디테일 조회 by perfumeNo ServiceImpl
	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		return pStore.selectOneByPerfumeNo(session, perfumeNo);
	}

	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo ServiceImpl
	@Override
	public int reviewCntByPerfumeNo(Integer perfumeNo) {
		return pStore.reviewCntByPerfumeNo(session, perfumeNo);
	}
	

	// 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int checkWish(Wish wish) {
		return pStore.checkWish(session, wish);
	}

	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo ServiceImpl
	@Override
	public int wishCnt(Wish wish) {
		return pStore.wishCnt(session, wish);
	}
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int getWishNo(Wish wish) {
		return pStore.getWishNo(session, wish);
	}

	
	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int checkCart(Cart cart) {
		return pStore.checkCart(session, cart);
	}
	
	
	// 디테일 - 재입고 알림 신청 by memberNo, perfumeNo ServiceImpl
	@Override
	public int insertRestockAlert(ShopAlert rAlert) {
		return pStore.insertRestockAlert(session, rAlert);
	}
	
	// 디테일 - 로그인한 회원의 재입고알림 신청 여부 조회 by memberNo, perfumeNo ServiceImpl
	@Override
	public int checkAlert(ShopAlert rAlertInfo) {
		return pStore.checkAlert(session, rAlertInfo);
	}
	
	
	
	// 주문서 - 구매 성공 시 재고 감소 by cartNo ServiceImpl
	@Override
	public int minusStock(int cartNo) {
		return pStore.minusStock(session, cartNo);
	}

	
	// 헤더 알림창 - 안 읽은 알림 개수 by memberNo ServiceImpl
	@Override
	public int selectUnclickAlertCnt(int memberNo) {
		return pStore.selectUnclickAlertCnt(session, memberNo);
	}

	// 헤더 알림창 - 안 읽은 알림 목록 by memberNo ServiceImpl
	@Override
	public List<ShopAlert> selectUnclickAlert(int memberNo) {
		return pStore.selectUnclickAlert(session, memberNo);
	}

	// 헤더 알림창 - 알림 클릭 시 읽음 처리 by alertNo ServiceImpl
	@Override
	public int clickAlert(Integer alertNo) {
		return pStore.clickAlert(session, alertNo);
	}




}
