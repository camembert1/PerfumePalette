package com.kh.perfumePalette.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.member.Member;
import com.kh.perfumePalette.wish.Wish;

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
	public String removeWish(int cartNo) {
		try {
			int result = cService.removeCart(cartNo);
			if (result > 0) {
				return "success"; // 장바구니 삭제 성공
			} else {
				return "fail"; // 장바구니 삭제 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}

	@GetMapping("/list")
	public ModelAndView list(HttpSession session, ModelAndView mv, HttpServletRequest req) {
		try {
			Member member = (Member) session.getAttribute("member");
			List<Wish> perfumeList = null;
			if (member == null || member.getMemberId() == null) {
				Alert alert = new Alert("/member/login", "로그인이 필요한 서비스입니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				perfumeList = cService.selectCartList(member.getMemberId());
				if (perfumeList.size() != 0) {
					mv.addObject("perfumeList", perfumeList);
					mv.setViewName("cart/list");
				} else {
					Alert alert = new Alert("/", "장바구니 내역이 존재하지 않습니다.");
					mv.addObject("alert", alert);
					mv.setViewName("common/alert");
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 에러 출력
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	@PostMapping("/update")
	@ResponseBody
	public String updateCart(@ModelAttribute Wish wish) {
		try {
			int result = cService.updateCart(wish);
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

	// 장바구니 다중 삭제
	@PostMapping("/removeCart")
	@ResponseBody
	public String cartRemove(int[] arr) {
		int result = 0;
		try {
			for (int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
				result = cService.removeCart(arr[i]);
			}
			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

}
