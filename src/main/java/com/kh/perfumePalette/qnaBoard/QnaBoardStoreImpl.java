package com.kh.perfumePalette.qnaBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void updateReplyStatus(SqlSession session, int repQnaNo, String replyStatus) {
		Map<String, Object> params = new HashMap<>();
        params.put("repQnaNo", repQnaNo);
        params.put("replyStatus", replyStatus);
        session.update("qnaBoardMapper.updateReplyStatus", params);
		
	}

	@Override
	public int deleteReply(SqlSession session, Integer replyNo) {
		int result = session.delete("qnaBoardMapper.deleteReply", replyNo);
		return result;
	}

	@Override
	public int samepwd(SqlSession session, Integer qnaNo) {
		int result = session.selectOne("qnaBoardMapper.samepwd", qnaNo);
		return result;
	}

	@Override
	public int updateReply(SqlSession session, QnaReply qnareply) {
		int result = session.update("qnaBoardMapper.updateReply", qnareply);
		return result;
	}

	@Override
	public List<QnaBoard> selectAllQnaBoardPerfume(SqlSession session, Integer perfumeNo) {
		List<QnaBoard> qbList = session.selectList("qnaBoardMapper.selectAllQnaBoardPerfume", perfumeNo);
		return qbList;
	}

	

}
