package com.kh.perfumePalette.qnaBoard;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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

	// 나 신희채 추가 시작

	// 문의 게시판 글쓰기 + 향수 번호 가지고
	@GetMapping("/write/{perfumeNo}")
	public ModelAndView qnaBoardWritePerfume(ModelAndView mv, HttpServletRequest request,
			@PathVariable("perfumeNo") int perfumeNo) {
		try {
			HttpSession session = request.getSession();
			if ((Member) session.getAttribute("member") == null) {
				Alert alert = new Alert("/member/login", "로그인이 필요한 서비스입니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				mv.addObject("id", UUID.randomUUID()).addObject("perfumeNo", perfumeNo);
				mv.setViewName("qnaBoard/qnaBoardWrite2");
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 에러 출력
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	@PostMapping("/write/{perfumeNo}")
	public ModelAndView qnaBoardInsertPerfumeNo(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute QnaBoard qnaboard, HttpSession session,
			@RequestParam(name = "qnaPassword", required = false) Integer qnaPassword, @RequestParam("id") String id,
			@PathVariable("perfumeNo") int perfumeNo) {
		try {
			Integer UserNo = ((Member) session.getAttribute("member")).getMemberNo();
			qnaboard.setMemberNo(UserNo);
			qnaboard.setQnaPassword(qnaPassword); // 비밀번호 설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String code = qnaboard.getMemberNo() + sdf.format(new Date(System.currentTimeMillis()));
			String content = qnaboard.getQnaContents();
			qnaboard.setQnaContents(content.replaceAll(id, "" + code));
			qnaboard.setqFilename(code);
			qnaboard.setPerfumeNo(perfumeNo);

			int result = qbService.writeQnaBoard(qnaboard);
			String[] sList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for (String aa : sList) {
				if (aa.startsWith(".")) {
					fileList.add(aa);
				}
			}
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "qnaFileUploads\\";
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			if (!diretory.exists()) {
				diretory.mkdirs();
			}
			if (diretory.exists()) { // 파일존재여부확인
				if (diretory.isDirectory()) { // 파일이 디렉토리인지 확인
					File[] files = diretory.listFiles();
					for (int i = 0; i < files.length; i++) {
						for (String fileName : fileList) {
							if (("../../../resources/img/qnaFileUploads/" + id + "/" + files[i].getName())
									.equals(fileName)) {
								files[i].renameTo(new File(savePath + code + "\\" + files[i].getName()));
							}
						}
						if (files[i].delete()) {
							// 폴더 안 파일 삭제 성공시
						} else {
							// 삭제 실패시
						}
					}
				}
				if (diretory.delete()) {
					// 폴더 삭제시
				} else {
					// 폴더 삭제 실패시
				}
			} else {
				// 임시 폴더가 없을 시
			}

			if (result > 0) {
				mv.setViewName("redirect:/perfume/detail/" + perfumeNo);
			} else {
				mv.addObject("msg", "글 등록에 실패하였습니다.").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 오류메시지 보여줌
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 문의 게시판 Detail
	@GetMapping("/qnaDetail/{qnaNo}")
	public ModelAndView qnaDetailView2(@PathVariable("qnaNo") Integer qnaNo,
			HttpSession session, ModelAndView mv) {
		try {
			QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
			mv.addObject("qnaNo", qnaNo);
			mv.addObject("qnaboard", qnaboard).setViewName("qnaBoard/qnaBoardDetail2");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 나 신희채 추가 끝

	// 문의 게시판 글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public ModelAndView qnaBoardWrite(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		mv.addObject("id", UUID.randomUUID());
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
	public ModelAndView qnaBoardInsert(ModelAndView mv, HttpServletRequest request, @ModelAttribute QnaBoard qnaboard,
			HttpSession session, @RequestParam(name = "qnaPassword", required = false) Integer qnaPassword,
			@RequestParam("id") String id) {
		try {
			Integer UserNo = ((Member) session.getAttribute("member")).getMemberNo();
			qnaboard.setMemberNo(UserNo);
			qnaboard.setQnaPassword(qnaPassword); // 비밀번호 설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String code = qnaboard.getMemberNo() + sdf.format(new Date(System.currentTimeMillis()));
			String content = qnaboard.getQnaContents();
			qnaboard.setQnaContents(content.replaceAll(id, "" + code));
			qnaboard.setqFilename(code);

			int result = qbService.writeQnaBoard(qnaboard);
			String[] sList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for (String aa : sList) {
				if (aa.startsWith(".")) {
					fileList.add(aa);
				}
			}
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "qnaFileUploads\\";
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			if (!diretory.exists()) {
				diretory.mkdirs();
			}
			if (diretory.exists()) { // 파일존재여부확인
				if (diretory.isDirectory()) { // 파일이 디렉토리인지 확인
					File[] files = diretory.listFiles();
					for (int i = 0; i < files.length; i++) {
						for (String fileName : fileList) {
							if (("../../../resources/img/qnaFileUploads/" + id + "/" + files[i].getName())
									.equals(fileName)) {
								files[i].renameTo(new File(savePath + code + "\\" + files[i].getName()));
							}
						}
						if (files[i].delete()) {
							// 폴더 안 파일 삭제 성공시
						} else {
							// 삭제 실패시
						}
					}
				}
				if (diretory.delete()) {
					// 폴더 삭제시
				} else {
					// 폴더 삭제 실패시
				}
			} else {
				// 임시 폴더가 없을 시
			}

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

	// 썸머노트 이미지 업로드
	@PostMapping(value = "/ImgFileUpload", produces = "application/json; charset=utf8")
	@ResponseBody
	public String reviewImgUpload(@RequestParam("file") MultipartFile multipartFile, @RequestParam("id") String id,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
		String savePath = wasRoot + "\\" + "qnaFileUploads\\" + id;
		// 폴더가 없을 경우 자동으로 만들어주기 위한 코드(폴더가 있는 경우 동작 안함)
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		try {
			String originalFilename = multipartFile.getOriginalFilename();
			// 실제 파일 저장
			/* SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); */
			String FileName = UUID.randomUUID() + "."
					+ originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			String filePath = savePath + "\\" + FileName;
			File file = new File(filePath);
			multipartFile.transferTo(file);
			filePath = "../../../resources/img/qnaFileUploads/" + id + "/" + FileName;
			jsonObject.addProperty("src", filePath); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {
		}
		String a = jsonObject.toString();
		return a;
	}

//   @RequestMapping(value="/list", method = RequestMethod.GET)
//   public ModelAndView viewQnaBoardList(HttpServletRequest request, ModelAndView mv) {
//       HttpSession session = request.getSession();
//       String memberId = (String) session.getAttribute("member");
//       try {
//       if (memberId == null) {
//           Alert alert = new Alert("/member/login", "로그인이 필요합니다.");
//           mv.addObject("alert", alert);
//           mv.setViewName("common/alert");
//           return mv;
//       }
//       
//           List<QnaBoard> qbList = qbService.selectAllQnaBoard();
//           mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
//       } catch (Exception e) {
//           mv.addObject("msg", e.getMessage()).setViewName("common/error");
//       }
//       return mv;
//   }
//   @RequestMapping(value = "/list", method = RequestMethod.GET)
//   public ModelAndView viewQnaBoardList(ModelAndView mv,
//         @RequestParam(value = "page", required = false, defaultValue = "1") String strCurrentPage) {
//      try {
//         int currentPage = Integer.parseInt(strCurrentPage);
//          PageInfo pageInfo = new PageInfo(currentPage, boardLimit,totalCount);
//         List<QnaBoard> qbList = qbService.selectAllQnaBoard();
//         mv.addObject("qbList", qbList).setViewName("qnaBoard/qnaBoardlist");
//      } catch (Exception e) {
//         mv.addObject("msg", e.getMessage()).setViewName("common/error");
//      }
//      return mv;
//   }

// 문의 게시판 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView viewQnaBoardList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, HttpSession session,
			ModelAndView mv) {
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

	// 문의 게시판 목록 비밀글 맞으면 넘어가도록
	@ResponseBody
	@RequestMapping(value = "/samepwd", method = RequestMethod.POST)
	public String samepwd(Integer qnaNo, String inputPw) {
		try {
			int result = qbService.samepwd(qnaNo);
			String resultValue = inputPw.equals(result + "") ? "1" : "0";
			return resultValue;
		} catch (Exception e) {
			return e.getMessage();
		}
	}

//   // 문의 게시판 Detail
//   @RequestMapping(value = "/detail", method = RequestMethod.GET)
//   public ModelAndView qnaDetailView(@RequestParam(value = "qnaNo", required = false) Integer qnaNo, ModelAndView mv) {
//      try {
//         QnaBoard qnaboard = qbService.QnaBoardDetail(qnaNo);
//         mv.addObject("qnaNo", qnaNo);
//         mv.addObject("qnaboard", qnaboard).setViewName("qnaBoard/qnaBoardDetail");
//      } catch (Exception e) {
//         e.printStackTrace();
//         mv.addObject("msg", e.getMessage());
//         mv.setViewName("common/error");
//      }
//      return mv;
//   }

// 문의 게시판 Detail
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView qnaDetailView(@RequestParam(value = "qnaNo", required = false) Integer qnaNo,
			HttpSession session, ModelAndView mv) {
		try {
			// 로그인한 사용자인지 확인
			if (session.getAttribute("member") == null) {
				Alert alert = new Alert("/member/login", "로그인이 필요합니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
				return mv;
			}
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
	public ModelAndView pwboardModifyView(@RequestParam("qnaNo") Integer qnaNo, HttpSession session, ModelAndView mv,
			@RequestParam(name = "qnaPassword") Integer qnaPassword) {
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
			mv.addObject("id", UUID.randomUUID());
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
	public ModelAndView boardModify(@ModelAttribute QnaBoard qnaboard, HttpServletRequest request,
			@RequestParam("id") String id, ModelAndView mv) {
		try {
			String code = qnaboard.getqFilename();
			String content = qnaboard.getQnaContents();
			qnaboard.setQnaContents(content.replaceAll(id, "" + code));
			int result = qbService.updateqnaBoard(qnaboard);
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "qnaFileUploads\\";
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			if (!diretory.exists()) {
				diretory.mkdirs();
			}
			if (!folder.exists()) {
				folder.mkdirs();
			}
			if (result > 0) {
				if (folder.exists()) { // 파일존재여부확인
					if (folder.isDirectory()) { // 파일이 디렉토리인지 확인
						String[] sList = content.split("\"");
						List<String> fileList = new ArrayList<String>();
						for (String aa : sList) {
							if (aa.startsWith(".")) {
								fileList.add(aa);
							}
						}
						File[] files = folder.listFiles();
						int[] valid = new int[files.length];
						for (int i = 0; i < files.length; i++) {
							for (String fileName : fileList) {
								if (("../../../resources/img/qnaFileUploads/" + code + "/" + files[i].getName())
										.equals(fileName)) {
									valid[i] = 1;
								}
							}
						}
						for (int i = 0; i < valid.length; i++) {
							if (valid[i] != 1) {
								if (files[i].delete()) {

								} else {

								}
							}
						}
					}
				} else {
					// 임시 폴더가 없을 시
				}
			}
			String[] sList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for (String aa : sList) {
				if (aa.startsWith(".")) {
					fileList.add(aa);
				}
			}

			if (diretory.exists()) { // 파일존재여부확인
				if (diretory.isDirectory()) { // 파일이 디렉토리인지 확인
					File[] files = diretory.listFiles();
					for (int i = 0; i < files.length; i++) {
						for (String fileName : fileList) {
							if (("../../../resources/img/qnaFileUploads/" + id + "/" + files[i].getName())
									.equals(fileName)) {
								files[i].renameTo(new File(savePath + code + "\\" + files[i].getName()));
							}
						}
						if (files[i].delete()) {
							// 폴더 안 파일 삭제 성공시
						} else {
							// 삭제 실패시
						}
					}
				}
				if (diretory.delete()) {
					// 폴더 삭제시
				} else {
					// 폴더 삭제 실패시
				}
			} else {
				// 임시 폴더가 없을 시
			}
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

	// 수정, 삭제시 기존 파일 삭제
	private void deleteFile(String getrFilename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources/img");
		String delPath = root + "\\" + "qnaFileUploads";
		String delFilePath = delPath + "\\" + getrFilename;
		File delFile = new File(delFilePath);
		if (delFile.exists()) {
			delFile.delete();
		}
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
			if (result > 0) {

				return "1";
			} else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	// Detail 관리자 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/reply/list", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String Replylist(Integer qnaNo) {
		List<QnaReply> qrList = qbService.selectAllReply(qnaNo);
		// JSONArray <- JSONObject
		// => GSON 한방!
		return new Gson().toJson(qrList);
	}

	// Detail 관리자 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/reply/modify", method = RequestMethod.POST)
	public String ReplyModify(@ModelAttribute QnaReply qnareply) {
		try {
			int result = qbService.updateReply(qnareply);
			if (result > 0) {
				return "1";
			} else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();
		}

	}

	// Detail 관리자 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/reply/delete", method = RequestMethod.GET)
	public String ReplyDelete(Integer replyNo) {
		try {
			int result = qbService.deleteReply(replyNo);
			if (result > 0) {
				return "1";
			} else {
				return "0";
			}
		} catch (Exception e) {
			return e.getMessage();

		}
	}

}
