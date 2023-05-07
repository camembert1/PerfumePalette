<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="../../../../resources/adminCss/adReviewCss/report.css">
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon"
	href="../../resources/img/common/favicon.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	<!-- 	모달 이외 모자이크 -->
	<div id="modal-bg"></div>
	<jsp:include page="../../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">

			<!-- 사이드바 -->
			<div id="hrefList">
				<div id="hrefName">${sessionScope.member.memberName }님</div>
				<span><a href="/perfume/mList">판매상품관리</a></span>
				<span><a href="/admin/order/list">주문내역관리</a></span>
				<span><a href="/admin/member/amList">회원관리</a></span>
				<span><a href="/admin/qna/list">문의관리</a></span>
				<span><a href="/admin/review/list">후기관리</a></span>
			</div>

			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<div id="subject"></div>
			<div class="continer">
			<h1>REVIEW 신고</h1>
			<table>
				<thead>
					<tr id="thead">
						<th>번 호</th>
						<th>신고사유</th>
						<th>내 용</th>
						<th>닉네임</th>
						<th>날 짜</th>
						<th>상 세</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rrList }" var="review" varStatus="i">
						<tr class="list">
							<td>${i.count }</td>
							<td class="tdOver">
								<c:choose>
									<c:when test="${review.reportType eq 0}">욕설/혐오/차별적 표현</c:when>
									<c:when test="${review.reportType eq 1}">부정절한 내용</c:when>
									<c:when test="${review.reportType eq 2}">기타</c:when>
								</c:choose>
							</td>
							<td class="tdOver">
								${review.reportContent }
							</td>
							<td class="tdOver">
								<a href="/admin/member/search?searchCondition=All&searchValue=${reivew.memberNickName }">
									${review.memberNickName }
								</a>
							</td>
							<td class="tdOver"><fmt:formatDate value="${review.reportDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>
								<button class="modal_btn" data-target="#modal${i.index }">보기</button>
							</td>
						</tr>
<!-- 						모달 시작 -->
						<div>
							<input type="hidden" name="reviewNo" value="${review.reviewNo }">
							<div class="modal" id="modal${i.index }">
								<div class="modal_body">
									<span class="modal_close"><b>X</b></span>
									<h1 class="modal_h1">${review.memberNickname }님의 신고내용입니다.</h1>
									<div>
										신고 사유 :
										<c:choose>
											<c:when test="${review.reportType eq 0}">욕설/혐오/차별적 표현</c:when>
											<c:when test="${review.reportType eq 1}">부정절한 내용</c:when>
											<c:when test="${review.reportType eq 2}">기타</c:when>
										</c:choose>
									</div>
									<div>
										<input type="text" name="reportContent" class="modal_input"
											value="${review.reportContent }" readonly="readonly">
									</div>
								</div>
									<div>
<!-- 										<button type="button" class="modal_close ">닫 기</button> -->
									</div>
							</div>
						</div>
						<!--    	 	모달 끝~ -->
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" class="line paging">
							<div id="paging">
								<c:if test="${paging.totalCount ne null }">
									<c:if test="${paging.currentPage != 1}">
										<c:if test="${paging.startNavi != 1}">
											<!-- 첫 페이지로 버튼 -->
											<a href="/admin/review/report?page=1" class="move first">&lt;&lt;</a>
										</c:if>
										<!-- 이전 페이지로 버튼 -->
										<a href="/admin/review/report?page=${paging.currentPage-1}"
											class="move prev">&lt;</a>
									</c:if>

									<c:forEach begin="${paging.startNavi}" end="${paging.endNavi}"
										var="i">
										<c:choose>
											<c:when test="${i == paging.currentPage}">
												<span class="page current">${i}</span>
											</c:when>
											<c:otherwise>
												<a href="/admin/review/report?page=${i}" class="page">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test="${paging.currentPage != paging.lastPage}">
										<!-- 다음 페이지로 버튼 -->
										<a href="/admin/review/report?page=${paging.currentPage+1}"
											class="move next">&gt;</a>
										<c:if test="${paging.endNavi != paging.lastPage}">
											<!-- 맨 끝 페이지로 버튼 -->
											<a href="/admin/review/report?page=${paging.lastPage}"
												class="move last">&gt;&gt;</a>
										</c:if>
									</c:if>
								</c:if>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
		</div>
	</main>
	<jsp:include page="../../common/footer.jsp" />
	<script>
		// 여기부터 모달!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		// modal, modal_btn, modal_close의 요소를 가져옴
		const modals = document.querySelectorAll('.modal');
		const btnOpenPopup = document.querySelectorAll('.modal_btn');
		const btnClosePopup = document.querySelectorAll('.modal_close');
		
		// 각각의 btnOpenPopup요소에 대해 반복문 수행
		btnOpenPopup.forEach((btn, i) => {
			// 클릭시 이벤트 리스너 등록
			btn.addEventListener('click', () => {
				// data-target 속성의 값을 가져옴
				const target = btn.dataset.target;
				// 해당 요소를 보였기 위해 디스플레이 속성값 블럭으로 변경
	// 			document.querySelector(target).style.display = 'block';
				$(target).css("display", "block");
				// 모달창 이외 모자이크
				$("#modal-bg").css("display", "block");
			});
		});
		// 각각의 btnClosePopup요소에 대해 반복문 수행
		btnClosePopup.forEach((btn) => {
			btn.addEventListener('click', () => {
	//가장 가까운 modal 요소를 찾아서 display 속성 값을 none으로 변경하여 모달 닫기
				const modal = btn.closest('.modal');
				modal.style.display = 'none';
				$("#modal-bg").css("display", "none");
	
			});
		});
	</script>
</body>
</html>