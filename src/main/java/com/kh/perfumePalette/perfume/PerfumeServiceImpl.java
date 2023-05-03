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
		List<Perfume> pList = pStore.selectAvailablePerfumes(session, pageAndFilter);
		return pList;
	}

	// 목록 - 향수 총 개수 / 페이징 + 필터링 + STATUS1 ServiceImpl
	@Override
	public int selectTotalPerfumeCount(PageAndFilter pageAndFilter) {
		int totalCount = pStore.selectTotalPerfumeCount(session, pageAndFilter);
		return totalCount;
	}
	
	
	// 향수 디테일 조회 by perfumeNo ServiceImpl
	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		Perfume perfume = pStore.selectOneByPerfumeNo(session, perfumeNo);
		return perfume;
	}

	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo ServiceImpl
	@Override
	public int reviewCntByPerfumeNo(Integer perfumeNo) {
		int reviewCnt = pStore.reviewCntByPerfumeNo(session, perfumeNo);
		return reviewCnt;
	}
	

	// 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int checkWish(Wish wish) {
		int result = pStore.checkWish(session, wish);
		return result;
	}

	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo ServiceImpl
	@Override
	public int wishCnt(Wish wish) {
		int wishCnt = pStore.wishCnt(session, wish);
		return wishCnt;
	}
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int getWishNo(Wish wish) {
		int wishNo = pStore.getWishNo(session, wish);
		return wishNo;
	}

	
	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo ServiceImpl
	@Override
	public int checkCart(Cart cart) {
		int result = pStore.checkCart(session, cart);
		return result;
	}

	
	// 주문서 - 구매 성공 시 재고 감소 by cartNo ServiceImpl
	@Override
	public int minusStock(int cartNo) {
		int result = pStore.minusStock(session, cartNo);
		return result;
	}

}
