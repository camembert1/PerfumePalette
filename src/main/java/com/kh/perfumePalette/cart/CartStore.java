package com.kh.perfumePalette.cart;

import java.util.List;

public interface CartStore {

	int addCart(Cart cart);

	List<Cart> selectPerfumeList();

	int removeCart(int cartNo);

}
