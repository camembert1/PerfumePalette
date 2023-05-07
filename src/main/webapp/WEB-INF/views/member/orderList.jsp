<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet" href="../../../resources/memberCss/orderList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon"
	href="../../resources/img/common/favicon.png" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<!-- 사이드바 -->
			<div id="hrefList">
				<div id="hrefName">${member.memberName }님</div>
				<span><a href="/member/myPage">마이페이지</a></span> <span><a
					href="/member/orderList">주문내역조회</a></span> <span><a
					href="/member/myReview">작성후기</a></span> <span><a
					href="/member/myQna">작성문의</a></span> <span><a
					href="/member/myComment">작성댓글</a></span> <span><a
					href="/member/bye">회원탈퇴</a></span>
			</div>
			<!-- 여기부터 내용 입력하시면 됩니다! -->

			<h1>주문조회</h1>


			<table>
				<thead>
					<tr>
						<!-- <th>결제상태</th> -->
						<th>주문번호</th>
						<th>주문상품</th>
						<th>상품가격</th>
						<th>주문수량</th>
						<th>총 결제금액</th>
						<th>주문상태</th>
						<th>후기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="order" varStatus="i">
						<tr class="orderTrTag">
							<!-- <td onclick="updatePayment('${order.orderNo}')">${order.paymentStatus}</td> -->
							<td id="orderNo${i.index}"><a href="">${order.orderNo}</td>
							<!-- <td id="perfumeImg${i.index}"><img src="../../../resources/img/perfumeFileUploads/${order.pFilerename}" alt=""></td> -->
							<td id="perfumeName${i.index}"><a
								href="/perfume/detail/${order.perfumeNo}">${order.perfumeName}</a></td>
							<td id="perfumePrice${i.index}"><fmt:formatNumber
									value="${order.perfumePrice}" pattern="#,##0" /></td>
							<td id="orderQuantity${i.index}">${order.orderQuantity}</td>
							<td id="paymentAmount${i.index}"><fmt:formatNumber
									value="${order.paymentAmount}" pattern="#,##0" /></td>
							<td id="orderStatus${i.index}">${order.orderStatus}</td>
							<td id="reviewStatus${i.index}"><c:choose>
									<c:when test="${order.reviewStatus eq 0}">
										<c:choose>
											<c:when test="${order.orderStatus eq '배송완료'}">
												<button
													onclick="location.href = '/review/reviewWrite?orderInfo=${order.memberNo};${order.perfumeNo};${order.orderNo}'">후기작성</button>
											</c:when>
											<c:otherwise>
												<button
													style="background-color: rgb(175, 175, 175); cursor: unset;">후기작성</button>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<a href="">후기확인</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


	</main>
	<jsp:include page="../common/footer.jsp" />

	<script>
		// MemberController 수정 안 하고 OrderController에서 작업하기 위함!
		if ('${checkStatus}' == '') {
			location.href = "/order/orderList"
		}

		$(document).ready(function() {
			tableFunc();
		});

		updatePayment = function(orderNo) {
			$.ajax({
				url : '/order/updatePayment/' + orderNo,
				type : 'POST'
			}).done(function(result) {
				alert(result)
			});
		}

		tableFunc = function() {
			let prevOrderNo = 0;
			let orderNoCnt = 1;
			$('.orderTrTag').each(
					function(index, element) {
						if (prevOrderNo == $(element).find('[id^=orderNo]')
								.html()) {
							orderNoCnt += 1;
						} else {
							if (prevOrderNo != 0 && orderNoCnt != 1) {
								$('#orderNo' + (index - orderNoCnt)).attr(
										'rowspan', orderNoCnt);
								$('#paymentAmount' + (index - orderNoCnt))
										.attr('rowspan', orderNoCnt);
								$('#orderStatus' + (index - orderNoCnt)).attr(
										'rowspan', orderNoCnt);
								for (let i = 1; i < orderNoCnt; i++) {
									$('#orderNo' + (index - i)).remove();
									$('#paymentAmount' + (index - i)).remove();
									$('#orderStatus' + (index - i)).remove();
								}
							}
							orderNoCnt = 1;
						}
						prevOrderNo = $(element).find('[id^=orderNo]').html();

						if (index == $('.orderTrTag').length - 1
								&& orderNoCnt != 1) {

						}
					});
		}
	</script>
</body>
</html>