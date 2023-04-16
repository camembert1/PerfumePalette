package com.kh.perfumePalette.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartStoreImpl implements CartStore {

	@Autowired
	private SqlSession session;

	@Override
	public int addCart(Cart cart) {
		int result = session.insert("cartMapper.addCart", cart);
		return result;
	}

	@Override
	public List<Cart> selectPerfumeList() {
		List<Cart> list = session.selectList("cartMapper.selectPerfumeList");
		return list;
	}

	@Override
	public int removeCart(int cartNo) {
		int result = session.delete("cartMapper.removeCart", cartNo);
		return result;
	}

}
