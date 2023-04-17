package com.kh.perfumePalette.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cService;

	@PostMapping("/add")
	@ResponseBody
	public String addWish(String memberId, int cartQuantity, int perfumeNo) {
		try {
			Cart cart = new Cart();
			cart.setMemberId(memberId);
			cart.setCartQuantity(cartQuantity);
			cart.setPerfumeNo(perfumeNo);
			int result = cService.addCart(cart);
			if (result > 0) {
				return "success"; // 장바구니 추가 성공
			} else {
				return "fail"; // 장바구니 추가 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}

	@PostMapping("/remove")
	@ResponseBody
	public String addWish(int cartNo) {
		try {
			int result = cService.removeCart(cartNo);
			if (result > 0) {
				return "success"; // 장바구니 추가 성공
			} else {
				return "fail"; // 장바구니 추가 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}

}
