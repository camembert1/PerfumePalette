<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

	<link rel="stylesheet" href="../../../resources/perfumeShopCss/detail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

	<!-- favicon : 탭에 보이는 아이콘 -->
	<link rel="icon" href="../../resources/img/common/favicon.png" />
	<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />

	<!-- 포트원 결제 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<!-- 카카오 SDK(Software Development Kit) -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<!-- 폰트어섬 아이콘 -->
	<script src="https://kit.fontawesome.com/092e4e45af.js" crossorigin="anonymous"></script>

	
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
	<!-- 헤더 부분 피하기 위한 div -->
	<div id="forHeader"></div>

	<!-- 본문 내용 가운데 정렬 위한 div -->
	<div id="forCenter">
		
		<!-- 여기부터 내용 입력하시면 됩니다! -->
		
		<section id="section-main">
			<section id="section-top">
				
				<div id="img-area">
					<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
				</div>

				<div id="info-area">
					<div id="for-marign">

						
						<div id="nameAndshare-area">

							<div>
								<div id="perfumeBrand-txt">
									${perfume.perfumeBrand }
								</div>
	
								<div id="perfumeName-txt">
									${perfume.perfumeName }
								</div>
							</div>

							<div>
								<div id="sns-share-btn" title="공유하기">
									<img src="../../../resources/img/common/sharing.png" alt="">
								</div>
								<div id="share-box">

									<div id="ktf-btn">
										<div class="share" id="kakao">
											<img src="../../../resources/img/common/detail-kakao.png" alt="">
										</div>
										<div class="share" id="twitter">
											<img src="../../../resources/img/common/detail-twitter.png" alt="">
										</div>
										<div class="share" id="facebook">
											<img src="../../../resources/img/common/detail-facebook.png" alt="">
										</div>
									</div>

									<div id="url-and-btn">
										<input type="text" id="url-area" readonly>
										<div class="share" id="copy">
											<img src="../../../resources/img/common/duplication.png" alt="">
										</div>
									</div>

								</div>
							</div>

						</div>
	
						<div id="reviewScore-txt">
							<div id="stars">
								<img src="../../../resources/img/common/star-0.png" alt="">
								<img src="../../../resources/img/common/star-0.png" alt="">
								<img src="../../../resources/img/common/star-0.png" alt="">
								<img src="../../../resources/img/common/star-0.png" alt="">
								<img src="../../../resources/img/common/star-0.png" alt="">
							</div>
							(${reviewCnt })
						</div>
	
						<c:choose>
							<c:when test="${perfume.perfumeQuantity > 0 and perfume.perfumeQuantity <=5}">
								<div id="perfumeQuantity-txt">품절임박 | 잔여 ${perfume.perfumeQuantity }개</div>
							</c:when>
							<c:when test="${perfume.perfumeQuantity == 0}">
								<div id="perfumeQuantity-txt">품절</div>
							</c:when>
							<c:otherwise>
								<!-- <div>재고 : ${perfume.perfumeQuantity }</div> -->
							</c:otherwise>
						</c:choose>

						<div id="perfumePrice-txt">
							<fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,##0"/>원
						</div>
						
						<div id="perfumeVol-area">
							<div data-perfumeVol="50">50ml</div>
							<div data-perfumeVol="75">75ml</div>
							<div data-perfumeVol="100">100ml</div>
						</div>

						<div id="btn-area">

							<div id="wish-btn" onclick="wish()">
								<input type="hidden" id="wishStatus" value="${wishStatus}">
								<c:if test="${wishStatus == 1}">
									<img id="wishIcon" src="../../../resources/img/common/wish-1.png" alt="">
								</c:if>
								<c:if test="${wishStatus == 0}">
									<img id="wishIcon" src="../../../resources/img/common/wish-0-0.png" alt="">
								</c:if>
								<div id="wishCnt">0</div>
							</div>

							<div id="cart-btn" onclick="cart()">
								<div>장바구니</div>
							</div>
					
							<c:choose>
								<c:when test="${perfume.perfumeQuantity > 0}">
									<div id="buy-btn" onclick="buy()">
										<div>바로 구매하기</div>
									</div>
								</c:when>
								<c:otherwise>
									<div id="restock-btn" onclick="restockAlert()">
										<input type="hidden" id="rAlertStatus" value="${rAlertStatus}">
										<div>재입고 알림</div>
									</div>
								</c:otherwise>
							</c:choose>		
							

						</div>




					</div>
				</div>

			</section>




			<section id="section-bot">
				<div id="tab-area">
					<div class="tab" id="detail-tab">상품상세</div>
					<div class="tab" id="review-tab">상품후기(${reviewCnt })</div>
					<div class="tab" id="qna-tab">상품문의(${qnaCnt })</div>
					<div class="tab" id="deliveryInfo-tab">배송/교환/반품 안내</div>
				</div>
				<div id="tab-contents-box">

					<div class="tab-contents" id="detail-box">
						<div>
							<div id="contentsBox-img-area">
								<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
							</div>
							<h3>상품 정보 고시</h3>
							<div class="line"></div>
							<div> 
								품명 : ${perfume.perfumeName } <br>
								전성분 : 에탄올, 향료, 정제수, 리모넨, 하이드록시시트로넬알, 에칠헥실메톡시산나메이트, 시트로넬올, <br>
								헥실신남알, 리날룰, 에칠헥실살리실레이트, 비에이치티, 부틸메톡시디벤조일메탄, 참나무이끼추출물, <br>
								제라니올, 시트랄, 파네솔, 벤질벤조에이트 <br>
								* 제공된 성분은 동일 제품이라도 경우에 따라 변경될 수 있습니다. <br>
								* 최신정보는 제품 포장의 성분을 참고하시기 바랍니다. <br>
								
								<br>

								용량 : ${perfume.perfumeVolume }ml <br>
								제품 주요 사항 : 모든 피부 타입 <br>
								사용방법 : 맥박이 뛰는 부위에 분사하여 사용합니다. <br>
								사용기한 : 개봉 후 3년 <br>
								제조자 : ${perfume.perfumeBrand } <br>
								제조국 :프랑스 <br>

								<br>
								
								사용할 때의 주의사항 : <br>
								1. 화장품 사용 시 또는 사용 후 직사광선에 의하여 사용부위가 붉은 반점, <br>
								부어오름 또는 가려움증 등의 이상 증상이나 부작용이 있는 경우 <br>
								전문의 등과 상담할 것 <br>
								2. 상처가 있는 부위 등에는 사용을 자제할 것 <br>
								3. 보관 및 취급 시의 주의사항 <br>
								1) 어린이의 손이 닿지 않는 곳에 보관할 것 <br>
								2) 직사광선을 피해서 보관할 것 <br>
								4. 눈에 들어가지 않도록 주의하고 눈에 들어간 때에는 즉시 씻어 낼 것 <br>
								5.민감성 피부 보유자는 귓볼 등에 사전 패치 테스트 후 사용할 것 <br>
								품질보증기준 : 본 제품에 이상이 있을 경우, <br>
								공정거래위원회 고시 소비자분쟁해결기준에 의해 보상해 드립니다. <br>
								
								<br>

								화장품책임판매업자 : 주식회사 Perfume Palette / 서울시 중구 남대문로120 3층 Perfume Palette <br>
								고객센터 :070-7424-1253
							</div>

							<br><br><br><br><br>
							<h3>상품 결제 정보</h3>
							<div class="line"></div>
							<div>
								- 고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. <br>
								- 확인과정에서 도난 카드의 사용이나 타인 명의의 주문 등 정상적인 주문이 아니라고 판단될 경우 <br>
								임의로 주문을 보류 또는 취소할 수 있습니다. <br>
								- 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. <br>
									
								※ 주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, <br>
								3일이내로 입금되지 않은 주문은 자동취소 됩니다. <br>
							</div>

						</div>
					</div>

					<div class="tab-contents" id="review-box">

						<c:if test="${reviewCnt eq 0}">
							<div>등록된 후기가 아직 없습니다.</div>
						</c:if>

						<c:if test="${reviewCnt ne 0}">

							<div id="scoreAvg-area">
								<img src="../../../resources/img/common/star-1.png" alt="">
								<fmt:formatNumber value="${scoreAvg }" pattern="#.#" />
							</div>

							<table>
								<tr>
									<th>번호</th>
									<th>별점</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach items="${rList}" var="review" varStatus="i">
									<tr onclick="location.href='/review/reviewDetail/${review.reviewNo }'">
	
										<td>${i.count }</td>

										<td>
											<div class="review-stars" data-score="${review.rViewscore }">
												<img src="../../../resources/img/common/star-0.png" alt="">
												<img src="../../../resources/img/common/star-0.png" alt="">
												<img src="../../../resources/img/common/star-0.png" alt="">
												<img src="../../../resources/img/common/star-0.png" alt="">
												<img src="../../../resources/img/common/star-0.png" alt="">
											</div>
											<!-- ${review.rViewscore} -->
										</td>
	
										<td>
											<c:if test="${fn:length(review.reviewContents) > 30}">
												${fn:substring(review.reviewContents, 0, 30)}...
											</c:if>
											<c:if test="${fn:length(review.reviewContents) <= 30}">
												${review.reviewContents }
											</c:if>
										</td>
	
										<td>${review.memberNickname }</td>
	
										<td>
											${fn:substring(review.reviewDate, 0, 10)}
										</td>
	
										<td>${review.rViewcount }</td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>

					<div class="tab-contents" id="qna-box">
						<c:if test="${qnaCnt eq 0}">
							<div>등록된 문의가 아직 없습니다.</div>
						</c:if>
						
						<c:if test="${qnaCnt ne 0}">
						
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>답변여부</th>
										<th>구분</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${qnaList }" var="qna" varStatus="status">
										<fmt:formatDate var="qnaDate" value="${qna.qnaDate }" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="repDate" value="${qna.repDate }" pattern="yyyy-MM-dd" />
										<tr>
											<td>${status.count }</td>
											<td><c:if test="${qna.replyContents ne null}">답변완료</c:if> <c:if test="${qna.replyContents eq null}">답변대기</c:if></td>
											<td><c:if test="${qna.qnaType == 1 }">상품문의</c:if> <c:if test="${qna.qnaType == 2 }">배송문의</c:if> <c:if test="${qna.qnaType == 3 }">교환/환불</c:if> <c:if test="${qna.qnaType == 4 }">기타문의</c:if></td>
											<c:choose>
												<c:when test="${not empty qna.qnaPassword and member.memberNo != '2'}">
													<td onclick='lock(this)'>${qna.qnaSubject}<i class="fa-solid fa-key" style="color: #ffd43b; margin-left: 5px;"></i></td>
												</c:when>
												<c:otherwise>
													<td><a onclick="location.href='/qnaboard/qnaDetail/${qna.qnaNo}'">${qna.qnaSubject}</a></td>
												</c:otherwise>
											</c:choose>
											<td>${qna.memberNickname }</td>
											<td>${qnaDate }</td>
										</tr>
										<c:choose>
											<c:when test="${not empty qna.qnaPassword}">
												<tr style="display: none;" class="hiddenTr">
													<td colspan="6">
														<form onsubmit="validatePassword(event, ${status.count })">
														  <div class="hidden-password">
														    비밀번호 : <input type="password" name="qnaPassword" id="qnaPassword${status.count }" class="hidden" placeholder="숫자만 입력가능합니다." oninput="chkPw(${status.count })"> <input type="hidden" name="qnaNo" id="qnaNo${status.count }" value="${qna.qnaNo}">
														    <button type="submit" class="pwChk">확인</button>
														  </div>
														</form>
													</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<button type="button" id="qnaSubBtn"onclick="location.href = '/qnaboard/write/${perfume.perfumeNo }'">문의작성</button>
					</div>
					
					
					<div class="tab-contents" id="deliveryInfo-box">

						<h3>배송 정보</h3>
						<div class="line"></div>
						<div>
							배송 방법 : CJ대한통운 <br>
							배송 지역 : 전국지역 <br>
							배송 비용 : 무료 <br>
							배송 기간 : 2일 ~ 5일 <br>
							배송 안내 : <br>
							- 향수만 구매하시거나 선물포장 옵션 선택 시 쇼핑백은 제공되지 않습니다. <br>
							　※ 쇼핑백은 "추가구성상품" 내에서 별도로 구매가 필요합니다 ※ <br>
							- 주말 동안의 주문량이 많을 경우, 월요일 오후 2시 이전 주문건은 다음날 출고될 수 있습니다. <br>
							- 당일발송 재고가 소진되었을 경우 출고가 지연될 수 있습니다. <br>
							- 모든 국내 배송 상품은 'CJ대한통운' 통해 출고되며, 타 택배사 이용시 고객 부담의 별도 비용이 발생될 수 있습니다. <br>
							- 도서산간 지역은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다. <br>
							고객님께서 주문하신 상품은 입금 확인후 배송해 드리며, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다. <br>
						</div>

						<br><br><br><br><br>
						<h3>교환 및 반품 정보</h3>
						<div class="line"></div>
						<div>
							※교환 및 반품 전 필수 참고사항※ <br>
							- 새상품의 향기 이상, 지속력 등의 주관적인 사유는 제품 불량에 해당하지 않습니다. <br>
							- 향수는 알코올 80%로 구성되어 있으며, 여러 향료와 성분을 배합하고 섞어 제조 됩니다. <br>

							<br>

							배송 중 흔들림이 강하게 지속적으로 이뤄질 경우 향수의 배합이 깨져 처음 사용 시 알코올 성분이 가장 분사 되면서 <br>
							시린 향으로 인해 향기에 이상을 느끼거나 지속력이 짧게 느껴지기도 합니다.  <br>

							<br>

							이는 정상적인 반응으로 시간이 지날수록 향수의 안정화가 진행되면서 점차 본연의 향기를 되찾아가고, <br>
							분사할수록 향료의 비중이 높아지면서 사용할수록 더욱 진하고 풍부한 향기를 느낄 수 있습니다. <br>
							
							<br>

							※교환 및 반품이 가능한 경우※ <br>
							- 상품 배송 완료일 기준으로 14일 이내 <br>
							(단, 향수 제품 특성상 포장을 개봉하였거나, 제품 사용 시 교환/반품 불가) <br>
							- 상품의 파손, 불량, 오배송의 사유 <br>
							(*본품 박스 파손 등의 불량의 경우, 제품 개봉 시 교환/반품 불가) <br>
							- 공급 받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3개월 이내, <br>
							그 사실을 알게 된 날로부터 30일 이내 <br>
							
							<br>
							
							※교환 및 반품이 불가능한 경우※ <br>
							
							- 향수 제품 특성상 포장을 개봉하였거나, 제품을 사용(분사) 및 훼손하여 상품가치가 상실된 경우 교환/반품이 불가능합니다. <br>
							(검수 후 상품 가치가 상실되어 처리가 불가 할 경우 고객님 부담의 추가 반송비가 발생됩니다.) <br>
							- 향수 본품 개봉 및 사용에 의하여 상품의 가치가 현저히 감소한 경우 교환/반품이 불가능합니다. <br>
							(본품 박스 파손 등의 불량의 경우, 개봉 및 분사 시 사용으로 간주되어 처리 불가 합니다.) <br>
							- 시간의 경과에 의하여 재 판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 교환/반품이 불가능합니다. <br>
							
							<br>
							
							※ 배송중 처리된 주문건의 경우, 오후 4시 이후에는 이미 출고 대기중으로 반품배송비가 발생될 수 있습니다. <br>
							※ 고객님의 단순 변심으로 교환/반품을 하실 경우, 상품반송 비용은 고객님 부담으로 처리됩니다. <br>
							　*도서산간 지역은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다* <br>
							※ 고객님께서 직접 반송하실 경우, 택배비는 선불로 지불하셔야 하며 초기배송비용 2,500원이 부과됩니다. <br>
							(*국내 무료배송 상품에 한하며, 교환시에는 5,500원 부과됩니다.) <br>

							<br>

							- 제품 구매 시 무료배송을 받으신 경우 : 5,500원 <br>
							- 제품 구매 시 배송비 2,500원을 결제한 경우 : 3,000원 ( 교환시 5,500원 ) <br>
							- 해외배송상품 : 15,000원 (항공운임료 등 포함) <br>
							
							<br>
							
							더 자세한 내용은 고객센터 Q&A 게시판 내 공지통해 확인 가능합니다.
						</div>
					</div>
				</div>

			</section>



		</section>
		


		


		

		


		
		
		



		<!-- 모달창 -->
		<div id="modal-bg"></div>
		<div id="modal">
			<div id="explain">
				<div id="name">
					<span id="perfumeBrand">[${perfume.perfumeBrand }]</span> <span id="perfumeName">[${perfume.perfumeName }]</span>
					<input type="hidden" id="perfumeNo" value="${perfume.perfumeNo }">
				</div>
				<div id="other-name">
					<div>
						<span id="perfumePrice">[가격]</span>
					</div>
					<div id="updown">
						<input type="number" id="perfumeQuantity" value="1" min="1" max="100" size="1">
						<span style="margin: 0 5px;"><i class="fas fa-lg fa-arrow-alt-circle-up up"></i></span> <span><i class="fas fa-lg fa-arrow-alt-circle-down down"></i></span>
					</div>
				</div>
			</div>
			<div id="money">
				<p>합계</p>
				<div>
					<span id="perfumeTotalPrice">[합계금액]</span>
				</div>
			</div>
			<div id="btn-box">
				<button type="button" onclick="modalClose()">
					<span>취소</span>
				</button>
			</div>
		</div>

		<form action="/order/orderSheet" method="post" id="orderForm">
			<input type="hidden" name="perfumeNo" value="${perfume.perfumeNo }">
			<input type="hidden" name="perfumePrice" value="${perfume.perfumePrice }">
			<input type="hidden" name="perfumeName" value="${perfume.perfumeName }">
			<input type="hidden" name="pFilerename" value="${perfume.pFilerename }">
			<input type="hidden" name="cartQuantity" value="">
		</form>


	</div>
	</main>
	<jsp:include page="../common/footer.jsp" />

	


	<script>
		// 현재 링크
		const url = encodeURI(window.location.href);

		// 별점 평균만큼 별 칠하기
		$('#stars img:lt(' + Math.round('${scoreAvg}') + ')').attr('src', '../../../resources/img/common/star-1.png');

		// 상품 후기 영역에서 각자 후기 별점 칠하기
		$('.review-stars').each(function(index, element) {
			$(element).find('img').each(function(i, img) {
				if (i < $(element).data('score')) {
					$(img).attr('src', '../../../resources/img/common/star-1.png');
				}
			});
		});

		// wish 개수
		updateWishCnt = function() {
			$.ajax({
				url: '/perfume/wishCnt',
				type: 'POST',
				data: {
					"perfumeNo": '${perfume.perfumeNo }'
				},
				success: function(wishCnt) {
					$('#wishCnt').html(wishCnt);
				},
				error: function(result) {
					alert(result);
				}
			});
		}
		// 페이지 열리자마자 업데이트
		updateWishCnt();


		// 선택한 탭 효과 + 박스 노출
		$('.tab').each(function(index, element) {
			$(element).click(function() {
				selected(index);
			});
		});
		// n번째 탭, 박스 효과 적용 함수
		selected = function(index) {
			//  탭 클릭 시 탭 관련 css 적용
			$('.tab').removeClass('selectedTab');
			$('.tab').eq(index).addClass('selectedTab').css({ opacity: 0 }).animate({ opacity: 1 }, 200);
			
			// 탭 contents 관련 css 적용
			$('.tab-contents').removeClass('selectedBox');
			$('.tab-contents').eq(index).addClass('selectedBox').css({ opacity: 0 }).animate({ opacity: 1 }, 200);
		}
		// 페이지 시작시 무조건 0번째 = 상품상세 노출
		selected(0);


		// sns 공유 버튼 - 공유 box 생겼다 사라졌다
		$('#sns-share-btn').click(function() {
			if ($('#share-box').css('display') === 'none') {
				$('#share-box').fadeIn(100);
			} else {
				$('#share-box').fadeOut(100);
			}
		});
		// 현재 링크 sns공유 박스에 띄워주기
		$('#url-area').val(url);

		// 해당 용량 박스만 css주기 위함
		$('#perfumeVol-area').find('div').each(function(index, element) {
			if ('${perfume.perfumeVolume }' == $(element).data('perfumevol')) {
				$(element).addClass('real-vol')
			}
		});

		alertModal = function(msg) {
			// css작업할 때 modal뜨는 걸로 수정하기!
			alert(msg);
		}

		// 재입고 알림 버튼
		restockAlert = function() {

			let perfumeNo = '${perfume.perfumeNo}';
			let memberNo = '${sessionScope.member.memberNo }';

			if (memberNo == '') {
				alert('로그인부터 하시길!')
			} else {
				if ($('#rAlertStatus').val() == 1) {
					alertModal('이미 재입고 알림을 신청하셨습니다.');
				} else {
					$.ajax({
						url: '/perfume/restockAlert'
						, type: 'POST'
						, data: {
							'memberNo': memberNo
							, 'perfumeNo': perfumeNo
						}
					}).done(function(result) {
						if (result == 1) {
							$('#rAlertStatus').val(1);
							alertModal('재입고 알림이 신청되었습니다.')
						} else {
							// 재입고 알림 신청 실패
							alert(result);
						}
					});
				}
			}
		}


		

		// 상품 디테일 페이지 링크 복사
		$('#copy').click(function() {
			window.navigator.clipboard.writeText(url).then(() => {
				// 복사가 완료되면 호출된다.
				alertModal('상품 링크가 복사되었습니다.');
			});
		});

		// 공유하기 - 페북, 트위터
		$('#facebook').click(function() {
			// window.open("http://www.facebook.com/sharer/sharer.php?s=100&href='.$short_url.'&u=" + url +"&p=");
			window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
		});
		$('#twitter').click(function() {
			window.open("https://twitter.com/intent/tweet?url=" +  url)
		});

		// 공유하기 - 카카오
		Kakao.init('97a75fe20b070509cbcf578ae7f51492');
		$('#kakao').click(function() {
			Kakao.Link.sendDefault({
				objectType: 'feed',
				content: {
					title: 'Perfume Palette',
					description: '[${perfume.perfumeBrand}] ${perfume.perfumeName}',
					imageUrl: url + '/resources/img/perfumeFileUploads/${perfume.pFilerename}',
					link: {
						webUrl : url,
						mobileWebUrl : url,
					},
				},
				buttons: [
					{
					title: '자세히 보기',
					link: {
						webUrl : url,
						mobileWebUrl : url,
					},
					},
				]
			})
		});

		// 찜버튼
		wish = function() {
			let perfumeNo = '${perfume.perfumeNo}';
			let memberId = '${sessionScope.member.memberId }';
			if (memberId == '') {
				goLogin();
			} else {
				if($('#wishStatus').val() == 0) {
					// 찜을 안 누른 상태라면 찜
					$.ajax({
						url:'/wish/add',
						type: 'POST',
						data:{
							"perfumeNo": perfumeNo,
							"memberId": memberId
						},
						success: function(result) {
							$('#wishIcon').attr('src', '../../../resources/img/common/wish-1.png');
							$('#wishStatus').val(1);
							updateWishCnt();
						},
						error: function(result) {
						}
					});
				} else {
					// 찜을 누른 상태라면 찜 취소
					// 근데 찜 취소가 wishNo를 이용해서 여기서 처리할 수가 없음
					// wishNo 가져오기
					$.ajax({
						url: '/perfume/getWishNo',
						type:'POST',
						data: {
							"perfumeNo": perfumeNo,
							"memberId": memberId
						},
						success: function(wishNo) {
							$.ajax({
								url: '/wish/remove',
								type: 'POST',
								data:{
									"wishNo": wishNo,
								},
								success: function(result) {
									$('#wishIcon').attr('src', '../../../resources/img/common/wish-0-0.png');
									$('#wishStatus').val(0);
									updateWishCnt();
								},
								error: function(result) {
								}
							});
						},
						error: function(result) {
						}
					});
				}
					
			}
		}
		

		// 모달 - 구매하기 (구매 submit버튼)
		order = function() {

			// 장바구니 추가해서 submit하기
			$.ajax({
				url: "/cart/add",
				type: "POST",
				data: {
					memberId: '${member.memberId }',
					cartQuantity: $("#perfumeQuantity").val(),
					perfumeNo: $("#perfumeNo").val(),
				},
				success: function (result) {
					$('[name=cartQuantity]').val($("#perfumeQuantity").val());
					$('#orderForm').submit();
				},
				error: function () {
					alert("서버 처리 실패");
				}
			});	
		}

		// 디테일 - 구매하기 (모달 띄우는 버튼)
		buy = function() {
			if('${member.memberNo }' == '') {
				goLogin();
			} else {
				$('#btn-box').html(
					$('#btn-box').html()
					+ '<button type="button" onclick="order()"><span>구매하기</span></button>'
				);

				let price = parseInt('${perfume.perfumePrice }');
				$("#perfumePrice").html(price.toLocaleString('ko-KR') + '원');

				let quantity = $("#perfumeQuantity").val();
				let totalPrice = price * parseInt(quantity);
				$("#perfumeTotalPrice").html(totalPrice.toLocaleString('ko-KR') + '원');

				// 모달 열기
				$("#modal").css("display", "block");
				$("#modal-bg").css("display", "block");
				$("body").css("overflow", "hidden");
			}
		}

		// 디테일 - 장바구니 (모달 띄우는 버튼)
		cart = function() {
			if('${perfume.perfumeQuantity }' == 0) {
				alert('품절된 상품입니다.');
			} else {
				if('${member.memberNo }' == '') {
					goLogin();
				} else {
					$.ajax({
						url: '/perfume/checkCart'
						, type: 'POST'
						, data: {
							'memberId': '${member.memberId }'
							,'perfumeNo': '${perfume.perfumeNo }'
						}
					}).done(function(result) {
						if(result == 0) {
							$('#btn-box').html(
								$('#btn-box').html()
								+ '<button type="button" onclick="addCartAjax()"><span>장바구니 담기</span></button>'
							);

							let price = parseInt('${perfume.perfumePrice }');
							$("#perfumePrice").html(price.toLocaleString('ko-KR') + '원');

							let quantity = $("#perfumeQuantity").val();
							let totalPrice = price * parseInt(quantity);
							$("#perfumeTotalPrice").html(totalPrice.toLocaleString('ko-KR') + '원');

							// 모달 열기
							$("#modal").css("display", "block");
							$("#modal-bg").css("display", "block");
							$("body").css("overflow", "hidden");
						} else {
							let result = confirm('이미 장바구니에 추가된 상품입니다.\n장바구니로 이동하시겠습니까?');
							if (result) {
								location.href = '/cart/list';
							} 
						}
					});
				}
			}
		}

		



		
		/* 모달창 합계 금액 변경 */
		$(document).on("click", "#updown .up, #updown .down", function () {
			/* 정규식 써서 숫자를 제외한 모든 문자를 제거 */
			var price = parseInt($("#perfumePrice").text().replace(/[^0-9]/g, ""));
			var quantity = parseInt($("#perfumeQuantity").val());
			var totalPrice = price * quantity;
			$("#perfumeTotalPrice").text(totalPrice.toLocaleString('ko-KR') + '원');
		});


		/* 모달창 닫기 */
		function modalClose() {
			$("#modal").css("display", "none");
			$("#modal-bg").css("display", "none");
			$("body").css("overflow", "visible");
			$("#perfumeQuantity").val("1");
			$('#btn-box').html('<button type="button" onclick="modalClose()"><span>취소</span></button>');
		}

		/* 수량 변경 코드 */
		const input = document.getElementById("perfumeQuantity");
		const upBtn = document.querySelector(".up");
		const downBtn = document.querySelector(".down");

		const perfumeQuantity = '${perfume.perfumeQuantity }';
		
		upBtn.addEventListener("click", () => {
			console.log('재고 : ' + perfumeQuantity);
			console.log('구매수량 : ' + input.value);
			if (perfumeQuantity == input.value) {
				alert("해당 재고가 부족합니다.");
			} else {
				input.stepUp();
			}
		});

		downBtn.addEventListener("click", () => {
			input.stepDown();
		});


		// 모달 - 장바구니 (장바구니 add 버튼)
		function addCartAjax() {
			const memberId = '${sessionScope.member.memberId }';
			const cartQuantity = $("#perfumeQuantity").val();
			const perfumeNo = $("#perfumeNo").val();
			$.ajax({
				url: "/cart/add",
				type: "POST",
				data: {
					memberId: memberId,
					cartQuantity: cartQuantity,
					perfumeNo: perfumeNo,
				},
				success: function (result) {
					$("#reload2" + perfumeNo).load(location.href + " #reload2" + perfumeNo);
					modalClose();
					alertModal('장바구니에 추가되었습니다.');
				},
				error: function () {
					alert("서버 처리 실패");
				}
			});
		}

		function goLogin() {
			if (confirm("로그인이 필요한 서비스입니다.")) {
				location.href="/member/login";
			}
		}
		
		/////////////////////////////////////////////////////////////////////////////////
		
		
		/* 문의관련 스크립트 */

        function lock(target) {
            $(target).parent().next(".hiddenTr").toggle();
        }

        // Ajax 요청을 통해 비밀번호 검증 및 페이지 이동 또는 알림창 표시
        function validatePassword(event, status) {
            event.preventDefault();

            let qnaNo = $("#qnaNo" + status).val();
            let password = $("#qnaPassword" + status).val();

            // 비밀번호 검증 Ajax 요청
            $.ajax({
                type: "POST",
                url: "/qnaboard/samepwd",
                data: {
                    "qnaNo": qnaNo,
                    "inputPw": password
                },
                success: function (response) {
                    if (response === "1") {
                        // 비밀번호가 맞을 경우 모달창
                        // return 미지정 -> return true;
                        location.href = "/qnaboard/qnaDetail/"+qnaNo;
                    } else {
                        // return false;
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                }
            });

            // 폼 전송 방지
            return false;
        }
        
     // 비밀글 유효성 검사
     function chkPw(no) {
		  const passwordInput = document.getElementById("qnaPassword"+no);
		  
		    const input = passwordInput.value;
		    const regex = /^[0-9]*$/;
		    
		    if (!regex.test(input)) {
		      alert("숫자만 입력가능합니다.");
		      passwordInput.value = "";
		    }
	}
     

	</script>

</body>

</html>