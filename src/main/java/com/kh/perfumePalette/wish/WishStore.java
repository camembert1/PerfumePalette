package com.kh.perfumePalette.wish;

import java.util.List;

public interface WishStore {

	int addWish(Wish wish);

	List<Wish> selectAll(String id);

	int removeWish(Wish wish);

	List<Wish> selectPerfumeList();

}
