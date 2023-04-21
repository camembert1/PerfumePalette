package com.kh.perfumePalette.admin.aqna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.qnaBoard.QnaBoard;

@Service
public class AdQnaServiceImpl implements AdQnaService {

	@Autowired
	private AdQnaStore qStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaBoard> selectAllQna() {
		return qStore.selectAllQna(session);
	}

	@Override
	public int deleteAdReview(int i) {
		return qStore.deleteAdReview(session, i);
	}

	@Override
	public int getListCount(Search search) {
		return qStore.getListCount(session, search);
	}

	@Override
	public List<QnaBoard> selectListByKeyword(Search search) {
		return qStore.selectListByKeyword(session, search);
	}

}
