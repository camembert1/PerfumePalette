<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

		<link rel="stylesheet" href="../../../resources/perfumeShopCss/list.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

		<!-- favicon : 탭에 보이는 아이콘 -->
		<link rel="icon" href="../../resources/img/common/favicon.png" />
		<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
		
	</head>

	<body>
		<jsp:include page="../common/header.jsp" />
		<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<div id="main-content">
				<h1>향수 목록 출력 페이지</h1>
	
				<!-- 향 -->
				<div>
					<div class="scent-category" onclick="perfumeList(this)">All</div>
					<div class="scent-category" onclick="perfumeList(this)">Citrus</div>
					<div class="scent-category" onclick="perfumeList(this)">Fruity</div>
					<div class="scent-category" onclick="perfumeList(this)">Floral</div>
					<div class="scent-category" onclick="perfumeList(this)">Spicy</div>
					<div class="scent-category" onclick="perfumeList(this)">Woody</div>
				</div>
	
	
				<div id="filter-area">
	
					<!-- 정렬 순서 -->
					<div>
						<select name="" id="">
							<option value="">정렬</option>
							<option value="">신상품</option>
							<option value="">인기판매</option>
							<option value="">후기</option>
							<option value="">높은가격</option>
							<option value="">낮은가격</option>
						</select>
					</div>
	
					<!-- 가격 -->
					<div>
						<div>가격</div>
						<input type="range" id="volume" name="volume" min="0" max="400000" step="100000" list="volume-list">
						<datalist id="volume-list">
							<option value="0">0</option>
							<option value="100000">10만</option>
							<option value="200000">20만</option>
							<option value="300000">20만</option>
							<option value="400000">∞</option>
						</datalist>
					</div>
						
				</div>
	
				<table id="pList">
					<c:forEach items="${pList }" var="perfume" varStatus="status">
	
						<c:if test="${status.index % 4 == 0}">
							<tr>
						</c:if>
	
						<td onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo }'">
							<div>
								<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="이미지 진짜 없음"
								onerror="this.onerror=null; this.src='../../../resources/img/common/임시로쓸거.jpg';">
							</div>
							<div>
								<!-- 품절이라면 품절 표시-->
								<c:if test="${perfume.perfumeQuantity eq 0}">
									품절
								</c:if>
								
								<div>${perfume.perfumeBrand }</div>
								<div>${perfume.perfumeName }</div>
								<div><fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,##0"/>원</div>
							</div>
						</td>
	
						<c:if test="${status.index % 4 == 3 || status.last}">
							</tr>
						</c:if>
	
					</c:forEach>
				</table>
	
				<div class="paging">
					<c:if test="${paging.currentPage != 1}">
						<c:if test="${paging.startNavi != 1}">
							<!-- 첫 페이지로 버튼 -->
							<a href="javascript:getPerfumeList(1)" class="move first">&lt;&lt;</a>
						</c:if>	
						<!-- 이전 페이지로 버튼 -->
						<a href="javascript:getPerfumeList(${paging.currentPage-1})" class="move prev">&lt;</a>
					</c:if>
					
					<c:forEach begin="${paging.startNavi}" end="${paging.endNavi}" var="i">
						<c:choose>
							<c:when test="${i == paging.currentPage}">
								<span class="page current">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:getPerfumeList(${i})" class="page">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	
					<c:if test="${paging.currentPage != paging.maxPage}">
						<!-- 다음 페이지로 버튼 -->
						<a href="javascript:getPerfumeList(${paging.currentPage+1})" class="move next">&gt;</a>
						<c:if test="${paging.endNavi != paging.maxPage}">
							<!-- 맨 끝 페이지로 버튼 -->
							<a href="javascript:getPerfumeList(${paging.maxPage})" class="move last">&gt;&gt;</a>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		</main>
		<jsp:include page="../common/footer.jsp" />

		
		

		<script>

			perfumeList = function(tag) {
				location.href="/perfume/list?pScentCategory=" + tag.innerHTML;
			}
			
			const scentCategories = $(".scent-category");
			scentCategories.each(function() {
				$(this).on('click', (event) => {
					$.ajax({
						url: "/perfume/list",
						type: "POST",
						data: {
							pScentCategory: event.target.innerHTML
						},
						dataType: 'html',
						success: function(data) {
							console.log($(data).find("#pList"));
							let pList = $(data).find("#pList").html();
							console.log('테스트');
							console.log(pList);
							$("#pList").html(pList);
						},
						error: function() {
							console.log('ajax실패!');
						}
					});
				});
			});



			function getPerfumeList(page) {
				// 향, 정렬순서, 가격 정보 보내줘야됨!
				const info1 = "";
				const info2 = "";
				const info3 = "";

				$.ajax({
					url: "/perfume/list",
					type: "POST",
					data: {
						info1: info1,
						info2: info2,
						info3: info3
					},
					success: function() {}
				});
			}
		</script>

	</body>

	</html>