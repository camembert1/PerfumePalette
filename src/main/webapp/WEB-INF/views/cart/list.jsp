<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
							<td><input type="checkbox" class="check"
								value="${perfume.cartNo }"></td>
							<td>${i.count }</td>
							<td><img
								src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}"
								alt="향수이미지"></td>
							<td>${perfume.perfumeBrand }</td>
							<td>${perfume.perfumeName }</td>
							<td>${perfume.perfumeVolume }</td>
							<td>${perfume.perfumePrice }</td>
							<td id="reload${perfume.cartNo }"><input type="number"
								id="perfumeQuantity${perfume.cartNo}" class="cnt"
								value="${perfume.cartQuantity}" min="1"
								max="${perfume.perfumeQuantity }" size="1"> <span
								style="margin: 0 10px;"> <i
									class="fas fa-lg fa-arrow-alt-circle-up"
									id="up${perfume.cartNo}"
									onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
							</span> <span> <i class="fas fa-lg fa-arrow-alt-circle-down"
									id="down${perfume.cartNo}"
									onclick="changeQuantity(${perfume.cartNo}, ${perfume.perfumePrice })"></i>
							</span></td>
							<td class="totalMoney" id="total${perfume.cartNo}">${perfume.perfumePrice * perfume.cartQuantity }</td>
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
		  // 체크박스에 변경이 생길 때마다 합계 금액과 상품 갯수를 계산
		  $("input[type='checkbox']").on("change", function() {
		    var itemCount = 0;
		    var totalPrice = 0;
		    $("input[type='checkbox']:checked").each(function() {
		      var price = $(this).closest("tr").find(".totalMoney").html();
		      totalPrice += parseInt(price);
		      var cnt = $(this).closest("tr").find(".cnt").val();
		      itemCount += parseInt(cnt);
		    });
		    // 상품 갯수와 합계 금액을 출력
		    $("#itemCount").text(itemCount);
		    $("#totalPrice").text(totalPrice);
		  });
		  
		  $(".allCheck").on("change", function() {
			    var itemCount = 0;
			    var totalPrice = 0;
			    $(".check:checked").each(function() {
			      var price = $(this).closest("tr").find(".totalMoney").html();
			      totalPrice += parseInt(price);
			      var cnt = $(this).closest("tr").find(".cnt").val();
			      itemCount += parseInt(cnt);
			    });
			    // 상품 갯수와 합계 금액을 출력
			    $("#itemCount").text(itemCount);
			    $("#totalPrice").text(totalPrice);
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
								updateTotalPrice();
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
			                const price = parseInt(document.getElementById("total" + cartNo).textContent);
			                const quantity = parseInt(input.value);
			                totalPrice += price;
			                itemCount += quantity;
			            }
			        }
			        document.getElementById("totalPrice").textContent = totalPrice;
			        document.getElementById("itemCount").textContent = itemCount;
			    }

			</script>
</body>

</html>