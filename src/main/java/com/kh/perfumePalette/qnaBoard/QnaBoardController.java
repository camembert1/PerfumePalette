package com.kh.perfumePalette.qnaBoard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qbService;
	
	@Autowired
	@Qualifier("qnafileUtil")
	private QnaFileUtil qnafileUtil;
	
	// 문의 게시판 글쓰기
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public ModelAndView qnaBoardWrite(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("member");
		mv.setViewName("qnaBoard/qnaBoardWrite");
		if (memberId == null) {
	        Alert alert = new Alert("/member/login", "로그인이 필요합니다.");
	        mv.addObject("alert", alert);
	        mv.setViewName("common/alert");
	        return mv;
	    }
		return mv;
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public ModelAndView qnaBoardInsert(
			ModelAndView mv
			, @RequestParam(name="uploadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, @ModelAttribute QnaBoard qnaboard) {
		Map<String, String> fileInfo = null;
		try {
			System.out.println(qnaboard);
			fileInfo = qnafileUtil.saveFile(multi, request);
			qnaboard.setqFilename(fileInfo.get("original"));
			qnaboard.setqFilerename(fileInfo.get("rename"));
			qnaboard.setqFilepath(fileInfo.get("renameFilepath"));
			int result = qbService.writeQnaBoard(qnaboard);
			if(result > 0) {
				 mv.setViewName("redirect:/qnaBoard/list");
			}
			else {
	            mv.addObject("msg", "글 등록에 실패하였습니다.").setViewName("common/error");
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 콘솔창에 오류메시지 보여줌
	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
	    }
	    return mv;
	}
	
	// 문의 게시판 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView viewQnaBoardList(HttpServletRequest request, ModelAndView mv) {
	    HttpSession session = request.getSession();
	    String memberId = (String) session.getAttribute("member");
	    try {
	    if (memberId == null) {
	        Alert alert = new Alert("/member/login", "로그인이 필요합니다.");
	        mv.addObject("alert", alert);
	        mv.setViewName("common/alert");
	        return mv;
	    }
	    
	        List<QnaBoard> qbList = qbService.selectAllQnaBoard();
	        mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
	    } catch (Exception e) {
	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
	    }
	    return mv;
	}

	
	
	
}
