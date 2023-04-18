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
import com.kh.perfumePalette.PageInfo;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qbService;

	@Autowired
	@Qualifier("qnafileUtil")
	private QnaFileUtil qnafileUtil;

	// 문의 게시판 글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
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

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView qnaBoardInsert(ModelAndView mv,
			@RequestParam(name = "uploadFile", required = false) MultipartFile multi, HttpServletRequest request,
			@ModelAttribute QnaBoard qnaboard, HttpSession session) {
		Map<String, String> fileInfo = null;
		try {
			Integer UserNo = (Integer) session.getAttribute("memberNo");
			qnaboard.setMemberNo(UserNo);
			if (multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = qnafileUtil.saveFile(multi, request);
				qnaboard.setqFilename(fileInfo.get("original"));
				qnaboard.setqFilerename(fileInfo.get("rename"));
				qnaboard.setqFilepath(fileInfo.get("renameFilepath"));
			}
			int result = qbService.writeQnaBoard(qnaboard);
			if (result > 0) {
				mv.setViewName("redirect:/qnaboard/list");
			} else {
				mv.addObject("msg", "글 등록에 실패하였습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 오류메시지 보여줌
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 문의 게시판 목록
//	@RequestMapping(value="/list", method = RequestMethod.GET)
//	public ModelAndView viewQnaBoardList(HttpServletRequest request, ModelAndView mv) {
//	    HttpSession session = request.getSession();
//	    String memberId = (String) session.getAttribute("member");
//	    try {
//	    if (memberId == null) {
//	        Alert alert = new Alert("/member/login", "로그인이 필요합니다.");
//	        mv.addObject("alert", alert);
//	        mv.setViewName("common/alert");
//	        return mv;
//	    }
//	    
//	        List<QnaBoard> qbList = qbService.selectAllQnaBoard();
//	        mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
//	    } catch (Exception e) {
//	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
//	    }
//	    return mv;
//	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewQnaBoardList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") String strCurrentPage) {
		try {
			int currentPage = Integer.parseInt(strCurrentPage);
//	    	PageInfo pageInfo = new PageInfo(currentPage, boardLimit,totalCount);
			List<QnaBoard> qbList = qbService.selectAllQnaBoard();
			mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	// 페이징 처리 할 때 쓸 코드
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public ModelAndView viewQnaBoardList(ModelAndView mv,
//	        @RequestParam(value = "page", required = false, defaultValue = "1") String strCurrentPage) {
//	    try {
//	        int currentPage = Integer.parseInt(strCurrentPage);
//	        int boardLimit = 10; // 한 페이지당 보여줄 게시글 수
//	        int totalCount = qbService.selectQnaBoardCount(); // 총 게시글 수
//
//	        PageInfo pageInfo = new PageInfo(currentPage, totalCount, boardLimit);
//	        List<QnaBoard> qbList = qbService.selectQnaBoardList(pageInfo.getStartIndex(), boardLimit);
//
//	        mv.addObject("qbList", qbList)
//	                .addObject("pageInfo", pageInfo)
//	                .setViewName("qnaBoard/qnaBoardlist");
//	    } catch (Exception e) {
//	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
//	    }
//	    return mv;
//	}


	// 게시판 목록 네비게이터 시작, 끝값 설정
	private PageInfo PageInfoWrite(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10; // 한 페이지 당 게시글 개수
		int naviLimit = 5; // 한 페이지 당 pageNavi 수
		int maxPage; // 페이지의 마지막 번호
		int startNavi; // pageNavi 시작값
		int endNavi; // pageNavi 끝값

		maxPage = (int) ((double) totalCount / boardLimit + 0.9);
		startNavi = (((int) ((double) currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (endNavi > maxPage) {
			endNavi = maxPage;
		}
//		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}

	// 문의 게시판 상세정보

	@RequestMapping(value = "/detail", method = RequestMethod.GET) 
	  public ModelAndView qnaDetailView(@RequestParam("memberNo") Integer memberNo,
	  ModelAndView mv) { 
		try { 
		    QnaBoard qnaboard = qbService.QnaBoardDetail(memberNo);
		    mv.addObject("qnaboard", qnaboard).setViewName("qnaboard/qnaBoardDetail");
	}  catch(Exception e) {
		e.printStackTrace();
		mv.addObject("msg", e.getMessage());
		mv.setViewName("common/error");
	}
		return mv;
	}
}
