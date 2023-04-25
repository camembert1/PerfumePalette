package com.kh.perfumePalette.review;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.perfume.Perfume;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@Autowired
	@Qualifier("rFileUtil")
	private ReviewFileUtil rFileUtil;
	
	//후기 게시판 작성 페이지 보여주기
	@RequestMapping(value="/reviewWrite", method = RequestMethod.GET)
	public ModelAndView showReviewWrite(ModelAndView mv, Integer perfumeNo) {
		//하드코딩해둔 것
		perfumeNo = 80;
		Perfume perfume = rService.selectOneByPerfumeNo(perfumeNo);
		
		mv.addObject("perfume", perfume);
		mv.setViewName("review/reviewWrite");
		return mv;
	}
	
	//리스트페이지로 넘겨줄 것
	@RequestMapping(value="/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewInsert(ModelAndView mv
			, @RequestParam(value="uploadFile", required=false) MultipartFile multipartFile
			, HttpServletRequest request
			, @ModelAttribute Review review) {
		Map<String, String> fileInfo = null;
		try {
			fileInfo = rFileUtil.saveFile(multipartFile, request);
			review.setrFilename(fileInfo.get("original"));
			review.setrFilerename(fileInfo.get("rename"));
			review.setrFilepath(fileInfo.get("renameFilePath"));
			int result = rService.insertReview(review);
			if(result > 0) {
				Alert alert = new Alert("/review/reviewList","등록이 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				Alert alert = new Alert("/review/reviewWrite", "등록에 실패하였습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		
		return mv;
	}
	
	// 후기 게시판 리스트 보여주기
	@RequestMapping(value="/reviewList", method = RequestMethod.GET)
	public ModelAndView viewReviewAllList(
			ModelAndView mv
			,@RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			int totalCount = rService.getListCount();
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<Review> rList = rService.selectAllReview(pi);
			mv.addObject("paging", pi).addObject("rList", rList).setViewName("review/reviewList");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	

	//후기 게시판 Detail 보여주기
	@RequestMapping(value="/reviewDetail/{reviewNo}", method = RequestMethod.GET)
	public ModelAndView viewReviewDetail(ModelAndView mv, @PathVariable Integer reviewNo) {
		try {
			//조회수 증가
			rService.updateReviewCount(reviewNo);
			Review review = rService.selectOneReview(reviewNo);
			mv.addObject("review", review).setViewName("review/reviewDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	//후기 게시판 검색
	@RequestMapping(value="/reviewSearch" , method = RequestMethod.GET)
	public String reviewSearchView(
			@ModelAttribute Search search
			,@RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage
			,Model model) {
		try {
			int totalCount = rService.getListCount(search);
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<Review> searchList = rService.selectListByKeyword(pi, search);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("paging", pi);
				model.addAttribute("rList", searchList);
				return "review/reviewSearch";
			} else {
				model.addAttribute("msg", "조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//후기 게시판 수정 화면
	@RequestMapping(value = "/reviewModify", method = RequestMethod.GET)
	public String showReviewModify(@RequestParam("reviewNo") Integer reviewNo, Model model) {
		try {
			Review review = rService.selectOneReview(reviewNo);
			if(review != null) {
				model.addAttribute("review", review);
				return "review/reviewModify";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에서 사용
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//후기 게시판 수정하기
	@RequestMapping(value="/reviewModify", method = RequestMethod.POST)
	public ModelAndView reviewModify(
					ModelAndView mv
					,@ModelAttribute Review review
					,@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile
					,HttpServletRequest request
					,Model model) {
		Map<String, String> fileInfo = null;
		try {
			System.out.println(review);
			//수정할 경우, 새로 업로드 된 파일이 있는 경우
			if(reloadFile != null && !reloadFile.isEmpty()) {
				// 기존 업로드 된 파일 체크 후
				if(review.getrFilename() != null) {
					// 기존 파일 삭제
					this.deleteFile(review.getrFilename(), request);
				}
				fileInfo = rFileUtil.saveFile(reloadFile, request);
				review.setrFilename(fileInfo.get("original"));
				review.setrFilerename(fileInfo.get("rename"));
				review.setrFilepath(fileInfo.get("renameFilePath"));
			}
			
			int result = rService.updateReview(review);
			if(result > 0) {
				Alert alert = new Alert("/review/reviewDetail/" + review.getReviewNo(),"수정이 완료되었습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			} else {
				Alert alert = new Alert("/review/reviewList", "상품 수정이 완료되지 않았습니다.");
				mv.addObject("alert", alert);
				mv.setViewName("common/alert");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// 수정, 삭제시 기존 파일 삭제
	private void deleteFile(String getrFilename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources/img");
		String delPath = root + "\\" + "reviewFileUploads";
		String delFilePath = delPath + "\\" + getrFilename;
		File delFile = new File(delFilePath);
		if (delFile.exists()) {
			delFile.delete();
		}

	}
		
}
