package com.kh.perfumePalette.mbti;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.perfume.Perfume;

public interface MbtiStore {

	// 향수 객체 가져오기 by MBTI Store
	Perfume getPerfumeByMbti(SqlSession session, String mbtiResult);

}
