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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<!-- favicon : 탭에 보이는 아이콘 -->
	<link rel="icon" href="../../resources/img/common/favicon.png" />
	<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />

	<!-- 포트원 결제 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<!-- 부트스트랩인가?? 그 모달창에 버튼 위아래 아이콘인듯! -->
	<script src="https://kit.fontawesome.com/972e551b53.js"></script>

	
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
	<!-- 헤더 부분 피하기 위한 div -->
	<div id="forHeader"></div>

	<!-- 본문 내용 가운데 정렬 위한 div -->
	<div id="forCenter">
		
		<!-- 여기부터 내용 입력하시면 됩니다! -->


		<!-- <h3>perfumeNo : ${perfume.perfumeNo}</h3>
		<h3>perfumeQuantity : ${perfume.perfumeQuantity}</h3>
		<h3>pScentCategory : ${perfume.pScentCategory}</h3>
		<h3>pImageCategory : ${perfume.pImageCategory}</h3>
		<h3>perfumeDate : ${perfume.perfumeDate}</h3> -->

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
				<div>재고만아 어어</div>
			</c:otherwise>
		</c:choose>


		<div>perfumeVolume : ${perfume.perfumeVolume }</div>
		<div>perfumePrice : ${perfume.perfumePrice }</div>

		<div>
			<button>SNS공유하기</button>
		</div>


		<c:choose>
			<c:when test="${perfume.perfumeQuantity > 0}">
				<div>
					<button onclick="buy()">구매하기</button>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<button>재입고알림</button>
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
					<span id="perfumeBrand">[${perfume.perfumeBrand }]</span> <span id="perfumeName">[${perfume.perfumeName }]</span>
					<input type="hidden" id="perfumeNo" value="${perfume.perfumeNo }">
				</div>
				<div id="other-name">
					<div>
						<span id="perfumePrice">[가격]</span>
					</div>
					<div id="updown">
						<input type="number" id="perfumeQuantity" value="1" min="1" max="100" size="1">
						<span style="margin: 0 10px;"><i class="fas fa-lg fa-arrow-alt-circle-up up"></i></span> <span><i class="fas fa-lg fa-arrow-alt-circle-down down"></i></span>
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
		order = function() {
			$('[name=cartQuantity]').val($("#perfumeQuantity").val());
			$('#orderForm').submit();
		}

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
		
		upBtn.addEventListener("click", () => {
			input.stepUp();
		});

		downBtn.addEventListener("click", () => {
			input.stepDown();
		});


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

	</script>

</body>

</html>