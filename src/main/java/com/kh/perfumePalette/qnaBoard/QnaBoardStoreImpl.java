package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;

@Repository
public class QnaBoardStoreImpl implements QnaBoardStore {

	@Override
	public List<QnaBoard> selectAllQnaBoard(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<QnaBoard> qbList = session.selectList("qnaBoardMapper.selectAllQnaBoard", null, rowBounds);
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

	@Override
	public QnaBoard selectOneByNo(SqlSession session, Integer qnaNo) {
		QnaBoard qnaboard = session.selectOne("qnaBoardMapper.selectOneByNo", qnaNo);
		return qnaboard;
	}

	@Override
	public int updateqnaBoard(SqlSession session, QnaBoard qnaboard) {
		int result = session.update("qnaBoardMapper.updateqnaBoard", qnaboard);
		return result;
	}

	@Override
	public int deleteQnaBoard(SqlSession session, int qnaNo) {
		int result = session.delete("qnaBoardMapper.deleteQnaBoard", qnaNo);
		return result;
	}

	@Override
	public int getqnaBoardCount(SqlSession session) {
		int result = session.selectOne("qnaBoardMapper.getqnaBoardCount");
		return result;
	}

	@Override
	public int insertReply(SqlSession session, QnaReply qnaReply) {
		int result = session.insert("qnaBoardMapper.insertReply", qnaReply);
		return result;
	}

	@Override
	public List<QnaReply> selectAllReply(SqlSession session, Integer qnaNo) {
		List<QnaReply> qrlist = session.selectList("qnaBoardMapper.selectAllReply", qnaNo);
		return qrlist;
	}

}
