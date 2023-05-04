package com.kh.perfumePalette.mbti;

import com.kh.perfumePalette.perfume.Perfume;

public interface MbtiService {

	// 향수 객체 가져오기 by MBTI Service
	Perfume getPerfumeByMbti(String mbtiResult);

}
