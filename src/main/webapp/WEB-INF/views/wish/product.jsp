<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/972e551b53.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
}

img {
	width: 100px;
	height: 100px;
}

table, td, th, tr {
	border: 1px solid black;
	padding: 10px;
	border-collapse: collapse;
	text-align: center;
}

td td {
	border: none;
	padding: 0;
}

#modal-bg {
	position: fixed;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.2);
	backdrop-filter: blur(3px);
	display: none;
}

#modal {
	height: 400px;
	width: 650px;
	border-radius: 25px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 20px;
	background-color: white;
	display: none;
}

#explain {
	height: 45%;
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

#explain div {
	height: 50%;
	width: 100%;
}

#name {
	text-align: center;
	font-size: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#name>span:first-child {
	margin-right: 5px;
}

#brand {
	text-align: center;
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#other-name {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 25px;
}

#other-name div {
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#money {
	height: 25%;
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-size: 25px;
}

#updown input {
	font-size: 25px;
}

#btn-box {
	height: 30%;
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

#btn-box button {
	height: 75%;
	width: 40%;
	background-color: #222222;
	color: white;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
	font-size: 20px;
}

#cnt {
	border: none;
	font-size: 20px;
	text-align: center;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#perfumeQuantity {
	border: none;
	text-align: end;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
</head>

