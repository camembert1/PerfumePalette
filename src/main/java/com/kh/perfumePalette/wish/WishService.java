package com.kh.perfumePalette.wish;

import java.util.List;

public interface WishService {

	int addWish(Wish wish);

	int removeWish(int perfumeNo);

	List<Wish> selectWishList(String id);

	List<Wish> selectPerfumeListLogin(String id);

}
