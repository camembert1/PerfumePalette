package com.kh.perfumePalette.cart;

import java.util.List;

public interface CartService {

	int addCart(Cart cart);

	List<Cart> selectPerfumeList();

	int removeCart(int cartNo);

}
