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

	
	//유정
	/**
	 * 쇼핑몰 - 향수 목록 출력 (STATUS 값이 1인 것만)
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView perfumeShopList(
			ModelAndView mv
			, String scentCategory) {
		try {
			System.out.println("입력받은값 : " + scentCategory);
			
			List<Perfume> pList = pService.selectAvailablePerfumes(scentCategory);
			System.out.println("불러온 리스트 사이즈 : " + pList.size());
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

}
