package com.kh.perfumePalette.wish;

import java.util.List;

public interface WishService {

	int addWish(Wish wish);

	List<Wish> selectAll(String id);

	int removeWish(Wish wish);

	List<Wish> selectPerfumeList();

	List<Wish> selectPerfumeListLogin(String id);

}
