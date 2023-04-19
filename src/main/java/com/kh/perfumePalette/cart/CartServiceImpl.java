package com.kh.perfumePalette.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.wish.Wish;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartStore cStore;

	@Override
	public int addCart(Cart cart) {
		int result = cStore.addCart(cart);
		return result;
	}

	@Override
	public int removeCart(int cartNo) {
		int result = cStore.removeCart(cartNo);
		return result;
	}

	@Override
	public int updateCart(Wish wish) {
		int result = cStore.updateCart(wish);
		return result;
	}

	@Override
	public List<Wish> selectCartList(String id) {
		List<Wish> list = cStore.selectCartList(id);
		return list;
	}

}
