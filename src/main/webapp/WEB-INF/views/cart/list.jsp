<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
			<script src="https://kit.fontawesome.com/972e551b53.js"></script>
			<link rel="stylesheet" href="../../../resources/wishCss/list.css">
			<style>
			</style>
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
								<tr>
									<td><input type="checkbox" class="check" value="${perfume.cartNo }"></td>
									<td>${i.count }</td>
									<td><img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}"
											alt="향수이미지"></td>
									<td>${perfume.perfumeBrand }</td>
									<td>${perfume.perfumeName }</td>
									<td>${perfume.perfumeVolume }</td>
									<td>${perfume.perfumePrice }</td>
									<td id="reload${perfume.cartNo }"><input type="number"
											id="perfumeQuantity${perfume.cartNo}" value="${perfume.cartQuantity}"
											min="1" max="${perfume.perfumeQuantity }" size="1"> <span
											style="margin: 0 10px;"> <i class="fas fa-lg fa-arrow-alt-circle-up"
												id="up${perfume.cartNo}"
												onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
										</span> <span> <i class="fas fa-lg fa-arrow-alt-circle-down"
												id="down${perfume.cartNo}"
												onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
										</span></td>
									<td id="total${perfume.cartNo}">${perfume.perfumePrice * perfume.cartQuantity }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="del">선택삭제</button>
					<p>상품 갯수 : </p>
					<p>합계 금액 : </p>
				</div>
			</main>
			<jsp:include page="../common/footer.jsp" />

			<script>
				// 전체 선택 박스
				var allCheck = document.querySelector(".allCheck");
				var list = document.querySelectorAll(".check");
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

					upBtn.addEventListener("click", () => {
						input.stepUp();
						updateCart();
					});

					downBtn.addEventListener("click", () => {
						input.stepDown();
						updateCart();
					});

					function updateCart() {
						const cartQuantity = input.value;
						totalPrice.innerHTML = cartQuantity * price;

						$.ajax({
							url: "/cart/update",
							type: "POST",
							data: {
								cartNo: cartNo,
								cartQuantity: cartQuantity
							},
							success: function (result) {
								$("#reload" + cartNo).load(location.href + " #reload" + cartNo);
							},
							error: function () {
								alert("서버 처리 실패");
							}
						});
					}
				}


			</script>
		</body>

		</html>