package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.wish.Wish;

@Service
public class PerfumeServiceImpl implements PerfumeService{
	
	@Autowired
	private PerfumeStore pStore;
	@Autowired
	private SqlSession session;

	
	//유정

	// 쇼핑몰 - 향수 목록 출력 페이징 + 필터링 + STATUS1 ServiceImpl
	@Override
	public List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter) {
		List<Perfume> pList = pStore.selectAvailablePerfumes(pageAndFilter);
		return pList;
	}

	// 향수 번호로 향수 객체 가져오기 ServiceImpl
	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		Perfume perfume = pStore.selectOneByPerfumeNo(perfumeNo);
		return perfume;
	}

	// 향수 총 개수 - 페이징 + 필터링 + STATUS1 ServiceImpl
	@Override
	public int selectTotalPerfumeCount(PageAndFilter pageAndFilter) {
		int totalCount = pStore.selectTotalPerfumeCount(pageAndFilter);
		return totalCount;
	}

	@Override
	public int checkWish(Wish wish) {
		int result = pStore.checkWish(wish);
		return result;
	}

	@Override
	public int getWishNo(Wish wish) {
		int wishNo = pStore.getWishNo(wish);
		return wishNo;
	}

	@Override
	public int wishCnt(Wish wish) {
		int wishCnt = pStore.wishCnt(wish);
		return wishCnt;
	}

	@Override
	public int reviewCntByPerfumeNo(Integer perfumeNo) {
		int reviewCnt = pStore.reviewCntByPerfumeNo(perfumeNo);
		return reviewCnt;
	}

	
}
