<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- 부트스트랩인가?? 그 모달창에 버튼 위아래 아이콘인듯! -->
<script src="https://kit.fontawesome.com/972e551b53.js"></script>

<!-- 카카오 SDK(Software Development Kit) -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 자물쇠 이모티콘 -->
<script src="https://kit.fontawesome.com/092e4e45af.js" crossorigin="anonymous"></script>


</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<div id="modal-bg"></div>
		<iframe id="qna-iframe" src="" frameborder="0" style="display: none;"></iframe>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>

		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">

			<!-- 여기부터 내용 입력하시면 됩니다! -->

			<div>
				<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
			</div>

			<div>perfumeBrand : ${perfume.perfumeBrand }</div>
			<div>perfumeName : ${perfume.perfumeName }</div>

			<c:choose>
				<c:when test="${perfume.perfumeQuantity > 0 and perfume.perfumeQuantity <=5}">
					<div>품절임박 | 잔여 ${perfume.perfumeQuantity }개</div>
				</c:when>
				<c:when test="${perfume.perfumeQuantity == 0}">
					<div>품절</div>
				</c:when>
				<c:otherwise>
					<div>재고만아 어어 ${perfume.perfumeQuantity }</div>
				</c:otherwise>
			</c:choose>


			<div>perfumeVolume : ${perfume.perfumeVolume }</div>
			<div>perfumePrice : ${perfume.perfumePrice }</div>

			<div>
				<button class="share" id="copy">링크복사</button>
				<button class="share" id="kakao">카카오톡</button>
				<button class="share" id="twitter">트위터</button>
				<button class="share" id="facebook">페이스북</button>
			</div>


			<div>
				<input type="hidden" id="wishStatus" value="${wishStatus}">
				<button onclick="wish()" id="wishBtn">
					<c:if test="${wishStatus == 1}">
					❤️
				</c:if>
					<c:if test="${wishStatus == 0}">
					🤍
				</c:if>
				</button>
			</div>

			<c:choose>
				<c:when test="${perfume.perfumeQuantity > 0}">
					<div>
						<button onclick="buy()">구매하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<input type="hidden" id="rAlertStatus" value="${rAlertStatus}">
						<button onclick="restockAlert()">재입고알림</button>
					</div>
				</c:otherwise>
			</c:choose>

			<div>
				<button onclick="cart()">장바구니</button>
			</div>

			<div>
				<div>상품상세</div>
				<div>상품후기(${reviewCnt })</div>
				<div>상품문의</div>
				<div>배송/교환/반품 안내</div>
			</div>
			<div>이거는 쿠팡 참고할거 어어 ㅋ</div>



			<!-- 모달창 -->
			<div id="modal-bg"></div>
			<div id="modal">
				<div id="explain">
					<div id="name">
						<span id="perfumeBrand">[${perfume.perfumeBrand }]</span> <span id="perfumeName">[${perfume.perfumeName }]</span> <input type="hidden" id="perfumeNo" value="${perfume.perfumeNo }">
					</div>
					<div id="other-name">
						<div>
							<span id="perfumePrice">[가격]</span>
						</div>
						<div id="updown">
							<input type="number" id="perfumeQuantity" value="1" min="1" max="100" size="1"> <span style="margin: 0 10px;"><i class="fas fa-lg fa-arrow-alt-circle-up up"></i></span> <span><i class="fas fa-lg fa-arrow-alt-circle-down down"></i></span>
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
				<input type="hidden" name="perfumeNo" value="${perfume.perfumeNo }"> <input type="hidden" name="perfumePrice" value="${perfume.perfumePrice }"> <input type="hidden" name="perfumeName" value="${perfume.perfumeName }"> <input type="hidden" name="pFilerename" value="${perfume.pFilerename }"> <input type="hidden" name="cartQuantity" value="">
			</form>

			<!-- 테스트 -->
			<hr style="width: 100%; color: red; margin-top: 100px">
			<div style="width: 75%;">
				<h2>
					QnA<sub> 상품 문의<b>(총 ${cnt }개)</b></sub>
				</h2>
				<c:if test="${qnaList ne null }">
					<table style="text-align: center; width: 100%; table-layout: fixed;">
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
											<td onclick='lock(this)'>${qna.qnaSubject}<i class="fa-solid fa-lock"></i></td>
										</c:when>
										<c:otherwise>
											<td><a onclick="goQnaModal(${qna.qnaNo})">${qna.qnaSubject}</a></td>
										</c:otherwise>
									</c:choose>
									<td>${qna.memberNickname }</td>
									<td>${qnaDate }</td>
								</tr>
								<c:choose>
									<c:when test="${not empty qna.qnaPassword}">
										<tr style="display: none;" class="hiddenTr">
											<td colspan="2"></td>
											<td>
												<form onsubmit="validatePassword(event, ${status.count })">
												  <div class="hidden-password">
												    비밀번호 : <input type="password" name="qnaPassword" id="qnaPassword${status.count }" class="hidden"> <input type="hidden" name="qnaNo" id="qnaNo${status.count }" value="${qna.qnaNo}">
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
				<button type="button" onclick="location.href = '/qnaboard/write/${perfume.perfumeNo }'">문의작성</button>
			</div>



		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />




	<script>

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
					alertModal('이미 재입고알림 신청함');
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
							alertModal('재입고 알림 신청 오나료!')
						} else {
							// 재입고 알림 신청 실패
							alert(result);
						}
					});
				}
			}
		}


		// 현재 링크
		const url = encodeURI(window.location.href);

		// 상품 디테일 페이지 링크 복사
		$('#copy').click(function() {
			window.navigator.clipboard.writeText(url).then(() => {
				// 복사가 완료되면 호출된다.
				alertModal('상품 링크가 복사되었습니다!');
			});
		});

		// 공유하기 - 페북, 트위터
		$('#facebook').click(function() {
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
				alert('로그인부터 하시길!')
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
							$('#wishBtn').html('❤️');
							$('#wishStatus').val(1);
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
									$('#wishBtn').html('🤍');
									$('#wishStatus').val(0);
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
				alert('품절된 상품입니다!');
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
							let result = confirm('이미 장바구니에 추가된 상품입니다!\n장바구니로 이동하시겠습니까?');
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
					alertModal('장바구니에 추가되었습니다!');
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
		
		/* 문의관련 스크립트 */
		
		function lock(target) {
			$(target).parent().next(".hiddenTr").toggle();
		}
		
		// Ajax 요청을 통해 비밀번호 검증 및 페이지 이동 또는 알림창 표시
		function validatePassword(event, status) {
			event.preventDefault();
			
			let qnaNo = $("#qnaNo"+status).val();
			let password = $("#qnaPassword"+status).val();

			// 비밀번호 검증 Ajax 요청
			$.ajax({
				type : "POST",
				url : "/qnaboard/samepwd",
				data : {
					"qnaNo" : qnaNo,
					"inputPw" : password
				},
				success : function(response) {
					if (response === "1") {
						// 비밀번호가 맞을 경우 모달창
						// return 미지정 -> return true;
						goQnaModal(qnaNo);
					} else {
						// return false;
						alert("비밀번호가 일치하지 않습니다");	
					}
				}
			});

			// 폼 전송 방지
			return false;
		}
		
		function goQnaModal(qnaNum) {
			var url = "/qnaboard/qnaDetail/" + qnaNum;
			document.getElementById("qna-iframe").src = url;
			$("#qna-iframe").css("display", "block");
			$("#modal-bg").css("display", "block");
			$("body").css("overflow", "hidden");
		}

		function outQnaModal() {
			/* 비밀번호 입력창 제거하고 값 초기화 */
			$(".hidden").val("");
			$(".hiddenTr").css("display", "none");
			/* 모달 초기화 */
			$("#chat-iframe").attr("src", "");
			$("#qna-iframe").css("display", "none");
			$("#modal-bg").css("display", "none");
			$("body").css("overflow", "auto");
		}

	</script>

</body>

</html>