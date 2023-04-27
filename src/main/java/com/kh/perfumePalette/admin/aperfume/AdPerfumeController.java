package com.kh.perfumePalette.admin.aperfume;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.member.Member;

@Controller
@RequestMapping("/perfume")
public class AdPerfumeController {

	@Autowired
	private AdPerfumeService pService;

	@Autowired
	@Qualifier("adpFileUtil")
	private AdPerfumeFileUtil pFileUtil;

	// 상품 등록화면
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public ModelAndView writeView(ModelAndView mv, HttpSession session) {
		try {
			if (session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
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
			, @ModelAttribute AdPerfume perfume) {
		Map<String, String> fileInfo = null;
		try {
			HttpSession session = request.getSession();
			if (((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
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
	public ModelAndView perfumeModifyView(
			@RequestParam("perfumeNo") Integer perfumeNo
			, ModelAndView mv
			, HttpSession session) {
		try {
			if (session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				AdPerfume perfume = pService.selectOneByNo(perfumeNo);
				mv.addObject("perfume", perfume);
				mv.setViewName("perfume/modify");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView perfumeModify(ModelAndView mv
			, @RequestParam(value = "reloadFile", required = false) MultipartFile multi
			, @ModelAttribute AdPerfume perfume
			, HttpServletRequest request) {
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
				Alert alert = new Alert("/perfume/mList", "상품 수정이 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
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
	// 내가 해보는 다중 수정(노출로 변경)
	@PostMapping("/show")
	@ResponseBody
	public String perfumeUpdate(int [] arr
			, HttpServletRequest request) {
		int result = 0;
		try {
			for(int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
				result = pService.updateOkPerfume(arr[i]);
			}
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	// 다중 수정(비노출로 변경)
	@PostMapping("/noShow")
	@ResponseBody
	public String perfumeNoShow(int [] arr, HttpServletRequest request) {
		int result = 0;
		try {
			for(int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
				result = pService.updateNoPerfume(arr[i]);
			}
			if(result > 0) {
				return "1";
			}else {
				return "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
	}
	

	// 상품 삭제
//	@RequestMapping(value = "/remove", method = RequestMethod.GET)
//	public ModelAndView perfumeRemove(@RequestParam("perfumeNo") int perfumeNo
//			, @ModelAttribute Perfume perfume
//			, HttpServletRequest request
//			, ModelAndView mv) {
//		try {
//			Perfume perfumeOne = pService.selectOneByNo(perfumeNo);
//			if (perfumeOne.getpFilename() != null) {
//				// 기존 파일 삭제
//				this.deleteFile(perfumeOne.getpFilerename(), request);
//			}
//			int result = pService.deletePerfume(perfumeNo);
//			if (result > 0) {
//				Alert alert = new Alert("/perfume/mList", "상품 삭제가 완료되었습니다.");
//				mv.addObject("alert", alert);
//				mv.setViewName("common/alert");
//			} else {
//				mv.addObject("msg", "삭제가 완료되지 않았습니다.");
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
//		}
//		return mv;
//	}
	// 상품 다중 삭제
	@PostMapping("/remove")
	@ResponseBody
	public String perfumeRemove(int [] arr 
//			, @RequestParam("perfumeNo") int perfumeNo
//			, @ModelAttribute Perfume perfume
			, HttpServletRequest request
			, ModelAndView mv) {
		int result = 0;
		try {
			for(int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
				AdPerfume perfumeOne = pService.selectOneByNo(arr[i]);
				if (perfumeOne.getpFilename() != null) {
					// 기존 파일 삭제
					this.deleteFile(perfumeOne.getpFilerename(), request);
				}
				result = pService.deletePerfume(arr[i]);
			}
			if (result > 0) {
				return "1";
			} else {
				return "0";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
//			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
	}
	
		
	// 수정, 삭제시 기존 파일 삭제
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
	public ModelAndView viewPerfumeManagerList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			if (session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				int totalCount = pService.getListCount();
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdPerfume> pList = pService.selectPerfumeList(pi);
				mv.addObject("paging", pi);
				mv.addObject("pList", pList);
				mv.setViewName("perfume/mList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 상품 상세 관리자
	@RequestMapping(value = "/mDetail", method = RequestMethod.GET)
	public String perfumeDetailView(@RequestParam("perfumeNo") int perfumeNo, Model model) {
		try {
			AdPerfume perfume = pService.selectOneByNo(perfumeNo);
			model.addAttribute("perfume", perfume);
			return "perfume/mDetail";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 상품 검색
	@GetMapping("/search")
	public String perfumeSearchView(
			@ModelAttribute Search search
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
			, Model model) {
		try {
			
			int totalCount = pService.getListCount(search);
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<AdPerfume> searchList = pService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("paging", pi);
				model.addAttribute("search", search);
				model.addAttribute("sList", searchList);
				return "perfume/search";
			}else {
				Alert alert = new Alert("/perfume/search", "존재하지 않는 상품입니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 찜 리스트
	@GetMapping(value = "/wishList")
	public ModelAndView viewPerfumeWishList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam("perfumeNo") int perfumeNo
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			if(session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				int totalCount = pService.getWishListCount();
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdPerfume> wList = pService.selectWishList(perfumeNo, pi);
				mv.addObject("paging", pi);
				mv.addObject("wList", wList);
				mv.setViewName("perfume/wishList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 장바구니 리스트
	@GetMapping(value = "/cartList")
	public ModelAndView viewPerfumeCartList(
			ModelAndView mv
			, HttpSession session
			, @RequestParam("perfumeNo") int perfumeNo
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			if(session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			} else {
				int totalCount = pService.getCartListCount();
				PageInfo pi = new PageInfo(currentPage, totalCount, 10);
				List<AdPerfume> cList = pService.selectCartList(perfumeNo, pi);
				mv.addObject("paging", pi);
				mv.addObject("cList", cList);
				mv.setViewName("perfume/cartList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
}
















