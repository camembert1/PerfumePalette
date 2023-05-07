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
import com.kh.perfumePalette.review.Review;
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
			int rAlertStatus = 0;
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				
				// 로그인 상태라면 해당 향수 찜 여부 확인하기!
				Wish wishInfo = new Wish();
				wishInfo.setMemberId(member.getMemberId());
				wishInfo.setPerfumeNo(perfumeNo);
				
				// 찜했다면 wishStatus값이 1이 됨
				wishStatus = pService.checkWish(wishInfo);
				
				
				// 로그인 상태라면 해당 향수 재입고 알림 신청 여부 확인하기!
				ShopAlert rAlertInfo = new ShopAlert();
				rAlertInfo.setMemberNo(member.getMemberNo());
				rAlertInfo.setPerfumeNo(perfumeNo);
				
				// 재입고 알림 신청 상태라면 값이 1이 됨
				rAlertStatus = pService.checkAlert(rAlertInfo);
				
			}
			
			// 디테일 해당 향수 객체
			Perfume perfume = pService.selectOneByPerfumeNo(perfumeNo);
			
			// 해당 향수에 달린 리뷰 수
			int reviewCnt = pService.reviewCntByPerfumeNo(perfumeNo);
			
			// 해당 향수에 달린 리뷰 List
			List<Review> rList = pService.reviewListByPerfumeNo(perfumeNo);
			if (!rList.isEmpty()) {
				
				// 리뷰 내용 html태그 제거
				for (Review review : rList) {
					if (review.getReviewContents() != null) {
						String outputString = review.getReviewContents().replaceAll("<[^>]*>", "");
						review.setReviewContents(outputString);
					}
				}
							
				// 해당 향수에 달린 리뷰 Score 평균
				double sum = 0;
				for (Review review : rList) {
					sum += review.getrViewscore();
				}
				double scoreAvg = sum / rList.size();
				mv.addObject("scoreAvg", scoreAvg);
			}
			
			
			if(perfume != null) {
				mv
				.addObject("rAlertStatus", rAlertStatus)
				.addObject("wishStatus", wishStatus)
				
				.addObject("perfume", perfume)
				
				.addObject("reviewCnt", reviewCnt)
				
				.addObject("rList", rList)
				.setViewName("perfumeShop/detail");
			} else {
				// 상품 번호를 통한 디테일 페이지 조회 실패 시
				mv.addObject("msg", "상품 조회 실패!").setViewName("common/error");
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
	 * 목록 - 해당 향수 리뷰 개수 조회 by perfumeNo
	 * @param perfumeNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reviewCnt")
	public String reviewCnt(Integer perfumeNo) {
		try {
			int reviewCnt = pService.reviewCntByPerfumeNo(perfumeNo);
			return reviewCnt + "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
		}
	}
	
	/**
	 * 목록 - 해당 향수 리뷰 평점 조회 by perfumeNo
	 * @param perfumeNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reviewAvg")
	public String reviewAvg(Integer perfumeNo) {
		try {
			
			double reviewAvg = 0;
			
			// 해당 향수에 달린 리뷰 List
			List<Review> rList = pService.reviewListByPerfumeNo(perfumeNo);
			if (!rList.isEmpty()) {
				
				// 해당 향수에 달린 리뷰 Score 평균
				double sum = 0;
				for (Review review : rList) {
					sum += review.getrViewscore();
				}
				reviewAvg = sum / rList.size();
			}
			return reviewAvg + "";
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 에러 발생
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
	 * 디테일 - 재입고 알림 신청 by memberNo, perfumeNo
	 * @param rAlert
	 * @return
	 */
	@ResponseBody
	@PostMapping("/restockAlert")
	public int restockAlert(@ModelAttribute ShopAlert rAlert) {
		try {
			int result = pService.insertRestockAlert(rAlert);
			return result;
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
	
	
	// 알림창 테스트 페이지 - 추후 헤더 알림창으로 이식!!
	@GetMapping("/alertTest")
	public ModelAndView alertTest(ModelAndView mv
			, HttpSession session) {
		
		try {
			
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				
				/*
				 * 알림창 가져오는 조건
				 * MEMBER_NO = #{memberNo }
				 * ALERT_DATE IS NOT NULL
				 * 
				 * 왜 ALERT_DATE IS NOT NULL??
				 * ALERT_DATE가 NULL인 거는 재입고가 안돼서 대기중인 재입고알림뿐임
				 * 재입고가 되면 ALERT_DATE 컬럼이 NULL이 아닌 재입고 TIMESTAMP가 입력됨!
				 * 
				 */
				
				/*
				 * 알림창 - 안 읽은 알림만 노출해야 하므로 A_CLICK_STATUS = 0
				 * 마이페이지 - 읽음 여부 상관X, BUT 0과 1 구분해서 읽음 안읽음 확인할 수 있도록 해야함
				 * 
				 */
				
				/*
				 * 재입고알림?
				 * 
				 * 만약 ALTER_TBL의 ALERT_CATEGORY 값이 '재입고'라면
				 * 
				 * PERFUME_TBL의 PERFUME_NO 컬럼과 조인해서
				 * PERFUME_BRAND, PERFUME_NAME 컬럼을 가져옴
				 * 
				 * --> [${perfumeBrand}] ${perfumeName}이(가) 재입고되었습니다.
				 * 
				 */

				/*
				 * 좋아요? 
				 * 
				 * 만약 ALTER_TBL의 ALERT_CATEGORY 값이 '좋아요'라면
				 * 
				 *  1) REVIEW_TBL의 REVIEW_NO 컬럼과 조인해서
				 *  REVIEW_CONTENTS 컬럼을 가져옴
				 *  
				 *  2) PERFUME_NO를 MEMBER_TBL의 MEMBER_NO와 조인해서
				 *  MEMBER_TBL의 MEMBER_NICKNAME을 LIKE_MEMBER_NICKNAME으로 가져옴
				 *  
				 *  주의! 좋아요는 PERFUME_NO 컬럼에 좋아요를 누른 회원의 MEMBER_NO를 입력받음!
				 *  >> TRIGGER가 작동해 ALERT가 입력될 당시에 알림 받을 회원이 아닌
				 * 	   좋아요를 누른 회원의 MEMBER_NO를 입력받지 않는 경우
				 *     나중에 그 당시에 누른 회원이 누구인지 찾을 방법이 없음
				 *     테이블 수정하면 트리거 다 수정해야돼서 그냥 NULL인 PERFUME_NO칸 활용하자.. 
				 *    
				 *  
				 *  --> ${reviewContents}에 ${likeMemberNickname}님이 좋아요를 눌렀습니다.	
				 * 
				 */

				/*
				 * 댓글?
				 * 
				 * 만약 ALTER_TBL의 ALERT_CATEGORY 값이 '댓글'이라면
				 * 
				 * REVIEW_TBL의 REVIEW_NO 컬럼과 조인해서
				 * REVIEW_CONTENTS 컬럼을 가져옴
				 * 
				 * --> ${reviewContents}에 댓글이 달렸습니다.
				 * 
				 */

				/*
				 * 답댓글?
				 * 
				 * 만약 ALTER_TBL의 ALERT_CATEGORY 값이 '답댓글'이라면
				 * 
				 * COMMENT_TBL의 P_COMMENT_NO 컬럼과 조인해서
				 * COMMENT_TBL의 COMMENT_CONTENT 컬럼을 P_COMMENT_CONTENT로 가져옴
				 * 
				 * --> ${pCommentContent}에 답댓글이 달렸습니다.
				 * 
				 */

				int unclickAlertCnt = pService.selectUnclickAlertCnt(member.getMemberNo());
				List<ShopAlert> unclickAlerttList = pService.selectUnclickAlert(member.getMemberNo());
				
				mv
				.addObject("aCnt", unclickAlertCnt)
				.addObject("aList", unclickAlerttList);
				
			} 
			
//			else {
//				Alert alert = new Alert("/member/login", "로그인이 필요한 서비스입니다.");
//				mv.addObject("alert", alert).setViewName("common/alert");
//			}
			
			
			
			
			
			mv.setViewName("perfumeShop/alertTest");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	/**
	 * 알림 클릭 시 읽음 처리 by alertNo
	 * @param alertNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/clickAlert")
	public int clickAlert(Integer alertNo) {
		try {
			System.out.println("dddddd");
			System.out.println(alertNo);
			int result = pService.clickAlert(alertNo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
	/**
	 * 안 읽은 알림 개수 by memberNo
	 * @param memberNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getAlertCnt")
	public int getAlertCnt(Integer memberNo) {
		try {
			int alertCnt = pService.selectUnclickAlertCnt(memberNo);
			return alertCnt;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
	/**
	 * 안 읽은 알림 List by memberNo
	 * @param memberNo
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/getAlertList", produces = "application/json;charset=utf-8" )
	public String getAlertList(Integer memberNo) {
		try {
			List<ShopAlert> aList = pService.selectUnclickAlert(memberNo);
			
			for (ShopAlert alert : aList) {
				if (alert.getReviewContents() != null) {
					String outputString = alert.getReviewContents().replaceAll("<[^>]*>", "");
					alert.setReviewContents(outputString);
				}
				if (alert.getpCommentContent() != null) {
					String outputString = alert.getpCommentContent().replaceAll("<[^>]*>", "");
					alert.setpCommentContent(outputString);
				}
			}
			
			return new Gson().toJson(aList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

}
