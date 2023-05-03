package com.kh.perfumePalette.order;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.cart.Cart;
import com.kh.perfumePalette.member.Member;
import com.kh.perfumePalette.member.MemberService;
import com.kh.perfumePalette.order.domain.AllOrderInfo;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	private IamportClient client;
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private MemberService mService;
	
	
	
	
	/**
	 * 결제API - 기본생성자에서 토큰 발급
	 */
	public OrderController() {
		this.client = new IamportClient("4277187304487763", "lNYZWFOP2ClwCRWgcbvA87zCMWStJQn4ChyXvL0M4aojX3h8OayURuVM46qC9tQy2zvi7RDYF4v5sxFf");
	}
	
	
	/**
	 * 결제API - imp_uid(paymentNo)를 통한 결제 정보 조회
	 * @param imp_uid
	 * @return
	 * @throws IamportResponseException
	 * @throws IOException
	 */
	private IamportResponse<Payment> getPaymentInfo(
			String imp_uid) throws IamportResponseException, IOException {
		
		IamportResponse<Payment> paymentInfo = client.paymentByImpUid(imp_uid);
		return paymentInfo;
	}
	

	/**
	 * 결제API - 결제 검증
	 * @param model
	 * @param locale
	 * @param session
	 * @param imp_uid
	 * @return
	 * @throws IamportResponseException
	 * @throws IOException
	 */
	@ResponseBody
	@PostMapping("/verifyiamport/{imp_uid}")			
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable String imp_uid) throws IamportResponseException, IOException {	
			
			return getPaymentInfo(imp_uid);
	}
	
	
	/*
	 * 결제API - 결제 취소
	 */
	@ResponseBody
	@PostMapping("/cancelPay")
	public String cancelPay(Model model
			, Locale locale
			, HttpSession session
			, @ModelAttribute OrderPayment oPayment) throws IamportResponseException, IOException {
		try {
			
			// oPayment가 갖고 있는 정보 : orderNo, paymentNo, cancelAmount(환불된X, 환불요청O)
			
			// CancelData 객체 생성
			CancelData cancelData = null;
			
			// 환불 가능 금액 = 일단은 환불 요청 전액
			int cancelAbleAmount = oPayment.getCancelAmount();
			
			if (oPayment.getOrderNo() == null || oPayment.getOrderNo().equals("")) {
				// 결제 실패로 인한 즉시 취소 요청 시
				// oPayment의 orderNo = null임 -> cancelData 객체를 paymentNo로 바로 만듦
				cancelData = new CancelData(oPayment.getPaymentNo(), true);				
			} else {
				// 일반적인 결제 취소 요청 시
				// oPayment의 paymentNo = null임 -> orderNo로 paymentInfo 조회 후
				// paymentInfo에서 찾은 paymentNo로 cancelData 객체를 만듦
				OrderPayment paymentInfo = oService.selectPaymentInfo(oPayment.getOrderNo());
				cancelData = new CancelData(paymentInfo.getPaymentNo(), true);
				
				// 환불 가능 금액을 요청 전액에서
				// 총 결제 금액 - 지금까지 환불된 금액
				// 으로 바꿔줌
				cancelAbleAmount = paymentInfo.getPaymentAmount() - paymentInfo.getCancelAmount();				
			}

			
			if (cancelAbleAmount <= 0) {
				// 이미 전액 환불됨 처리
				return "이미 환불처리된 결제건입니다.";
			} else {
				
				// CancelData 객체에 환불 요청 금액 저장
				cancelData.setChecksum(new BigDecimal(oPayment.getCancelAmount()));		
				
				// 환불 요청
				client.cancelPaymentByImpUid(cancelData);
				
				// DB업데이트 로직 추가
				return "1";
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}


	/**
	 * 결제API - 결제 상태 업데이트 by orderNo
	 * @param orderNo
	 * @return
	 * @throws IamportResponseException
	 * @throws IOException
	 */
	@ResponseBody
	@PostMapping("/updatePayment/{orderNo}")
	public String updatePaymentInfo(
			@PathVariable String orderNo) throws IamportResponseException, IOException {
		
		try {
			
			OrderPayment pInfo = oService.selectPaymentInfo(orderNo);
			String paymentNo = pInfo.getPaymentNo();
			
			System.out.println("현재 상태 : " + getPaymentInfo(paymentNo).getResponse().getStatus());
			pInfo.setPaymentStatus(getPaymentInfo(paymentNo).getResponse().getStatus());
			
			int result = oService.updatePaymentInfo(pInfo);
			return result + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}

	
	/**
	 * 구매하기클릭 - 주문서 페이지 출력 (카트, 구매자, 총 가격 전송)
	 * @param mv
	 * @param session
	 * @param cart
	 * @param cartNoArr
	 * @param totalPrice
	 * @return
	 */
	@RequestMapping(value = "/orderSheet", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView orderView(ModelAndView mv
			, HttpSession session
			, @ModelAttribute Cart cart
			, int[] cartNoArr
			, Integer totalPrice) {
		
		List<Cart> cList = new ArrayList<Cart>();
		
		if(cart.getPerfumeNo() != 0) {		
			// detail에서 주문하기로 넘어갔다면
			// cart에 들은 정보  : 
			// cartQuantity(구매수량), perfumeNo, perfumePrice, perfumeName,pFilerename
			// 나중에 카트에 추가해서 주문 진행하는 방식으로 바꾸기...
			cList.add(cart);
			totalPrice = cart.getPerfumePrice()*cart.getCartQuantity();
		} else {	
			// 장바구니에서 주문하기로 넘어갔다면	
			for(int cartNo : cartNoArr) {
				cart = oService.selectByCartNo(cartNo);
				cList.add(cart);
			}
		}
		
		Member orderer = mService.selectMemberById(((Member)session.getAttribute("member")).getMemberId());
		
		mv.addObject("cList", cList)
		.addObject("orderer", orderer)
		.addObject("totalPrice", totalPrice)
		.setViewName("perfumeShop/order");
		return mv;
	}
	
	
	/**
	 * 주문 처리 결과 페이지 출력 (가상계좌 결제 시 가상계좌 관련 정보 전송)
	 * @param mv
	 * @param orderNo
	 * @return
	 */
	@GetMapping("/orderResult/{orderNo}")
	public ModelAndView orderResultView(ModelAndView mv
			, @PathVariable String orderNo) {
		
		try {
			OrderPayment oPayment = oService.selectPaymentInfo(orderNo);
			
			if(oPayment.getPaymentMethod().equals("vbank")) {
				// 입금 기한을 59분 59초로 출력해주기 위함!
				Timestamp vbDate = new Timestamp(oPayment.getVbankDate().getTime() - 1000L);
				oPayment.setVbankDate(vbDate);				
			}

			mv.addObject("oPayment", oPayment).setViewName("perfumeShop/orderResult");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	/**
	 * 결제 성공 시 DB저장
	 * @param data
	 * @return
	 */
	@ResponseBody
	@PostMapping("/paySuccess")
	public int paySuccess(@RequestBody Map<String, Object> data) {
		
		ObjectMapper mapper = new ObjectMapper();

		Order order 				= mapper.convertValue(data.get("order"), Order.class);
		List<OrderDetail> oDetails 	= mapper.convertValue(data.get("oDetails"), new TypeReference<List<OrderDetail>>() {});
		OrderPayment oPayment 		= mapper.convertValue(data.get("oPayment"), OrderPayment.class);
		
		// 뭘 넣어도 milis를 date로 바꿔줌!
		order.setOrderDate(null);
		oPayment.setPaymentDate(null);
		oPayment.setVbankDate(null);

		try {
			
			// service에서 트랜잭션 처리해주기!
			int result = oService.paySuccess(order, oDetails, oPayment);
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}	
	
	
	/**
	 * 로그인한 회원 주문 내역 조회 by memberNo
	 * @param mv
	 * @param session
	 * @return
	 */
	@GetMapping("/orderList")
	public ModelAndView orderListView(ModelAndView mv
			, HttpSession session) {
		
		try {
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				
				// MemberController 수정 안 하고 OrderController에서 작업하기 위함!
				int memberNo = ((Member) session.getAttribute("member")).getMemberNo();
				
				// memberNo로 ORDER, ORDER_DETAIL, ORDER_PAYMENT, PERFUME 다 조인한 결과 가져오기
				List<AllOrderInfo> allList = oService.selectAllOrderInfo(memberNo);
				
				mv
				.addObject("checkStatus", memberNo)
				.addObject("orderList", allList)
				.setViewName("member/orderList");
				
			} else {
				Alert alert = new Alert("/member/login", "로그인이 필요한 서비스입니다.");
				mv.addObject("alert", alert).setViewName("common/alert");
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
}
