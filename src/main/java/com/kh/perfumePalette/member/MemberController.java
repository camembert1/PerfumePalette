package com.kh.perfumePalette.member;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService mService;

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
	public ModelAndView mbtiResultView(ModelAndView mv) {
		mv.setViewName("common/mbtiResult");
		return mv;
	}

	// 회원가입
	@GetMapping("/enroll")
	public ModelAndView enroll(ModelAndView mv) {
		mv.setViewName("member/enroll");
		return mv;
	}

	@PostMapping("/enroll")
	public ModelAndView enroll(ModelAndView mv, @ModelAttribute Member member) {
		try {
			// memberAddress가 2개 들어오는데 이때 ','로 구분되어 ', '로 변경
			member.setMemberAddr(member.getMemberAddr().replace(",", ", "));
			int result = mService.insertMember(member);
			if (result > 0) {
				Alert alert = new Alert("/member/login", "회원가입에 성공했습니다");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				Alert alert = new Alert("/member/enroll", "회원가입에 실패했습니다");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 에러 출력
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 아이디 유효성 체크
	@PostMapping(value = "/idChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int idCheck(String memberId) {
		int result = mService.checkId(memberId);
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9]{4,20}$");
		Matcher matcher = pattern.matcher(memberId);

		if ((memberId.length() < 4 || memberId.length() > 20) || !matcher.matches()) {
			return -2;
		}

		return result;
	}

	// 닉네임 유효성 체크
	@PostMapping(value = "/nicknameChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int nickname(String memberNickname) {
		int result = mService.checkNickname(memberNickname);
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9가-힣]{2,20}$");
		Matcher matcher = pattern.matcher(memberNickname);

		if ((memberNickname.length() < 2 || memberNickname.length() > 20) || !matcher.matches()) {
			return -2;
		}

		return result;
	}

	// 비밀번호 유효성 체크
	@PostMapping(value = "/pwChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int password(String memberPw, String reMemberPw) {
		int result = 0;
		if (!memberPw.equals(reMemberPw)) {
			result = 1;
		}

		Pattern pattern = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$");
		Matcher matcher = pattern.matcher(String.valueOf(memberPw));

		if (memberPw.length() < 8 || reMemberPw.length() > 20 || !matcher.matches()) {
			return -2;
		}

		return result;
	}

	// 이메일 유효성 체크
	@PostMapping(value = "/emailChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int emailCheck(String memberEmail) {
		int result = mService.checkEmail(memberEmail);
		Pattern pattern = Pattern
				.compile("^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$");
		Matcher matcher = pattern.matcher(memberEmail);

		if (memberEmail.length() > 100) {
			return -2;
		} else if (!matcher.matches()) {
			return -3;
		}

		return result;
	}

	// 로그인
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam("returnUrl") String returnUrl, HttpServletRequest request,
			@ModelAttribute Member member, ModelAndView mv) {
		try {
			System.out.println(returnUrl);
			System.out.println(member);
			
			int result = mService.login(member);
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member.getMemberId());
				member = mService.selectMemberById(member.getMemberId());
				session.setAttribute("nickname", member.getMemberNickname());
				
				if (returnUrl != null && !returnUrl.equals("")) {
					mv.setViewName("redirect:/member/mbtiResult");
				} else {
					mv.setViewName("redirect:/");
				}
			} else {
				Alert alert = new Alert("/member/login", "아이디 또는 비밀번호를 다시 확인해주세요");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate();
				mv.setViewName("redirect:/");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

}
