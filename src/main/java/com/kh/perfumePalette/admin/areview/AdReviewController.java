package com.kh.perfumePalette.admin.areview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.member.Member;

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
	public ModelAndView viewAdminReviewList(ModelAndView mv
			, HttpSession session
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			if(session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				int totalCount = rService.getListCount();
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdReview> rList = rService.selectAllReview(pi);
				mv.addObject("paging", pi).addObject("rList", rList).setViewName("admin/review/list");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 리뷰 검색
	@GetMapping("/search")
	public String reviewSearchView(
			@ModelAttribute Search search
			, HttpSession session
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, Model model) {
		try {
			if(session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				int totalCount = rService.getListCount(search);
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdReview> searchList = rService.selectListByKeyword(pi, search);
				if(!searchList.isEmpty()) {
					model.addAttribute("paging", pi);
					model.addAttribute("search", search);
					model.addAttribute("sList", searchList);
					return "admin/review/search";
				}else {
					Alert alert = new Alert("/admin/review/search", "존재하지 않는 상품입니다.");
					model.addAttribute("alert", alert);
					return "common/alert";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
		
	}
	
	// 신고 리스트
	@GetMapping("/report")
	public ModelAndView viewAdminReportList(ModelAndView mv
			, HttpSession session
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, @RequestParam("reviewNo") int reviewNo) {
		try {
			if(session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				int totalCount = rService.getRListCount(reviewNo);
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdReview> rrList = rService.selectAllReport(reviewNo, pi);
				mv.addObject("paging", pi).addObject("rrList", rrList).setViewName("admin/review/report");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
}















