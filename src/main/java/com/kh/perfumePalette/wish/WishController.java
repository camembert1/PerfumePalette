package com.kh.perfumePalette.wish;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wish")
public class WishController {

	@Autowired
	private WishService wService;

	@GetMapping("/temp")
	public ModelAndView goProduct(HttpSession session, ModelAndView mv, HttpServletRequest req) {
		String id = (String) session.getAttribute("member");
//		System.out.println(id);
		List<Wish> perfumeList = null;
//		if (id != null) {
//			perfumeList = wService.selectPerfumeList();
//		} else {
			perfumeList = wService.selectPerfumeListLogin(id);
//		}
//		System.out.println(perfumeList);
		mv.addObject("perfumeList", perfumeList);
		mv.setViewName("wish/product");
		return mv;
	}

	@PostMapping("/add")
	@ResponseBody
	public String addWish(@RequestParam String memberId, @RequestParam int perfumeNo) {
		try {
			Wish wish = new Wish();
			wish.setMemberId(memberId);
			wish.setPerfumeNo(perfumeNo);
			int result = wService.addWish(wish);
			if (result > 0) {
				return "success"; // 찜 추가 성공
			} else {
				return "fail"; // 찜 추가 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}

	@PostMapping("/remove")
	@ResponseBody
	public String removeWish(@RequestParam String memberId, @RequestParam int perfumeNo) {
		try {
			Wish wish = new Wish();
			wish.setMemberId(memberId);
			wish.setPerfumeNo(perfumeNo);
			int result = wService.removeWish(wish);
			if (result > 0) {
				return "success"; // 찜 삭제 성공
			} else {
				return "fail"; // 찜 삭제 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}

}
