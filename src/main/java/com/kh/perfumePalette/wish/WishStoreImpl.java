package com.kh.perfumePalette.wish;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishStoreImpl implements WishStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public int addWish(Wish wish) {
		int result = session.insert("wishMapper.addWish", wish);
		return result;
	}

	@Override
	public List<Wish> selectAll(String id) {
		List<Wish> list = session.selectList("wishMapper.selectAll", id);
		return list;
	}

	@Override
	public int removeWish(Wish wish) {
		int result = session.delete("wishMapper.removeWish", wish);
		return result;
	}

	@Override
	public List<Wish> selectPerfumeList() {
		List<Wish> list = session.selectList("wishMapper.selectPerfumeList");
		return list;
	}

}
