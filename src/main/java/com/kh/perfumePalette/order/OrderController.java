package com.kh.perfumePalette.order;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.perfumePalette.order.domain.Order;
import com.kh.perfumePalette.order.domain.OrderDetail;
import com.kh.perfumePalette.order.domain.OrderPayment;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	private IamportClient client;
	
	public OrderController() {
		// 토큰 발급
		this.client = new IamportClient("4277187304487763", "lNYZWFOP2ClwCRWgcbvA87zCMWStJQn4ChyXvL0M4aojX3h8OayURuVM46qC9tQy2zvi7RDYF4v5sxFf");
	}
	
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verifyiamport/{imp_uid}")			
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable String imp_uid) throws IamportResponseException, IOException{	
			
			return client.paymentByImpUid(imp_uid);
	}
	
	// 결제 성공하면 DB저장
	@ResponseBody
	@PostMapping("/paySuccess")
	public int paySuccess(@RequestBody Map<String, Object> data) {
		
		ObjectMapper mapper = new ObjectMapper();

		Order order 				= mapper.convertValue(data.get("order"), Order.class);
		List<OrderDetail> oDetails 	= mapper.convertValue(data.get("oDetails"), new TypeReference<List<OrderDetail>>() {});
		OrderPayment oPayment 		= mapper.convertValue(data.get("oPayment"), OrderPayment.class);
		order.setOrderDate(order.getOrderDateMilis());
		oPayment.setPaymentDate(oPayment.getPaymentDateMilis());

		try {
			
			// service에서 트랜잭션 처리해주기!
			int result = oService.paySuccess(order, oDetails, oPayment);
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}


	}	
	
	
	// 주문서
	@PostMapping("/orderSheet")
	public ModelAndView orderView(ModelAndView mv
			, Integer memberNo
			, Integer perfumeNo
			, Integer orderQuantity) {
		mv
		.addObject("memberNo", memberNo)
		.addObject("perfumeNo", perfumeNo)
		.addObject("orderQuantity", orderQuantity)
		.setViewName("perfumeShop/order");
		
		return mv;
	}


}
