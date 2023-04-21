package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;

public interface QnaBoardStore {

	List<QnaBoard> selectAllQnaBoard(SqlSession session, PageInfo pi);

	int writeQnaBoard(SqlSession session, QnaBoard qnaboard);

	QnaBoard QnaBoardDetail(SqlSession session, Integer qnaNo);

	QnaBoard selectOneByNo(SqlSession session, Integer qnaNo);

	int updateqnaBoard(SqlSession session, QnaBoard qnaboard);

	int deleteQnaBoard(SqlSession session, int qnaNo);

	int getqnaBoardCount(SqlSession session);

}
