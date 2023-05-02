package com.kh.perfumePalette.perfume;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.member.Member;
import com.kh.perfumePalette.wish.Wish;

@Controller
@RequestMapping("/perfume")
public class PerfumeController {	

	@Autowired
	private PerfumeService pService;

	
	/**
	 * 향수 목록 출력 / 페이징 + 필터링 + STATUS1
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
	 * 향수 디테일 출력
	 * @param mv
	 * @param perfumeNo
	 * @return
	 */
	@GetMapping("/detail/{perfumeNo}")
	public ModelAndView perfumeShopDetail(ModelAndView mv
			, HttpSession session
			, @PathVariable Integer perfumeNo) {
		
		try {
			int wishStatus = 0;
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				 
				// 로그인 상태라면 해당 향수 찜 여부 확인하기!
				Wish wishInfo = new Wish();
				wishInfo.setMemberId(member.getMemberId());
				wishInfo.setPerfumeNo(perfumeNo);
				
				// 찜했다면 wishStatus값이 1이 됨
				wishStatus = pService.checkWish(wishInfo);
			}
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			int reviewCnt = pService.reviewCntByPerfumeNo(perfumeNo);
			
			if(perfume != null) {
				mv
				.addObject("wishStatus", wishStatus)
				.addObject("perfume", perfume)
				.addObject("reviewCnt", reviewCnt)
				.setViewName("perfumeShop/detail");
			} else {
				// 상품 번호를 통한 디테일 페이지 조회 실패 시
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	/**
	 * 목록 - 비교 모달창에 넣을 향수 정보 by perfumeNo
	 * @param perfumeNo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/getPerfume", produces = "application/json;charset=utf-8")
	public String getPerfume(Integer perfumeNo) {
		try {
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			return new Gson().toJson(perfume);
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	
	/**
	 * 목록 - 로그인한 회원의 찜 여부 조회 by memberId, perfumeNo
	 * @param wish
	 * @return
	 */
	@ResponseBody
	@PostMapping("/checkWish")
	public String checkWish(@ModelAttribute Wish wish) {	
		try {
			
			// wish에 들은 정보 : pefumeNo, memberId
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
	
	
	/**
	 * 목록 - 해당 향수 찜 개수 조회 by perfumeNo
	 * @param wish
	 * @return
	 */
	@ResponseBody
	@PostMapping("/wishCnt")
	public String wishCnt(@ModelAttribute Wish wish) {
		try {
			int wishCnt = pService.wishCnt(wish);
			return wishCnt + "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	
	/**
	 * 목록 - 찜 취소를 위한 찜 번호 조회 by memberId, perfumeNo
	 * @param wish
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getWishNo")
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
	
	
	/**
	 * 디테일 - 로그인한 회원의 장바구니 여부 조회 by memberId, perfumeNo
	 * @param cart
	 * @return
	 */
	@ResponseBody
	@PostMapping("/checkCart")
	public int checkCart(@ModelAttribute Cart cart) {
		try {
			int result = pService.checkCart(cart);
			if (result > 0) return result;
			else return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
	/**
	 * 주문서 - 구매 성공 시 재고 감소 by cartNo
	 * @param cartNoArr
	 * @return
	 */
	@ResponseBody
	@PostMapping("/minusStock")
	public int minusStock(int[] cartNoArr) {
		try {
			int result = 0;
			for(int cartNo : cartNoArr) {
				// cartNo를 통해 perfumeNo, cartQuantity 조회 가능
				// 해당 향수의 수량을 cartQuantity만큼 감소
				result = 0;
				result = pService.minusStock(cartNo);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
