package com.kh.perfumePalette.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@RequestMapping(value="/review/reviewWriteView", method = RequestMethod.GET)
	public String reviewWriteView(Model model) {
		
		return "review/reviewWrite";
	}
	
	@RequestMapping(value="/review/reviewListView", method = RequestMethod.GET)
	public String reviewListView(Model model) {
		
		return "review/reviewList";
	}
	
	@RequestMapping(value="/review/reviewDetailView", method = RequestMethod.GET)
	public String reviewDetailView(Model model) {
		
		return "review/reviewDetail";
	}
}
