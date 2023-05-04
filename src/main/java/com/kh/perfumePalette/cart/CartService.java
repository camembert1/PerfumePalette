package com.kh.perfumePalette.cart;

import java.util.List;

import com.kh.perfumePalette.wish.Wish;

public interface CartService {

	int addCart(Cart cart);
	
	int removeCart(int cartNo);

	int updateCart(Wish wish);

	List<Wish> selectCartList(String id);

	// 주문 성공 시 재고 감소를 위해 cartNo 가져오기 by perfumeNo, cartQuantity, memberId Service
	int getCartNo(Cart cart);

}
