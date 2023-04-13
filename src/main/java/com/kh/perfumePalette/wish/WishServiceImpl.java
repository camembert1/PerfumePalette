package com.kh.perfumePalette.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishServiceImpl implements WishService{
	
	@Autowired
	private WishStore wStore;

	@Override
	public int addWish(Wish wish) {
		int result = wStore.addWish(wish);
		return result;
	}

	@Override
	public List<Wish> selectAll(String id) {
		List<Wish> list = wStore.selectAll(id);
		return list;
	}

	@Override
	public int removeWish(Wish wish) {
		int result = wStore.removeWish(wish);
		return result;
	}

	@Override
	public List<Wish> selectPerfumeList() {
		List<Wish> list = wStore.selectPerfumeList();
		return list;
	}

}
