<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="../../../../resources/adminCss/adOrderCss/detail.css">
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon"
	href="../../../resources/img/common/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<style>
		
	</style>
</head>
<body>
	<!-- 	모달 이외 모자이크 -->
	<jsp:include page="../../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>

		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">

			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<h1>주문내역 상세</h1>
			<input type="hidden" value="${order.orderNo }">
<!-- 			상품 정보 -->
			<table>
				<caption class="caption_top"><strong>상품 정보</strong></caption>
				<c:forEach items="${orderList }" var="order" varStatus="i">
				<tr>
					<th class="perfume_info">브랜드</th>
					<td class="perfume_detailB">${order.perfumeBrand}</td>
					<th class="perfume_info">상품명</th>
					<td class="perfume_detail">${order.perfumeName }</td>
					<th class="perfume_info">주문 수량</th>
					<td class="orderQuantity">${order.orderQuantity }</td>
				</tr>
				</c:forEach>
				<tr>
					<th>결제 금액</th>
					<td colspan="5">${orderList[0].paymentAmount }</td>
				</tr>
			</table>
			
<!-- 			결제 정보 -->
			<table>
				<caption class="caption_top"><strong>결제 정보</strong></caption>
				<tr>
					<th class="perfume_info">주문번호</th>
					<td class="perfume_detail">${orderList[0].orderNo }</td>
					<th class="perfume_info">주문일자</th>
					<td class="perfume_detail">${orderList[0].orderDate }</td>
				</tr>
				<tr>
					<th class="perfume_info">주문자</th>
					<td class="perfume_detail">${orderList[0].memberName }</td>
					<th class="perfume_info">주문자번호</th>
					<td class="perfume_detail">${orderList[0].memberPhone }</td>
				</tr>
				<tr>
					<th class="perfume_info">결제수단</th>
					<td class="perfume_detail">${orderList[0].paymentMethod }</td>					
					<th class="perfume_info">은행명</th>
					<td class="perfume_detail">${orderList[0].vBankName }</td>					
				</tr>
				<tr>
					<th class="perfume_info">입금계좌</th>
					<td class="perfume_detail">${orderList[0].vBankNo }</td>					
					<th class="perfume_info">주문 상태</th>
					<td class="perfume_detail">${orderList[0].orderStatus }</td>					
				</tr>
			</table>
				
<!-- 			주문 정보 -->
			<table>
				<caption class="caption_top"><strong>주문 정보</strong></caption>
				<tr>
					<th class="perfume_info">수령인</th>
					<td class="perfume_detail">${orderList[0].recipientName }</td>
					<th class="perfume_info">전화번호</th>
					<td class="perfume_detail">${orderList[0].recipientPhone }</td>
				</tr>
				<tr>
					<th class="perfume_info">배송주소</th>
					<td colspan="3">${orderList[0].deliveryAddr }</td>
				</tr>
				<tr>
					<th class="perfume_info">배송메모</th>
					<td colspan="3">${orderList[0].deliveryMsg }</td>
				</tr>
			</table>
			<div id="ff"></div>
		</div>
	</main>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>
