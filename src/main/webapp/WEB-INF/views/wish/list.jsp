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
<link rel="stylesheet" href="../../../resources/cartCss/list.css">
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
						<th style="width: 50px"><input type="checkbox" id="allCheck"></th>
						<th>이미지</th>
						<th>브랜드</th>
						<th>품명</th>
						<th>용량</th>
						<th>가격</th>
						<th>장바구니</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${perfumeList }" var="perfume" varStatus="i">
						<tr>
							<td><input type="checkbox" class="check" value="${perfume.wishNo }"></td>
							<td onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo}'"><img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}" alt="향수이미지"></td>
							<td onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo}'">${perfume.perfumeBrand }</td>
							<td onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo}'">${perfume.perfumeName }</td>
							<td>${perfume.perfumeVolume }ml</td>
							<td><fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,###" /> 원</td>
							<td>
								<div id="reload${perfume.perfumeNo }">
									<c:if test="${perfume.cartDate ne null}">
										<img src="../../../resources/img/cart/cart_yes.png" alt="cart_yes" onclick="removeCart('${perfume.perfumeNo }', '${perfume.cartNo }')">
									</c:if>
									<c:if test="${perfume.cartDate eq null}">
										<img src="../../../resources/img/cart/cart_no.png" alt="cart_no" onclick="addCart('${sessionScope.member.memberId }', '${perfume.perfumeNo}')">
									</c:if>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="btnBox">
				<button class="del">선택삭제</button>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />

	<script>
				// 전체 선택 박스
				var allCheck = document.querySelector("#allCheck");
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
				
				// 선택 박스 클릭
				for (var i = 0; i < list.length; i++) {
				  list[i].addEventListener('click', function () {
				    var isAllChecked = true;
				    for (var j = 0; j < list.length; j++) {
				      if (!list[j].checked) {
				        isAllChecked = false;
				        break;
				      }
				    }
				    if (isAllChecked) {
				      allCheck.checked = true;
				    } else {
				      allCheck.checked = false;
				    }
				  });
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
					
					if (del.length === 0) {
				        alert("선택된 상품이 없습니다.");
				        return;
				    }

					if (confirm("정말로 삭제하시겠습니까?")) {
						$.ajax({
							url: '/wish/removeWish',
							type: 'post',
							traditional: 'true',
							data: {
								'arr': del
							},
							success: function (result) {
								if (result === "success") {
									/* alert("찜 삭제 성공!!"); */
									location.href = "/wish/list";
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

				function addCart(memberId, perfumeNo) {
					$.ajax({
						url: "/cart/add",
						type: "POST",
						data: {
							memberId: memberId,
							cartQuantity: 0,
							perfumeNo: perfumeNo,
						},
						success: function (result) {
							$("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
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
								$("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
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
			</script>
</body>

</html>