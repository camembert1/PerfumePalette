package com.kh.perfumePalette.cart;

import java.util.List;

import com.kh.perfumePalette.wish.Wish;

public interface CartService {

	int addCart(Cart cart);
	
	int removeCart(int cartNo);

	int updateCart(Wish wish);

	List<Wish> selectCartList(String id);

}
