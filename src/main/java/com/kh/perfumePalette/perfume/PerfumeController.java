package com.kh.perfumePalette.perfume;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.perfumePalette.FileUtil;
import com.kh.perfumePalette.PageInfo;

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
			, @ModelAttribute Compare compare
			, @RequestParam(name = "page", defaultValue = "1") int currentPage) {
		try {
			
			System.out.println("perfume1 : " + compare.getPerfume1());
			System.out.println("perfume2 : " + compare.getPerfume2());
			System.out.println("perfume3 : " + compare.getPerfume3());
			
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
				.addObject("compare", compare)
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
