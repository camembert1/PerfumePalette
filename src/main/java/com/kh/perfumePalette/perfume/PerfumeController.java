package com.kh.perfumePalette.perfume;

import java.util.List;


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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.perfumePalette.FileUtil;
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.wish.Wish;

@Controller
@RequestMapping("/perfume")
public class PerfumeController {

	@Autowired
	private PerfumeService pService;

	@Autowired
	@Qualifier("FileUtil")
	private FileUtil fileUtil;

	
	//유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 페이징 + 필터링 + STATUS1
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView perfumeShopList(
			ModelAndView mv
			, @ModelAttribute PageAndFilter pageAndFilter
			, @RequestParam(name = "page", defaultValue = "1") int currentPage) {
		try {
			
			
			// 페이징 + 필터링
			int totalCount = pService.selectTotalPerfumeCount(pageAndFilter);
			PageInfo pageInfo = new PageInfo(currentPage, totalCount, 16);		// 16은 한 페이지에 노출할 향수 개수
			pageAndFilter.setPageInfo(pageInfo);
			List<Perfume> pList = pService.selectAvailablePerfumes(pageAndFilter);

			if(!pList.isEmpty()) {
				// 향수가 잇으면
				mv.addObject("pList", pList)
				.addObject("paging", pageInfo)
				.addObject("filtering", pageAndFilter)
				.setViewName("perfumeShop/list");
				
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
	
	
	
	/**
	 * 쇼핑몰 - 향수 디테일 출력
	 * @param mv
	 * @param perfumeNo
	 * @return
	 */
	@GetMapping("/detail/{perfumeNo}")
	public ModelAndView perfumeShopDetail(ModelAndView mv, @PathVariable Integer perfumeNo) {
		
		try {
			
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			int reviewCnt = pService.reviewCntByPerfumeNo(perfumeNo);
			
			if(perfume != null) {
				mv.addObject("perfume", perfume).addObject("reviewCnt", reviewCnt).setViewName("perfumeShop/detail");
			} else {
				// 상품 번호를 통한 디테일 페이지 조회 실패 시
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	// for비교
	@PostMapping(value = "/getPerfume", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPerfume(Integer perfumeNo) {
		try {
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			return new Gson().toJson(perfume);
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	
	@PostMapping("/checkWish")
	@ResponseBody
	public String checkWish(@ModelAttribute Wish wish) {
		

		try {
			int result = pService.checkWish(wish);
			if (result > 0) {
				return "success"; // 찜햇다
			} else {
				return "fail"; // 찜안햇다
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	@PostMapping("/wishCnt")
	@ResponseBody
	public String wishCnt(@ModelAttribute Wish wish) {
		try {
			int wishCnt = pService.wishCnt(wish);
			return wishCnt + "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	@PostMapping("/getWishNo")
	@ResponseBody
	public String getWishNo(@ModelAttribute Wish wish) {
		try {
			int wishNo = pService.getWishNo(wish);
			if (wishNo > 0) {
				return wishNo + "";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	@PostMapping("/paySuccess")
	@ResponseBody
	public void paySuccess(String memberEmail, Integer orderAmount) {
		System.out.println("이메일 : " +  memberEmail + "\n주문량 : " + orderAmount);		
	}
	
	

}
