package com.kh.perfumePalette.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	private WishStore wStore;

	@Override
	public int addWish(Wish wish) {
		int result = wStore.addWish(wish);
		return result;
	}

	@Override
	public int removeWish(int perfumeNo) {
		int result = wStore.removeWish(perfumeNo);
		return result;
	}
	
	@Override
	public List<Wish> selectWishList(String id) {
		List<Wish> list = wStore.selectWishList(id);
		return list;
	}
	
	@Override
	public List<Wish> selectPerfumeListLogin(String id) {
		List<Wish> list = wStore.selectPerfumeList(id);
		return list;
	}

}
