package com.kh.perfumePalette.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.wish.Wish;

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
	public int removeCart(int cartNo) {
		int result = session.delete("cartMapper.removeCart", cartNo);
		return result;
	}

	@Override
	public int updateCart(Wish wish) {
		int result = session.update("cartMapper.updateCart", wish);
		return result;
	}

	@Override
	public List<Wish> selectCartList(String id) {
		List<Wish> list = session.selectList("cartMapper.selectCartList", id);
		return list;
	}

	// 주문 성공 시 재고 감소를 위해 cartNo 가져오기 by perfumeNo, cartQuantity, memberId StoreLogic
	@Override
	public int getCartNo(Cart cart) {
		return session.selectOne("cartMapper.getCartNo", cart);
	}

}
