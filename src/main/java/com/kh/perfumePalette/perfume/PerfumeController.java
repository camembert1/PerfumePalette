package com.kh.perfumePalette.perfume;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

@Controller
@RequestMapping("/perfume")
public class PerfumeController {

	@Autowired
	private PerfumeService pService;

	@Autowired
	@Qualifier("pFileUtil")
	private PerfumeFileUtil pFileUtil;

	// 상품 등록화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public ModelAndView writeView(ModelAndView mv, HttpSession session) {
		try {
			if (session.getAttribute("member") == null || !session.getAttribute("member").equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				mv.setViewName("perfume/write");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView perfumeRegister(ModelAndView mv,
			@RequestParam(value = "uploadFile", required = false) MultipartFile multi, HttpServletRequest request,
			@ModelAttribute Perfume perfume) {
		Map<String, String> fileInfo = null;
		try {
			fileInfo = pFileUtil.saveFile(multi, request);
			perfume.setpFilename(fileInfo.get("original"));
			perfume.setpFilerename(fileInfo.get("rename"));
			perfume.setpFilepath(fileInfo.get("renameFilePath"));
			int result = pService.insertPerfume(perfume);
			if (result > 0) {
				Alert alert = new Alert("/perfume/mList", "상품 등록 성공");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				Alert alert = new Alert("/perfume/write", "상품 등록 실패");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 수정 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView perfumeModifyView(@RequestParam("perfumeNo") Integer perfumeNo, ModelAndView mv) {
		try {
			Perfume perfume = pService.selectOneByNo(perfumeNo);
			mv.addObject("perfume", perfume);
			mv.setViewName("perfume/modify");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
			return mv;
		}
	}

	// 상품 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView perfumeModify(ModelAndView mv,
			@RequestParam(value = "uploadFile", required = false) MultipartFile multi, HttpServletRequest request,
			@ModelAttribute Perfume perfume) {
		Map<String, String> fileInfo = null;
		try {
			if (multi != null && !multi.isEmpty()) {
				if (perfume.getpFilerename() != null) {
					this.deleteFile(perfume.getpFilerename(), request);
				}
			}
			if (multi != null && !multi.isEmpty()) {
				fileInfo = pFileUtil.saveFile(multi, request);
				perfume.setpFilename(fileInfo.get("original"));
				perfume.setpFilerename(fileInfo.get("rename"));
				perfume.setpFilepath(fileInfo.get("renameFilePath"));
			}
			int result = pService.updatePerfume(perfume);
			if (result > 0) {
				mv.setViewName("redirect:/perfume/mDetail?perfumeNo=" + perfume.getPerfumeNo());
				return mv;
			} else {
				mv.addObject("msg", "상품 수정이 완료되지 않았습니다.");
				return mv;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
			return mv;
		}
	}

	// 수정시 기존 파일 삭제
	private void deleteFile(String getpFilerename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\perfumeFileUploads";
		String delFilePath = delPath + "\\" + getpFilerename;
		File delFile = new File(delFilePath);
		if (delFile.exists()) {
			delFile.delete();
		}

	}

	// 상품 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String perfumeRemove(@RequestParam("perfumeNo") int perfumeNo, Model model) {
		try {
			int result = pService.deletePerfume(perfumeNo);
			if (result > 0) {
				return "redirect:/perfume/mList";
			} else {
				model.addAttribute("msg", "삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 상품 리스트 관리자 뷰
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public ModelAndView viewPerfumeManagerList(ModelAndView mv) {
		List<Perfume> pList = pService.selectPerfumeList();
		mv.addObject("pList", pList);
		mv.setViewName("perfume/mList");
		return mv;
	}

	// 상품 상세 관리자
	@RequestMapping(value = "/mDetail", method = RequestMethod.GET)
	public String perfumeDetailView(@RequestParam("perfumeNo") int perfumeNo, Model model) {
		try {
			Perfume perfume = pService.selectOneByNo(perfumeNo);
			model.addAttribute("perfume", perfume);
			return "perfume/mDetail";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

}
