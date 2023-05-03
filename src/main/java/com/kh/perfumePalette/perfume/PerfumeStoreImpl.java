package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.cart.Cart;
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
		int totalCount = session.selectOne("PerfumeMapper.selectTotalPerfumeCount", pageAndFilter);
		return totalCount;
	}
	
	
	// 향수 디테일 조회 by perfumeNo StoreLogic
	@Override
	public Perfume selectOneByPerfumeNo(SqlSession session, Integer perfumeNo) {
		Perfume perfume = session.selectOne("PerfumeMapper.selectOneByPerfumeNo", perfumeNo);
		return perfume;
	}

	// 디테일 - 해당 향수에 달린 리뷰 수 by perfumeNo StoreLogic
	@Override
	public int reviewCntByPerfumeNo(SqlSession session, Integer perfumeNo) {
		int reviewCnt = session.selectOne("PerfumeMapper.reviewCnt", perfumeNo);
		return reviewCnt;
	}

	
	// 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int checkWish(SqlSession session, Wish wish) {
		int result = session.selectOne("PerfumeMapper.checkWish", wish);
		return result;
	}

	// 목록 - 해당 향수 찜 개수 조회 by perfumeNo StoreLogic
	@Override
	public int wishCnt(SqlSession session, Wish wish) {
		int wishCnt = session.selectOne("PerfumeMapper.wishCnt", wish);
		return wishCnt;
	}
	
	// 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int getWishNo(SqlSession session, Wish wish) {
		int wishNo = session.selectOne("PerfumeMapper.getWishNo", wish);
		return wishNo;
	}

	
	// 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo StoreLogic
	@Override
	public int checkCart(SqlSession session, Cart cart) {
		int result = session.selectOne("PerfumeMapper.checkCart", cart);
		return result;
	}
	
	
	// 주문서 - 구매 성공 시 재고 감소 by cartNo StoreLogic
	@Override
	public int minusStock(SqlSession session, int cartNo) {
		int result = session.update("PerfumeMapper.minusStock", cartNo);
		return result;
	}

}
