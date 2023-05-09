package com.kh.perfumePalette.wish;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.member.Member;

@Controller
@RequestMapping("/wish")
public class WishController {

	@Autowired
	private WishService wService;

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
				String id = member.getMemberId();
				perfumeList = wService.selectWishList(id);
				if (perfumeList.size() != 0) {
					mv.addObject("perfumeList", perfumeList);
					mv.setViewName("wish/list");
				} else {
					Alert alert = new Alert("/", "찜 내역이 존재하지 않습니다.");
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

	// 찜 다중 삭제
	@PostMapping("/removeWish")
	@ResponseBody
	public String wishRemove(int[] arr) {
		int result = 0;
		try {
			for (int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
				result = wService.removeWish(arr[i]);
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

	@PostMapping("/add")
	@ResponseBody
	public String addWish(String memberId, int perfumeNo) {
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
	public String removeWish(int wishNo) {
		try {
			int result = wService.removeWish(wishNo);
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
