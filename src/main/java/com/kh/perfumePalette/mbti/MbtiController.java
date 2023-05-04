package com.kh.perfumePalette.mbti;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.perfume.Perfume;


@Controller
@RequestMapping("/mbti")
public class MbtiController {
	
	@Autowired
	private MbtiService mService;


	// MBTI테스트 화면 출력
	@GetMapping("/mbti")
	public ModelAndView mbtiTestView(ModelAndView mv) {
		mv.setViewName("common/mbti");
		return mv;
	}

	// MBTI테스트 결과 세션저장
	@ResponseBody
	@PostMapping("/mbtiResult")
	public void mbtiResultSave(String mbtiResult, HttpSession session) {
		session.setAttribute("mbtiResult", mbtiResult);
	}

	// MBTI테스트 결과 출력
	@GetMapping("/mbtiResult")
	public ModelAndView mbtiResultView(ModelAndView mv, HttpSession session) {

		try {
			String mbtiResult = session.getAttribute("mbtiResult") + "";
			Perfume perfume = mService.getPerfumeByMbti(mbtiResult);
			mv
			.addObject("perfume", perfume)
			.setViewName("common/mbtiResult");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}	
		return mv;
	}

	
	
	
}
