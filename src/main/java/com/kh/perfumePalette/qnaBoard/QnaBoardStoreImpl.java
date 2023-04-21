package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class QnaBoardStoreImpl implements QnaBoardStore {

	@Override
	public List<QnaBoard> selectAllQnaBoard(SqlSession session) {
		List<QnaBoard> qbList = session.selectList("qnaBoardMapper.selectAllQnaBoard");
		return qbList;
	}

	@Override
	public int writeQnaBoard(SqlSession session, QnaBoard qnaboard) {
		int result = session.insert("qnaBoardMapper.writeQnaBoard", qnaboard);
		return result;
	}

	@Override
	public QnaBoard QnaBoardDetail(SqlSession session, Integer qnaNo) {
		QnaBoard qnaboard = session.selectOne("qnaBoardMapper.QnaBoardDetail", qnaNo);
		return qnaboard;
		
	}

}
