package com.kh.perfumePalette.mbti;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.perfume.Perfume;

@Repository
public class MbtiStoreImpl implements MbtiStore{

	// 향수 객체 가져오기 by MBTI StoreLogic
	@Override
	public Perfume getPerfumeByMbti(SqlSession session, String mbtiResult) {
		return session.selectOne("PerfumeMapper.getPerfumeByMbti", mbtiResult);
	}

}
