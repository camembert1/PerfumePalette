package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardStore qbStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaBoard> selectAllQnaBoard() {
		List<QnaBoard> qbList =  qbStore.selectAllQnaBoard(session);
		return qbList;
	}

	@Override
	public int writeQnaBoard(QnaBoard qnaboard) {
		int result = qbStore.writeQnaBoard(session, qnaboard);
		return result;
	}

	

}
