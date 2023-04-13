package com.kh.perfumePalette.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

	@RequestMapping(value="/review/reviewWrite", method = RequestMethod.GET)
	public String reviewWriteView(Model model) {
		
		return "review/reviewWrite";
	}
	
	@RequestMapping(value="/review/reviewList", method = RequestMethod.GET)
	public String reviewListView(Model model) {
		
		return "review/reviewList";
	}
	
	@RequestMapping(value="/review/reviewDetail", method = RequestMethod.GET)
	public String reviewDetailView(Model model) {
		
		return "review/reviewDetail";
	}
}
