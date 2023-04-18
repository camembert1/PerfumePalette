package com.kh.perfumePalette.admin.areview;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.review.Review;

@Controller
public class AdReviewController {
	
	@Autowired
	private AdReviewService rService;
	
	@Autowired
	@Qualifier("arFileUtil")
	private AdReviewFileUtil rFileUtil;
	
	// 리뷰 리스트
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	public ModelAndView viewAdminReviewList(ModelAndView mv) {
		try {
			List<Review> rList = rService.selectAllReview();
			mv.addObject("rList", rList).setViewName("admin/review/list");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
}