<body>
	<c:if test="${perfumeList2 ne null}">
		<!-- 비회원의 경우 -->
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>향수명</th>
					<th>브랜드</th>
					<th>이미지</th>
					<th>찜</th>
					<th>장바구니</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${perfumeList2 }" var="perfume" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${perfume.perfumeName }</td>
						<td>${perfume.perfumeBrand }</td>
						<td class="imgBox">
							<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}" alt="향수이미지">
						</td>
						<td onclick="goLogin()">
							<img src="../../../resources/img/wish/wish_yes.png" alt="wish_yes">${perfume.wishCount }</td>
						<td onclick="goLogin()">
							<img src="../../../resources/img/cart/cart_yes.png" alt="cart_yes">${perfume.cartCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${perfumeList ne null}">
		<!-- 회원의 경우 -->
		<div id="modal-bg"></div>
		<div id="modal">
			<div id="explain">
				<div id="name">
					<span id="perfumeBrand">[브랜드명]</span> <span id="perfumeName">[상품명]</span>
					<input type="hidden" id="perfumeNo">
				</div>
				<div id="other-name">
					<div>
						<span id="perfumePrice">[가격]</span>
					</div>
					<div id="updown">
						<input type="number" id="perfumeQuantity" value="1" min="0" max="100" size="1">개
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
				<button type="button" onclick="addCartAjax()">
					<span>장바구니 담기</span>
				</button>
			</div>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>향수명</th>
					<th>브랜드</th>
					<th>이미지</th>
					<th>찜</th>
					<th>장바구니</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${perfumeList }" var="perfume" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${perfume.perfumeName }</td>
						<td>${perfume.perfumeBrand }</td>
						<td class="imgBox">
							<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}" alt="향수이미지">
						</td>
						<td>
							<div id="reload${perfume.perfumeNo }">
								<c:if test="${perfume.wishDate ne null}">
									<img src="../../../resources/img/wish/wish_yes.png" alt="wish_yes" onclick="removeWish(${perfume.wishNo}, ${perfume.perfumeNo })">
								</c:if>
								<c:if test="${perfume.wishDate eq null}">
									<img src="../../../resources/img/wish/wish_no.png" alt="wish_no" onclick="addWish(${perfume.perfumeNo}, '${sessionScope.member.memberId }')">
								</c:if>
							</div>
						</td>
						<td>
							<div id="reload2${perfume.perfumeNo }">
								<c:if test="${perfume.cartDate ne null}">
									<img src="../../../resources/img/cart/cart_yes.png" alt="cart_yes" onclick="removeCart('${perfume.perfumeNo }', '${perfume.cartNo }')">
								</c:if>
								<c:if test="${perfume.cartDate eq null}">
									<img src="../../../resources/img/cart/cart_no.png" alt="cart_no" onclick="addCartView('${perfume.perfumeNo }', '${perfume.perfumeBrand}', '${perfume.perfumeName}', '${perfume.perfumePrice }')">
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<script>
				function addCartView(perfumeNo, perfumeBrand, perfumeName, perfumePrice) {
					$("#perfumeBrand").html('[' + perfumeBrand + ']');
					$("#perfumeName").html(perfumeName);
					$("#perfumeNo").val(perfumeNo);
					var price = parseInt(perfumePrice);
					$("#perfumePrice").html(price.toLocaleString('ko-KR') + '원');
					/* 디폴트로 1개가 되어진건 보여줘야함 */
					var quantity = $("#perfumeQuantity").val();
					var totalPrice = price * parseInt(quantity);
					$("#perfumeTotalPrice").html(totalPrice.toLocaleString('ko-KR') + '원');

					/* 모달창 열기 함수 호출 */
					addCart();
				}

				/* 모달창 합계 금액 변경 */
				$(document).on("click", "#updown .up, #updown .down", function () {
					/* 정규식 써서 숫자를 제외한 모든 문자를 제거 */
					var price = parseInt($("#perfumePrice").text().replace(/[^0-9]/g, ""));
					var quantity = parseInt($("#perfumeQuantity").val());
					var totalPrice = price * quantity;
					$("#perfumeTotalPrice").text(totalPrice.toLocaleString('ko-KR') + '원');
				});

				/* 모달창 열기 함수  */
				function addCart() {
					$("#modal").css("display", "block");
					$("#modal-bg").css("display", "block");
					$("body").css("overflow", "hidden");
				}

				/* 모달창 닫기 */
				function modalClose() {
					$("#modal").css("display", "none");
					$("#modal-bg").css("display", "none");
					$("body").css("overflow", "visible");
					$("#perfumeQuantity").val("1");
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

				function removeCart(perfumeNo, cartNo) {
					$.ajax({
						url: "/cart/remove",
						type: "POST",
						data: {
							cartNo: cartNo
						},
						success: function (result) {
							if (result === "success") {
								$("#reload2" + perfumeNo).load(location.href + " #reload2" + perfumeNo);
								/* alert("찜 삭제 성공!!") */
							} else if (result === "fail") {
								alert("찜 삭제 실패!!");
							} else if (result === "error") {
								alert("에러 발생!!");
							}
						},
						error: function () {
							alert("서버 처리 실패");
						}
					});
				}

				function addWish(perfumeNo, id) {
					$.ajax({
						url: "/wish/add",
						type: "POST",
						data: {
							perfumeNo: perfumeNo,
							memberId: id
						},
						success: function (result) {
							if (result === "success") {
								/* alert("찜 추가 성공!!"); */
								/* location.reload(); // 페이지 새로고침 */
								/* 특정부분만 새로고침 */
								$("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
							} else if (result === "fail") {
								alert("찜 추가 실패!!");
							} else if (result === "error") {
								alert("에러 발생!!");
							}
						},
						error: function () {
							alert("서버 처리 실패");
						}
					});
				}

				function removeWish(wishNo, perfumeNo) {
					$.ajax({
						url: "/wish/remove",
						type: "POST",
						data: {
							wishNo: wishNo
						},
						success: function (result) {
							if (result === "success") {
								/* alert("찜 삭제 성공!!"); */
								/* location.reload(); // 페이지 새로고침 */
								/* 특정부분만 새로고침 */
								$("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
							} else if (result === "fail") {
								alert("찜 삭제 실패!!");
							} else if (result === "error") {
								alert("에러 발생!!");
							}
						},
						error: function () {
							alert("서버 처리 실패");
						}
					});
				};
				
				function goLogin() {
					if (confirm("로그인이 필요한 서비스입니다.")) {
						location.href="/member/login";
				    }
				}

			</script>
</body>

</html>