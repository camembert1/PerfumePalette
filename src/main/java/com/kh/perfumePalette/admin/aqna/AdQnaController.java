package com.kh.perfumePalette.admin.aqna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.qnaBoard.QnaBoard;

@Controller
@RequestMapping("/admin/qna")
public class AdQnaController {

	@Autowired
	private AdQnaService qService;
	
	@Autowired
	@Qualifier("aqFileUtil")
	private AdQnaFileUtil aqFileUtil;
	
	// 문의 다중 삭제
	@PostMapping("/aqRemove")
	@ResponseBody
	public String adQnaRemove(int [] arr
			, HttpServletRequest request) {
		int result = 0;
		try {
			for(int i = 0; i < arr.length; i++) {
				result = qService.deleteAdReview(arr[i]);
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
	
	// 문의 리스트
	@GetMapping("/list")
	public ModelAndView viewAdminQnaList(ModelAndView mv
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			int totalCount = qService.getListCount();
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<QnaBoard> qList = qService.selectAllQna(pi);
			mv.addObject("paging", pi).addObject("qList", qList).setViewName("admin/qna/list");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 상품 검색
	@GetMapping("/search")
	public String qnaSearchView(
			@ModelAttribute Search search
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, Model model) {
		try {
			int totalCount = qService.getListCount(search);
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<QnaBoard> searchList = qService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("paging", pi);
				model.addAttribute("search", search);
				model.addAttribute("sList", searchList);
				return "admin/qna/search";
			}else {
				model.addAttribute("msg", "조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			return "common/error";
		}
	}
}
