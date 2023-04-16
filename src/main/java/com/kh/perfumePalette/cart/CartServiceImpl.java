package com.kh.perfumePalette.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Cart> selectPerfumeList() {
		List<Cart> list = cStore.selectPerfumeList();
		return list;
	}

	@Override
	public int removeCart(int cartNo) {
		int result = cStore.removeCart(cartNo);
		return result;
	}
}
