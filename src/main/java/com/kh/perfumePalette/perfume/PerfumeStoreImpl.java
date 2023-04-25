package com.kh.perfumePalette.perfume;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PerfumeStoreImpl implements PerfumeStore{
	
	@Autowired
	private SqlSession session;


	// 유정
	// 쇼핑몰 - 향수 목록 출력 페이징 + 필터링 + STATUS1 StoreLogic
	@Override
	public List<Perfume> selectAvailablePerfumes(PageAndFilter pageAndFilter) {
		
		int limit = pageAndFilter.getPageInfo().getBoardLimit();
		int offset = (pageAndFilter.getPageInfo().getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		List<Perfume> pList = session.selectList("PerfumeMapper.selectAvailablePerfumes", pageAndFilter, rowBounds);
		return pList;
	}

	// 향수 번호로 향수 객체 가져오기 StoreLogic
	@Override
	public Perfume selectOneByPerfumeNo(Integer perfumeNo) {
		Perfume perfume = session.selectOne("PerfumeMapper.selectOneByPerfumeNo", perfumeNo);
		return perfume;
	}

	// 향수 총 개수 - 페이징 + 필터링 + STATUS1 StoreLogic
	@Override
	public int selectTotalPerfumeCount(PageAndFilter pageAndFilter) {
		int totalCount = session.selectOne("PerfumeMapper.selectTotalPerfumeCount", pageAndFilter);
		return totalCount;
	}


}
