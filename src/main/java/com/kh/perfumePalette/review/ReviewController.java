package com.kh.perfumePalette.review;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.member.Member;
import com.kh.perfumePalette.order.OrderService;
import com.kh.perfumePalette.order.OrderServiceImpl;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.perfume.Perfume;
import com.kh.perfumePalette.report.Report;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService rService;

	@Autowired
	@Qualifier("rFileUtil")
	private ReviewFileUtil rFileUtil;

	// 후기 게시판 작성 페이지 보여주기
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public ModelAndView showReviewWrite(ModelAndView mv
			, HttpSession session
			, String orderInfo) {
		
		// 주문자 회원 번호 가져오기
		int orderMemberNo = Integer.parseInt(orderInfo.split(";")[0]);
		
		// 세션에 있는 회원번호와 다르면 잘못된 접근 처리하기
		Member loginUser = (Member) session.getAttribute("member");
		if (loginUser == null) {
			Alert alert = new Alert("/member/login", "잘못된 접근입니다.");
			mv.addObject("alert", alert).setViewName("common/alert");
			return mv;
		} else if (orderMemberNo != loginUser.getMemberNo()) {
			Alert alert = new Alert("/", "잘못된 접근입니다.");
			mv.addObject("alert", alert).setViewName("common/alert");
			return mv;
		}
		
		// 주문 번호 가져와서 addObject
		// write페이지에서 글 등록 성공 시
		// 글번호를 ORDER_DETAIL_TBL의 REVIEW_STATUS컬럼에 업데이트하도록 처리하기 위해 필요함
		String orderNo = orderInfo.split(";")[2];
		mv.addObject("orderNo", orderNo);
		
		// 향수 번호 가져오기
		int perfumeNo = Integer.parseInt(orderInfo.split(";")[1]);
		
		// 이미 해당 구매건에 대한 후기를 썼다면 이미 작성한 후기입니다 alert 띄우기
		// 어차피 마이페이지 - 주문 목록에서 작성 버튼은 노출되지 않지만
		// 주소로 입력할 경우 접근 가능할 수 있으므로 차단!
		OrderDetail odInfo = new OrderDetail();
		odInfo.setOrderNo(orderNo);
		odInfo.setPerfumeNo(perfumeNo);
		OrderDetail oDetail = (new OrderServiceImpl()).selectOrderDetailBy(odInfo); 
		if (oDetail.getReviewStatus() != 0) {
			Alert alert = new Alert("/", "이미 후기 작성이 완료되었습니다.");
			mv.addObject("alert", alert).setViewName("common/alert");
			return mv;
		}
		
		// 하드코딩해둔 것
//		int perfumeNo = 80;
		Perfume perfume = rService.selectOneByPerfumeNo(perfumeNo);
		
		mv.addObject("id",UUID.randomUUID());
		
		mv.addObject("perfume", perfume).setViewName("review/reviewWrite");
		return mv;
	}

	// 리스트페이지로 넘겨줄 것
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewInsert(ModelAndView mv, HttpServletRequest request, @ModelAttribute Review review
			,@RequestParam("id") String id) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		    String code = review.getMemberNo() + sdf.format(new Date(System.currentTimeMillis()));
			String content = review.getReviewContents();
			review.setReviewContents(content.replaceAll(id , ""+code));
			review.setrFilename(code);
			int result = rService.insertReview(review);
			String[] sList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for(String aa : sList){
			    if(aa.startsWith(".")){
			        fileList.add(aa);
			    }
			}
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "reviewFileUploads\\" ;
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			if(!folder.exists()){
				folder.mkdirs();
			}
			
			if(!diretory.exists()){
			    diretory.mkdirs();
			}
			if(diretory.exists()){ //파일존재여부확인
			    if(diretory.isDirectory()){ //파일이 디렉토리인지 확인
			        File[] files = diretory.listFiles();
			        for(int i = 0; i < files.length; i++){
			            for(String fileName : fileList) {
			                if (("../../../resources/img/reviewFileUploads/"+id + "/" + files[i].getName()).equals(fileName)) {
			                    files[i].renameTo(new File(savePath + code +"\\" +files[i].getName()));
			                }
			            }
			            if (files[i].delete()) {
			                // 폴더 안 파일 삭제 성공시
			            } else {
			                // 삭제 실패시
			            }
			        }
			    }
			    if(diretory.delete()){
			        // 폴더 삭제시
			    }else{
			        // 폴더 삭제 실패시
			    }
			}else{
			    // 임시 폴더가 없을 시
			}
			
			if (result > 0) {
				Alert alert = new Alert("/review/reviewList", "등록이 완료되었습니다.");
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
	
	//썸머노트 이미지 업로드 
	@PostMapping(value = "/ImgFileUpload", produces = "application/json; charset=utf8")
	@ResponseBody
	public String reviewImgUpload(@RequestParam("file") MultipartFile multipartFile 
			,@RequestParam("id") String id
			,HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
		String savePath = wasRoot + "\\" + "reviewFileUploads\\" + id;
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
			filePath = "../../../resources/img/reviewFileUploads/" + id +"/" + FileName;
			jsonObject.addProperty("src", filePath); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (Exception e) {
		}
		String a = jsonObject.toString();
		return a;
	}
	
	

	// 후기 게시판 리스트 보여주기
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView viewReviewAllList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
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

	// 후기 게시판 Detail 보여주기
	@RequestMapping(value = "/reviewDetail/{reviewNo}", method = RequestMethod.GET)
	public ModelAndView viewReviewDetail(ModelAndView mv, @PathVariable Integer reviewNo) {
		try {
			// 조회수 증가
			rService.updateReviewCount(reviewNo);
			Review review = rService.selectOneReview(reviewNo);
			mv.addObject("review", review).setViewName("review/reviewDetail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}

	// 후기 게시판 검색
	@RequestMapping(value = "/reviewSearch", method = RequestMethod.GET)
	public String reviewSearchView(@ModelAttribute Search search,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		try {
			int totalCount = rService.getListCount(search);
			PageInfo pi = new PageInfo(currentPage, totalCount, 10);
			List<Review> searchList = rService.selectListByKeyword(pi, search);
			if (!searchList.isEmpty()) {
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

	// 후기 게시판 수정 화면
	@RequestMapping(value = "/reviewModify", method = RequestMethod.GET)
	public String showReviewModify(@RequestParam("reviewNo") Integer reviewNo, Model model) {
		try {
			Review review = rService.selectOneReview(reviewNo);
			model.addAttribute("id",UUID.randomUUID());
			if (review != null) {
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

	// 후기 게시판 수정하기
	@RequestMapping(value = "/reviewModify", method = RequestMethod.POST)
	public ModelAndView reviewModify(ModelAndView mv, @ModelAttribute Review review,
			HttpServletRequest request
			,@RequestParam("id") String id,
			Model model) {
		try {
		    String code = review.getrFilename();
			String content = review.getReviewContents();
			review.setReviewContents(content.replaceAll(id , ""+code));
			int result = rService.updateReview(review);
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "reviewFileUploads\\" ;
			File diretory = new File(savePath + id);
			File folder = new File(savePath + code);
			System.out.println(savePath + code);
			
			if (result > 0) {
				if(folder.exists()){ //파일존재여부확인
				    if(folder.isDirectory()){ //파일이 디렉토리인지 확인
				        File[] files = folder.listFiles();
				        for(int i = 0; i < files.length; i++){
				        	
				            if (files[i].delete()) {
				                // 폴더 안 파일 삭제 성공시
				            } else {
				                // 삭제 실패시
				            }
				        }
				    }
				    if(folder.delete()){
				        // 폴더 삭제시
				    }else{
				        // 폴더 삭제 실패시
				    }
				}else{
				    // 임시 폴더가 없을 시
				}
				if(!folder.exists()){
					folder.mkdirs();
				}
			}
			String[] sList = content.split("\"");
			List<String> fileList = new ArrayList<String>();
			for(String aa : sList){
			    if(aa.startsWith(".")){
			        fileList.add(aa);
			    }
			}
			
			if(!diretory.exists()){
			    diretory.mkdirs();
			}
			if(diretory.exists()){ //파일존재여부확인
			    if(diretory.isDirectory()){ //파일이 디렉토리인지 확인
			        File[] files = diretory.listFiles();
			        for(int i = 0; i < files.length; i++){
			            for(String fileName : fileList) {
			                if (("../../../resources/img/reviewFileUploads/"+id + "/" + files[i].getName()).equals(fileName)) {
			                    files[i].renameTo(new File(savePath + code +"\\" +files[i].getName()));
			                }
			            }
			            if (files[i].delete()) {
			                // 폴더 안 파일 삭제 성공시
			            } else {
			                // 삭제 실패시
			            }
			        }
			    }
			    if(diretory.delete()){
			        // 폴더 삭제시
			    }else{
			        // 폴더 삭제 실패시
			    }
			}else{
			    // 임시 폴더가 없을 시
			}
			if (result > 0) {
				Alert alert = new Alert("/review/reviewDetail/" + review.getReviewNo(), "수정이 완료되었습니다.");
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

	@PostMapping("/report")
	@ResponseBody
	public int reviewReport(@ModelAttribute Report report) {
		int result = rService.reviewReport(report);
		return result;
	}

}
