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
import org.springframework.web.bind.annotation.GetMapping;
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
			// TODO: handle exception
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView perfumeRegister(
			ModelAndView mv
			, @RequestParam(value = "uploadFile", required=false) MultipartFile multi
			, HttpServletRequest request
			, @ModelAttribute Perfume perfume) {
		Map<String, String> fileInfo = null;
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("member").equals("admin")) {
				fileInfo = pFileUtil.saveFile(multi, request);
				perfume.setpFilename(fileInfo.get("original"));
				perfume.setpFilerename(fileInfo.get("rename"));
				perfume.setpFilepath(fileInfo.get("renameFilePath"));
				int result = pService.insertPerfume(perfume);
				if(result > 0) {
					Alert alert = new Alert("/perfume/mList", "상품등록이 완료되었습니다.");
					mv.addObject("alert", alert);
					mv.setViewName("common/alert");
				}else {
					Alert alert = new Alert("/perfume/write", "상품등록이 실패하였습니다.");
					mv.addObject("alert", alert);
					mv.setViewName("common/alert");
				}
				
			} else {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
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
	public ModelAndView perfumeModify(ModelAndView mv
			, @RequestParam(value = "reloadFile", required = false) MultipartFile multi
			, HttpServletRequest request
			, @ModelAttribute Perfume perfume) {
		Map<String, String> fileInfo = null;
		try {
			// 수정할 때, 새로 업로드된 파일이 있는 경우
			if (multi != null && !multi.isEmpty()) {
				// 기존 업로드된 파일체크 후
				if (perfume.getpFilename() != null) {
					// 기존 파일 삭제
					this.deleteFile(perfume.getpFilerename(), request);
				}
				fileInfo = pFileUtil.saveFile(multi, request);
				perfume.setpFilename(fileInfo.get("original"));
				perfume.setpFilerename(fileInfo.get("rename"));
				perfume.setpFilepath(fileInfo.get("renameFilePath"));
			}
			
			int result = pService.updatePerfume(perfume);
			if (result > 0) {
//				Alert alert = new Alert("/perfume/mDetail?perfumeNo=" + perfume.getPerfumeNo(), "상품 수정이 완료되었습니다.");
				Alert alert = new Alert("/perfume/mList", "상품 수정이 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
//				mv.setViewName("redirect:/perfume/mDetail?perfumeNo=" + perfume.getPerfumeNo());
			} else {
				Alert alert = new Alert("/perfume/modify?perfumeNo=" + perfume.getPerfumeNo(), "상품 수정이 완료되지 않았습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public ModelAndView perfumeRemove(@RequestParam("perfumeNo") int perfumeNo
			, @ModelAttribute Perfume perfume
			, HttpServletRequest request
			, ModelAndView mv) {
		try {
			Perfume perfumeOne = pService.selectOneByNo(perfumeNo);
			if (perfumeOne.getpFilename() != null) {
				// 기존 파일 삭제
				this.deleteFile(perfumeOne.getpFilerename(), request);
			}
			int result = pService.deletePerfume(perfumeNo);
			if (result > 0) {
				Alert alert = new Alert("/perfume/mList", "상품 삭제가 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				mv.addObject("msg", "삭제가 완료되지 않았습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
		
	// 수정시 기존 파일 삭제
	private void deleteFile(String getpFilename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources/img");
		String delPath = root + "\\" + "perfumeFileUploads";
		String delFilePath = delPath + "\\" + getpFilename;
		File delFile = new File(delFilePath);
		if (delFile.exists()) {
			delFile.delete();
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
	
	//유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 (STATUS 값이 1인 것만)
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView perfumeShopList(
			ModelAndView mv
			, String pScentCategory) {
		try {
			
			List<Perfume> pList = pService.selectAvailablePerfumes(pScentCategory);

			if(!pList.isEmpty()) {
				// 향수가 잇으면
				mv.addObject("pList", pList).setViewName("perfumeShop/list");
				
			} else {
				// 목록에 암것도 없으면
				mv.addObject("msg", "상품이 없습니다.").setViewName("perfumeShop/list");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	@GetMapping("/detail")
	public ModelAndView perfumeShopDetail(ModelAndView mv, Integer perfumeNo) {
		
		try {
			
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			
			if(perfume != null) {
				mv.addObject("perfume", perfume).setViewName("perfumeShop/detail");
			} else {
				// 상품 번호를 통한 디테일 페이지 조회 실패 시
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

}
