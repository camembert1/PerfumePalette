package com.kh.perfumePalette.admin.aqna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.qnaBoard.QnaBoard;

public interface AdQnaStore {

	List<QnaBoard> selectAllQna(SqlSession session);

	int deleteAdReview(SqlSession session, int i);

	int getListCount(SqlSession session, Search search);

	List<QnaBoard> selectListByKeyword(SqlSession session, Search search);

}
