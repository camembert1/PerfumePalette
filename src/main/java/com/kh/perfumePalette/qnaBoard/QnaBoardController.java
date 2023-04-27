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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.member.Member;

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
		mv.setViewName("qnaBoard/qnaBoardWrite");
		if ((Member) session.getAttribute("member") == null) {
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
			@ModelAttribute QnaBoard qnaboard, HttpSession session , @RequestParam(name = "qnaPassword") Integer qnaPassword) {
		Map<String, String> fileInfo = null;
		try {
			Integer UserNo = ((Member) session.getAttribute("member")).getMemberNo();
			qnaboard.setMemberNo(UserNo);
			qnaboard.setQnaPassword(qnaPassword); // 비밀번호 설정
			if (multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = qnafileUtil.saveFile(multi, request);
				qnaboard.setqFilename(fileInfo.get("original"));
				qnaboard.setqFilerename(fileInfo.get("rename"));
				qnaboard.setqFilepath(fileInfo.get("renameFilePath"));
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
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public ModelAndView viewQnaBoardList(ModelAndView mv,
//			@RequestParam(value = "page", required = false, defaultValue = "1") String strCurrentPage) {
//		try {
//			int currentPage = Integer.parseInt(strCurrentPage);
//	    	PageInfo pageInfo = new PageInfo(currentPage, boardLimit,totalCount);
//			List<QnaBoard> qbList = qbService.selectAllQnaBoard();
//			mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
//		}
//		return mv;
//	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewQnaBoardList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
	    try {
	        int totalCount = qbService.getqnaBoardCount(); // 전체 게시글 개수 조회
	        PageInfo pi = new PageInfo(currentPage, totalCount, 10); // 한 페이지당 10개씩 표시
	        List<QnaBoard> qbList = qbService.selectAllQnaBoard(pi); // 해당 페이지의 게시글 목록 조회
	        mv.addObject("paging", pi);

	            mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist"); // 일반 사용자용 jsp 페이지
	        
	    } catch (Exception e) {
	        mv.addObject("msg", e.getMessage()).setViewName("common/error");
	    }
	    return mv;
	}

	

//	// 문의 게시판 Detail
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public ModelAndView qnaDetailView(@RequestParam(value = "qnaNo", required = false) Integer qnaNo, ModelAndView mv) {
//		try {
//			QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
//			mv.addObject("qnaNo", qnaNo);
//			mv.addObject("qnaboard", qnaboard).setViewName("qnaBoard/qnaBoardDetail");
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/error");
//		}
//		return mv;
//	}
	
	// 문의 게시판 Detail
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView qnaDetailView(@RequestParam(value = "qnaNo", required = false) Integer qnaNo, HttpSession session,  ModelAndView mv) {
		try {
			QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
			mv.addObject("qnaNo", qnaNo);
			mv.addObject("qnaboard", qnaboard).setViewName("qnaBoard/qnaBoardDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 문의 게시판 비밀글 Detail
	@RequestMapping(value = "/pwdetail", method = RequestMethod.GET)
	public ModelAndView pwboardModifyView(@RequestParam("qnaNo") Integer qnaNo, HttpSession session, ModelAndView mv, @RequestParam(name = "qnaPassword") Integer qnaPassword) {
	    try {
	        // 입력된 비밀번호를 이용해서 QnaBoard 조회
	        QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
	        if (qnaboard != null) {
	            // QnaBoard 객체에 저장된 비밀번호와 입력받은 비밀번호를 비교하여 일치하면 detail 페이지로 이동
	            if (qnaboard.getQnaPassword().equals(qnaPassword)) {
	                mv.addObject("qnaNo", qnaNo);
	                mv.addObject("qnaboard", qnaboard);
	                mv.setViewName("qnaBoard/qnaBoardDetail");
	            } else {
	                // 비밀번호가 일치하지 않을 경우, 에러 메시지를 출력하고 이전 페이지로 이동
	                mv.addObject("msg", "비밀번호가 일치하지 않습니다.");
	                mv.setViewName("common/error");
	            }
	        } else {
	            mv.addObject("msg", "데이터 조회에 실패하였습니다.");
	            mv.setViewName("common/error");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mv.addObject("msg", e.getMessage());
	        mv.setViewName("common/error");
	    }
	    return mv;
	}

	// 문의 게시판 Detail 수정 View
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyView(@RequestParam("qnaNo") Integer qnaNo, HttpSession session, ModelAndView mv) {
		try {
			QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
			if (qnaboard != null) {
				mv.addObject("qnaNo", qnaNo);
				mv.addObject("qnaboard", qnaboard);
				mv.setViewName("qnaBoard/qnaBoardModify");
			} else {
				mv.addObject("msg", "데이터 조회에 실패하였습니다.");
				mv.setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 문의 게시판 Detail 수정 Logic
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView boardModify(@ModelAttribute QnaBoard qnaboard,
			@RequestParam(name = "uploadFile", required = false) MultipartFile multi, HttpServletRequest request,
			ModelAndView mv) {
		Map<String, String> fileInfo = null;
		try {
			if (multi.getSize() != 0 && !multi.getOriginalFilename().equals("")) {
				fileInfo = qnafileUtil.saveFile(multi, request);
				qnaboard.setqFilename(fileInfo.get("original"));
				qnaboard.setqFilerename(fileInfo.get("rename"));
				qnaboard.setqFilepath(fileInfo.get("renameFilePath"));
			} else {
				// 파일을 업로드하지 않았을 경우, 기존의 파일 정보를 그대로 사용한다.
				QnaBoard qnaBoardDetail = qbService.QnaBoardDetail(qnaboard.getQnaNo());
				qnaboard.setqFilename(qnaBoardDetail.getqFilename());
				qnaboard.setqFilerename(qnaBoardDetail.getqFilerename());
				qnaboard.setqFilepath(qnaBoardDetail.getqFilepath());
			}
			int result = qbService.updateqnaBoard(qnaboard);
			if (result > 0) {
				mv.addObject("qnaNo", qnaboard.getQnaNo());
				mv.addObject("qnaboard", qnaboard);
				mv.setViewName("redirect:/qnaboard/detail?qnaNo=" + qnaboard.getQnaNo());
			} else {
				mv.addObject("msg", "게시판 수정이 완료되었습니다.");
				mv.setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 문의 게시판 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public ModelAndView qnaRemove(@RequestParam(value = "qnaNo", required = false) int qnaNo, ModelAndView mv) {
		try {
			int result = qbService.deleteQnaBoard(qnaNo);
			if (result > 0) {
				mv.setViewName("redirect:/qnaboard/list");
			} else {
				mv.addObject("msg", "질문이 삭제되지 않았습니다.");
				mv.setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "질문이 삭제되지 않았습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// Detail 관리자 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/reply/register", method = RequestMethod.POST)
	public String ReplyInsert(@ModelAttribute QnaReply qnaReply) {
		try {
			int result = qbService.insertReply(qnaReply);
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	
	// Detail 관리자 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/reply/list", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String Replylist(Integer qnaNo ) {
		List<QnaReply> qrList = qbService.selectAllReply(qnaNo);
		// JSONArray <- JSONObject
		// => GSON 한방!
		return new Gson().toJson(qrList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	

