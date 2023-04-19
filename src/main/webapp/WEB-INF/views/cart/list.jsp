<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/972e551b53.js"></script>
<link rel="stylesheet" href="../../../resources/wishCss/list.css">
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" class="allCheck"></th>
						<th>번호</th>
						<th>이미지</th>
						<th>브랜드</th>
						<th>품명</th>
						<th>용량</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${perfumeList }" var="perfume" varStatus="i">
						<tr onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo}'">
							<td onclick="event.stopPropagation();">
								<input type="checkbox" class="check" value="${perfume.cartNo }">
							</td>
							<td>${i.count }</td>
							<td>
								<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}" alt="향수이미지">
							</td>
							<td>${perfume.perfumeBrand }</td>
							<td>${perfume.perfumeName }</td>
							<td>${perfume.perfumeVolume }</td>
							<td>${perfume.perfumePrice }</td>
							<td onclick="event.stopPropagation();">
								<input type="number" id="perfumeQuantity${perfume.cartNo}" id="reload${perfume.cartNo }" class="cnt" value="${perfume.cartQuantity}" min="0" max="${perfume.perfumeQuantity }" size="1">
								<span>개 <i class="fas fa-arrow-alt-circle-up" id="up${perfume.cartNo}" onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
								</span> <span> <i class="fas fa-arrow-alt-circle-down" id="down${perfume.cartNo}" onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
								</span>
							</td>
							<td class="totalMoney" id="total${perfume.cartNo}">
								<fmt:formatNumber value="${perfume.perfumePrice * perfume.cartQuantity}" pattern="#,###" />
								원
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button class="del">선택삭제</button>
			<p>
				상품 갯수 : <span id="itemCount">0개</span>
			</p>
			<p>
				합계 금액 : <span id="totalPrice">0원</span>
			</p>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />

	<script>
					function updateCart() {
						var itemCount = 0;
						var totalPrice = 0;
						$(".check:checked").each(function () {
							var price = $(this).closest("tr").find(".totalMoney").html().replace(/[^0-9]/g, "");
							totalPrice += parseInt(price);
							var cnt = $(this).closest("tr").find(".cnt").val();
							itemCount += parseInt(cnt);
						});
						// 상품 갯수와 합계 금액을 출력
						$("#totalPrice").text(totalPrice.toLocaleString('ko-KR') + '원');
						$("#itemCount").text(itemCount + "개");
					}

					$("input[type='checkbox'], .allCheck").on("change", function () {
						updateCart();
					});

					// 전체 선택 박스
					var allCheck = document.querySelector(".allCheck");
					allCheck.onclick = () => {
						if (allCheck.checked) {
							for (var i = 0; i < list.length; i++) {
								list[i].checked = true;
							}
						} else {
							for (var i = 0; i < list.length; i++) {
								list[i].checked = false;
							}
						}
					}

					// 선택 박스 삭제
					var list = document.querySelectorAll(".check");
					document.querySelector(".del").addEventListener('click', function () {
						var del = new Array();
						var list = document.querySelectorAll(".check");
						for (var i = 0; i < list.length; i++) {
							if (list[i].checked) {
								del.push(list[i].value);
							}
						}

						if (confirm("정말로 삭제하시겠습니까?")) {
							$.ajax({
								url: '/cart/removeCart',
								type: 'post',
								traditional: 'true',
								data: {
									'arr': del
								},
								success: function (result) {
									if (result === "success") {
										/* alert("장바구니 삭제 성공!!"); */
										location.href = "/cart/list";
									} else if (result === "fail") {
										alert("찜 삭제 실패!!");
									} else if (result === "error") {
										alert("에러 발생!!");
									}
								},
								error: function (data) {
									alert("서버 처리 실패");
								}
							});
						}
					});

					function changeQuantity(cartNo, price) {
						const input = document.getElementById("perfumeQuantity" + cartNo);
						const upBtn = document.getElementById("up" + cartNo);
						const downBtn = document.getElementById("down" + cartNo);
						const totalPrice = document.getElementById("total" + cartNo);

						const maxQuantity = parseInt(input.max);
						const minQuantity = parseInt(input.min);
						
						// 익명 함수를 변수에 저장
						const handleUpClick = () => {
						  if (input.value < maxQuantity) {
						    input.stepUp();
						    updateCart();
						  } else {
						    alert("해당 재고가 부족합니다.");
						  }
						};

						const handleDownClick = () => {
						  if (input.value > minQuantity) {
						    input.stepDown();
						    updateCart();
						  }
						};

						// 변수를 활용해서 이벤트 리스너를 추가
						upBtn.addEventListener("click", handleUpClick);
						downBtn.addEventListener("click", handleDownClick);

						function updateCart() {
							const cartQuantity = input.value;
							const cartTotalPrice = cartQuantity * price;

							// AJAX 요청 전에 합계 금액을 변경함
							// AJAX 요청 이후에 하면 정확한 금액이 안나옴
							totalPrice.textContent = cartTotalPrice.toLocaleString('ko-KR') + '원';

							$.ajax({
								url: "/cart/update",
								type: "POST",
								data: {
									cartNo: cartNo,
									cartQuantity: cartQuantity
								},
								success: function (result) {
									$("#reload" + cartNo).load(location.href + " #reload" + cartNo);
									updateTotalPrice();
									
									// 반드시 삭제해줘야함!!
									// 변수를 활용해서 이벤트 리스너를 삭제
									upBtn.removeEventListener("click", handleUpClick);
									downBtn.removeEventListener("click", handleDownClick);
								},
								error: function () {
									alert("서버 처리 실패");
								}
							});
						}
					}

					// 장바구니 상품 수량 변경 시 합계 금액 업데이트
					function updateTotalPrice() {
						var totalPrice = 0;
						var itemCount = 0;
						var list = document.querySelectorAll(".check");
						for (var i = 0; i < list.length; i++) {
							if (list[i].checked) {
								const cartNo = list[i].value;
								const input = document.getElementById("perfumeQuantity" + cartNo);
								const price = parseInt($("#total" + cartNo).text().replace(/[^0-9]/g, ""));
								const quantity = parseInt(input.value);
								totalPrice += price;
								itemCount += quantity;
							}
						}
						$("#totalPrice").text(totalPrice.toLocaleString('ko-KR') + '원');
						$("#itemCount").text(itemCount + "개");
					}


	</script>
</body>

</html>