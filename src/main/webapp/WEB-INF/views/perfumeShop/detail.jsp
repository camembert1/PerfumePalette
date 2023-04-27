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
					<!-- 모달 띄워서 수량 선택해서 그거랑 향수번호 넘기기 -->
					<!-- 일단은 임시로 걍 수량 입력받음! -->
					<!-- 모달 띄워서 제대로 받을 땐 남은 재고 이상으로 선택 못하게 하셈! -->
					<form action="/order/orderSheet" method="post">
						<input type="hidden"	name="memberNo"			value="${member.memberNo }">
						<input type="hidden" 	name="perfumeNo" 		value="${perfume.perfumeNo }">
						<input type="text" 		name="orderQuantity" 	placeholder="수량을 입력해주세요">
						<button onclick="return buy()">구매하기</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<button>재입고알림</button>
				</div>
			</c:otherwise>
		</c:choose>		
		
		<div>
			<button>장바구니</button>
		</div>
		
		<div>
			<div>상품상세</div>
			<div>상품후기(${reviewCnt })</div>
			<div>상품문의</div>
			<div>배송/교환/반품 안내</div>
		</div>
		<div>이거는 쿠팡 참고할거 어어 ㅋ</div>





	</div>
	</main>
	<jsp:include page="../common/footer.jsp" />

	
	

	<script>
		buy = function() {
			if($('[name=memberNo]').val() == '') {
				alert("로그인 시 구매할 수 있습니다.")
				return false;
			} else {
				// 수량 반드시 입력받도록!
				$(this).closest('form').submit();
			}
		}
	</script>

</body>

</html>