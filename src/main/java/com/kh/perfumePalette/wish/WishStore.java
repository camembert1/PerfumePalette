package com.kh.perfumePalette.wish;

import java.util.List;

public interface WishStore {

	int addWish(Wish wish);

	int removeWish(int perfumeNo);
	
	List<Wish> selectPerfumeListLogin(String id);

	List<Wish> selectWishList(String id);

	List<Wish> selectPerfumeList();


}
