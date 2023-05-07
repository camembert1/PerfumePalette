package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.review.Review;
import com.kh.perfumePalette.wish.Wish;


@Repository
public class PerfumeStoreImpl implements PerfumeStore{
	

	// 향수 목록 조회 / 페이징 + 필터링 + STATUS1 StoreLogic
	@Override
	public List<Perfume> selectAvailablePerfumes(SqlSession session, PageAndFilter pageAndFilter) {
		
		int limit = pageAndFilter.getPageInfo().getBoardLimit();
		int offset = (pageAndFilter.getPageInfo().getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		List<Perfume> pList = session.selectList("PerfumeMapper.selectAvailablePerfumes", pageAndFilter, rowBounds);
		return pList;
	}

	// 목록 - 향수 총 개수 / 페이징 + 필터링 + STATUS1 StoreLogic
	@Override
	public int selectTotalPerfumeCount(SqlSession session, PageAndFilter pageAndFilter) {
		return session.selectOne("PerfumeMapper.selectTotalPerfumeCount", pageAndFilter);
	}
	
	
	// 향수 디테일 조회 by perfumeNo StoreLogic
	@Override
	public Perfume selectOneByPerfumeNo(SqlSession session, Integer perfumeNo) {
		return session.selectOne("PerfumeMapper.selectOneByPerfumeNo", perfumeNo);
	}

	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo StoreLogic
	@Override
	public int reviewCntByPerfumeNo(SqlSession session, Integer perfumeNo) {
		return session.selectOne("PerfumeMapper.reviewCnt", perfumeNo);
	}
	
	// 디테일 - 해당 향수에 달린 리뷰 List by perfumeNo StoreLogic
	@Override
	public List<Review> reviewListByPerfumeNo(SqlSession session, Integer perfumeNo) {
		return session.selectList("PerfumeMapper.reviewListByPerfumeNo", perfumeNo);
	}

	
	// 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int checkWish(SqlSession session, Wish wish) {
		return session.selectOne("PerfumeMapper.checkWish", wish);
	}

	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo StoreLogic
	@Override
	public int wishCnt(SqlSession session, Wish wish) {
		return session.selectOne("PerfumeMapper.wishCnt", wish);
	}
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int getWishNo(SqlSession session, Wish wish) {
		return session.selectOne("PerfumeMapper.getWishNo", wish);
	}

	
	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int checkCart(SqlSession session, Cart cart) {
		return session.selectOne("PerfumeMapper.checkCart", cart);
	}
	
	// 디테일 - 재입고 알림 신청 by memberNo, perfumeNo StoreLogic
	@Override
	public int insertRestockAlert(SqlSession session, ShopAlert rAlert) {
		return session.insert("PerfumeMapper.insertRestockAlert", rAlert);
	}
	
	// 디테일 - 로그인한 회원의 재입고알림 신청 여부 조회 by memberNo, perfumeNo StoreLogic	
	@Override
	public int checkAlert(SqlSession session, ShopAlert rAlertInfo) {
		return session.selectOne("PerfumeMapper.checkAlert", rAlertInfo);
	}
	
	
	// 주문서 - 구매 성공 시 재고 감소 by cartNo StoreLogic
	@Override
	public int minusStock(SqlSession session, int cartNo) {
		return session.update("PerfumeMapper.minusStock", cartNo);
	}

	
	// 헤더 알림창 - 안 읽은 알림 개수 by memberNo StoreLogic
	@Override
	public int selectUnclickAlertCnt(SqlSession session, int memberNo) {
		return session.selectOne("PerfumeMapper.selectUnclickAlertCnt", memberNo);
	}

	// 헤더 알림창 - 안 읽은 알림 목록 by memberNo StoreLogic
	@Override
	public List<ShopAlert> selectUnclickAlert(SqlSession session, int memberNo) {
		return session.selectList("PerfumeMapper.selectUnclickAlert", memberNo);
	}

	// 헤더 알림창 - 알림 클릭 시 읽음 처리 by alertNo StoreLogic
	@Override
	public int clickAlert(SqlSession session, Integer alertNo) {
		return session.update("PerfumeMapper.clickAlert", alertNo);
	}

	
	


}
