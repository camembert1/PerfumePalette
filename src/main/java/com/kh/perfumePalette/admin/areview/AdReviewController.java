package com.kh.perfumePalette.admin.areview;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.review.Review;

@Controller
@RequestMapping("/admin/review")
public class AdReviewController {
	
	@Autowired
	private AdReviewService rService;
	
	@Autowired
	@Qualifier("arFileUtil")
	private AdReviewFileUtil arFileUtil;
	
	// 리뷰 다중 삭제
	@PostMapping("/arRemove")
	@ResponseBody
	public String adReviewRemove(int [] arr
			, HttpServletRequest request) {
		int result = 0;
		try {
			for(int i = 0; i < arr.length; i++) {
				result = rService.deleteAdReview(arr[i]);
			}
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	
	// 리뷰 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewAdminReviewList(ModelAndView mv) {
		try {
			List<Review> rList = rService.selectAllReview();
			mv.addObject("rList", rList).setViewName("admin/review/list");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 리뷰 검색
	@GetMapping("/search")
	public String reviewSearchView(
			@ModelAttribute Search search
			, Model model) {
		try {
			int totalCount = rService.getListCount(search);
			List<Review> searchList = rService.selectListByKeyword(search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("sList", searchList);
				return "admin/review/search";
			}else {
				model.addAttribute("msg", "조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			return "common/error";
		}
		
	}
	
	
}















