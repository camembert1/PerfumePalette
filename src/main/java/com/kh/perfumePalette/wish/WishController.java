package com.kh.perfumePalette.wish;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ModelAndView goProduct(ModelAndView mv, HttpServletRequest req) {
		List<Wish> perfumeList = wService.selectPerfumeList();
		mv.addObject("perfumeList", perfumeList);
		mv.setViewName("wish/product");
		return mv;
	}

	@GetMapping("/add")
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

	@GetMapping("/remove")
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
