package com.kh.perfumePalette.mbti;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.perfume.Perfume;

@Service
public class MbtiServiceImpl implements MbtiService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private MbtiStore mStore;

	// 향수 객체 가져오기 by MBTI ServiceImpl
	public Perfume getPerfumeByMbti(String mbtiResult) {
		return mStore.getPerfumeByMbti(session, mbtiResult);
	}

}
