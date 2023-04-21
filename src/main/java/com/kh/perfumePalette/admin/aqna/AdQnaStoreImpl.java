package com.kh.perfumePalette.admin.aqna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.qnaBoard.QnaBoard;

@Repository
public class AdQnaStoreImpl implements AdQnaStore {

	@Override
	public List<QnaBoard> selectAllQna(SqlSession session) {
		return session.selectList("AdminMapper.selectAdQnaList");
	}

	@Override
	public int deleteAdReview(SqlSession session, int i) {
		return session.delete("AdminMapper.deleteQna", i);
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		return session.selectOne("AdminMapper.getSearchQListCount", search);
	}

	@Override
	public List<QnaBoard> selectListByKeyword(SqlSession session, Search search) {
		return session.selectList("AdminMapper.selectQListByKeyword", search);
	}

}
