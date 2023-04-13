package com.kh.perfumePalette.qnaBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qnaboard")
public class qnaBoardController {
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView viewQnaBoardList(ModelAndView mv) {
		
		mv.setViewName("qnaBoard/qnaBoardlist");
		return mv;
	}
}
