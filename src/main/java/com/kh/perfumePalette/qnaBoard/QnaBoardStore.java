package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface QnaBoardStore {

	List<QnaBoard> selectAllQnaBoard(SqlSession session);

	int writeQnaBoard(SqlSession session, QnaBoard qnaboard);

}
