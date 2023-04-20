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
		
		<!-- 양방향 슬라이더 사용 위함 -->
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		
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
				
				
				<form id="filter-area" method="post">

					<!-- 향 -->
					<div id="scent-area">
						<div class="scent-category" onclick="pScentCategoryFunc(this)">All</div>
						<div class="scent-category" onclick="pScentCategoryFunc(this)">Citrus</div>
						<div class="scent-category" onclick="pScentCategoryFunc(this)">Fruity</div>
						<div class="scent-category" onclick="pScentCategoryFunc(this)">Floral</div>
						<div class="scent-category" onclick="pScentCategoryFunc(this)">Spicy</div>
						<div class="scent-category" onclick="pScentCategoryFunc(this)">Woody</div>
					</div>
	
					<!-- 정렬 순서 -->
					<div id="sort-by-area">
						<select onchange="perfumeSortFunc(this)">
							<option value="">정렬</option>
							<option value="new" <c:if test="${filtering.perfumeSort eq 'new'}">selected</c:if>>신상품</option>
							<option value="hot" <c:if test="${filtering.perfumeSort eq 'hot'}">selected</c:if>>인기판매</option>
							<option value="review" <c:if test="${filtering.perfumeSort eq 'review'}">selected</c:if>>후기</option>
							<option value="highPrice" <c:if test="${filtering.perfumeSort eq 'highPrice'}">selected</c:if>>높은가격</option>
							<option value="lowPrice" <c:if test="${filtering.perfumeSort eq 'lowPrice'}">selected</c:if>>낮은가격</option>
						</select>
					</div>
	
					<!-- 가격 -->
					<div id="price-area">
						<div>가격</div>
						<div id="price-slider-area">
							<div id="slider-range"></div>
							<p id="slider-values">
								<span id="min-value">0</span>
								~
								<span id="max-value">∞</span>
							</p>
						</div>
					</div>

					<!-- 이름 검색 -->
					<div id="search-area">
						<div>검색</div>
						<input type="text" oninput="perfumeSearchFunc(this)" value="<c:if test='${filtering.perfumeSearch ne null}'>${filtering.perfumeSearch}</c:if>">
					</div>
						

					<input type="hidden" name="page">

					<input type="hidden" name="pScentCategory" value="${filtering.pScentCategory }">
					<input type="hidden" name="perfumeSort" value="${filtering.perfumeSort }">
					<input type="hidden" name="startPerfumePrice" value="${filtering.startPerfumePrice }">
					<input type="hidden" name="endPerfumePrice" value="${filtering.endPerfumePrice }">
					<input type="hidden" name="perfumeSearch" value="${filtering.perfumeSearch }">

					<input type="text" name="" value="${compare.perfume1 }">
					<input type="text" name="" value="${compare.perfume2 }">
					<input type="text" name="" value="${compare.perfume3 }">
				</form>

				<div id="compare-area" onclick="compareModal()">
					<div>비교함</div>
					<div><span>0</span>개</div>
				</div>

				<div id="compare-modal-bg">
					<div id="compare-modal">
						<div id="compare-modal-close-btn" onclick="compareModal()">×</div>
						<div id="compare-real">
							<div id="compare-real-title">향수 비교하기 <span>비교는 최대 3개까지 가능합니다.</span><input type="text" id="compare-cnt" value="0"></div>
							<div id="compare-real-info">
								<table>
									<tr id="compare-img">		<th>이미지</th><td></td><td></td><td></td></tr>
									<tr id="compare-brand">		<th>브랜드</th><td></td><td></td><td></td></tr>
									<tr id="compare-name">		<th>제품명</th><td></td><td></td><td></td></tr>
									<tr id="compare-scent">		<th>향</th><td></td><td></td><td></td></tr>
									<tr id="compare-volume">	<th>용량</th><td></td><td></td><td></td></tr>
									<tr id="compare-price">		<th>가격</th><td></td><td></td><td></td></tr>
									<tr id="compare-25price">	<th>25ml당 가격</th><td></td><td></td><td></td></tr>
									<tr id="compare-detailBtn">	<th></th><td>상세보기</td><td>상세보기</td><td>상세보기</td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 필터링 및 비교 모달 끝! -->

				<div style="height: 200px; width: 100%; background-color: rgba(0, 0, 255, 0);">
					향수추천공간입니다
				</div>

				<div style="height: 100px; width: 100%; background-color: rgba(255, 217, 0, 0);">
					pScentCategory공간입니다
				</div>

				<table id="pList">
					<div>${msg}</div>
					<c:forEach items="${pList }" var="perfume" varStatus="status">
	
						<c:if test="${status.index % 4 == 0}">
							<tr>
						</c:if>
	
						<td>
							<div onclick="location.href='/perfume/detail?perfumeNo=${perfume.perfumeNo }'">
								<div>
									<!-- <img class="perfumeImg" src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="향수이미지"> -->
									<div class="perfumeImg" style="background-image: url('../../../resources/img/perfumeFileUploads/${perfume.pFilerename }');">
										<div id="addWish">
											<div id="wishImg" onclick="wish(event, this)">
												<input type="hidden" value="${perfume.perfumeNo }">
											</div>
										</div>
									</div>
									
								</div>
								<div>
									<!-- 품절이라면 품절 표시-->
									<c:if test="${perfume.perfumeQuantity eq 0}">
										품절
									</c:if>
									
									<!-- 잘렸을 경우 ...처리해주기!! -->
									<c:set var="perfumeBrand" value="${fn:substring(perfume.perfumeBrand, 0, 5)}" />
									<div>${perfumeBrand }</div>
	
									<c:set var="perfumeName" value="${fn:substring(perfume.perfumeName, 0, 10)}" />
									<div>${perfumeName}</div>
									<div><fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,##0"/>원</div>
								</div>
							</div>

							<!-- 비교함에 넣을 정보 -->
							<div class="pCompareBtn" onclick="compare(this)">
								비교함<span>추가</span>
								<input type="hidden" 	class="compareStatus" 	value="0">
								<input type="hidden" 	class="comparePerfume" 		value="${perfume }">
							</div>
						</td>
	
						<c:if test="${status.index % 4 == 3 || status.last}">
							</tr>
						</c:if>
	
					</c:forEach>
				</table>
	
				<div id="paging">
					<c:if test="${paging.totalCount ne null }">
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
		
						<c:if test="${paging.currentPage != paging.lastPage}">
							<!-- 다음 페이지로 버튼 -->
							<a href="javascript:getPerfumeList(${paging.currentPage+1})" class="move next">&gt;</a>
							<c:if test="${paging.endNavi != paging.lastPage}">
								<!-- 맨 끝 페이지로 버튼 -->
								<a href="javascript:getPerfumeList(${paging.lastPage})" class="move last">&gt;&gt;</a>
							</c:if>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		</main>
		

		

		<script>

			// 비교함 추가 삭제
			compare = function(tag) {
				
				// 비교함에 추가한 향수 객체
				//


				$(tag).filter(function() {
					if ($(this).find('.compareStatus').val() == 0) {

						// 비교함에 없다면
						
						// 1. 비교함 추가됨=1로 상태 변경, 버튼은 삭제로 바꿔주기
						$(this).find('.compareStatus').val(1);
						$(this).find('span').html('삭제');

						// 2. 해당 향수 비교함에 추가하기 
						// - 클릭 시 hidden name태그에 넣기
						// - name 태그에 있는 정보는 페이징 할 때 submit되므로 같이 가져옴? ㅇㅋㅇㅋ

						switch ($('#compare-cnt').val()) {
							case '0':
								// $('[name=perfume1]').val(comparePerfume);

								// $('#compare-name').find('td:eq(0)').html(pNameInfo);
								// $('#compare-cnt').val(1);
								// $('#compare-area').find('span').html(1);
								// alert('비교함에 추가되었습니다!\n' + comparePerfume)
								break;
							case 1:
								break;
							case 2:
								break;
							case 3:
								break;
						}
						


					} else {
						// 비교함에 있다면 비교함에서 삭제 (버튼은 추가로 바꿔주기)
						$(this).find('.compareStatus').val(0);
						$(this).find('span').html('추가');

						switch ($('#compare-cnt').val()) {
							case '0':
								$('#compare-name').find('td:eq(0)').html(pNameInfo);
								$('#compare-cnt').val(1);
								$('#compare-area').find('span').html(1);
								
								break;
							case '1':
								$('#compare-name').find('td:eq(0)').html('');
								$('#compare-cnt').val(0);
								$('#compare-area').find('span').html(0);
								break;
							case 2:
								break;
							case 3:
								break;
						}

						
					}
				});
			}

			// 비교함 버튼 눌렀을 때
			compareModal = function() {

				// 모달창 여닫는 속도
				let modalSpeed = 200;

				if ($('#compare-modal').css('display') === 'none') {
					// 모달창이 닫혀있다면 열기
					$("#compare-modal").fadeIn(modalSpeed);
					$("#compare-modal-bg").fadeIn(modalSpeed);
					$("body").css("overflow", "hidden");

				} else if ($('#compare-modal').css('display') === 'block') {
					// 모달창이 열려있다면 닫기
					$("#compare-modal").fadeOut(modalSpeed);
					$("#compare-modal-bg").fadeOut(modalSpeed);
					// 메인화면에선 어차피 overflow hidden이라 바꾸면 안됨
					if (!pattern.test(curURL.slice(-6))) {
						$("body").css("overflow-y", "visible");
					}

				}
			}

			// pScentCategory 선택된 값 글자 속성 바꾸는 함수
			pScentText = function() {
				$('.scent-category').filter(function() {
					if ($(this).html() === $('[name=pScentCategory]').val()) {
						$(this).css({
							"color": "red"
						});
					} else {
						$(this).css({
							"color": "black"
						});
					}
				});
			}
			// 페이지 로드 되자마자 실행
			pScentText();
			

			// 클릭한 pScentCategory hidden 태그에 넣어주기 + 클릭한 pScentCategory 글자 속성 바꿔주기
			pScentCategoryFunc = function(tag) {
				$('[name=pScentCategory]').val(tag.innerHTML);
				pScentText();
			}
			// 클릭한 perfumeSort hidden 태그에 넣어주기
			perfumeSortFunc = function(tag) {
				$('[name=perfumeSort]').val(tag.value);
			}
			// 입력한 perfumeSearch hidden 태그에 넣어주기
			perfumeSearchFunc = function(tag) {
				$('[name=perfumeSearch]').val(tag.value);
			}
			// 조작한 perfumePrice값 두 개 각각의 hidden 태그에 넣어주기
			$('#slider-range').slider({
				range: true,
				min: 0,
				max: 600000,
				values: [$('[name=startPerfumePrice]').val(),  $('[name=endPerfumePrice]').val()],
				step: 50000,
				slide: function(event, ui) {
					$('[name=startPerfumePrice]').val(ui.values[0]);
					$('[name=endPerfumePrice]').val(ui.values[1]);

					$('#min-value').text(ui.values[0]);
					if (ui.values[1] === 600000) {
						$('#max-value').text('∞');
					} else {
						$('#max-value').text(ui.values[1]);
					}

				}
			});

			// 필터를 조작하면 필터에 맞는 리스트 비동기로 불러옴
			$('.scent-category, select, #slider-range, #search-area>input').on('change click input', function() {
				getPerfumeList(0);
			});
				

			// 필터 + 페이징 결과 불러오는 함수
			getPerfumeList = function(page) {

				let pScentCategory = $('[name=pScentCategory]').val();
				let perfumeSort = $('[name=perfumeSort]').val();
				let startPerfumePrice = $('[name=startPerfumePrice]').val();
				let endPerfumePrice = $('[name=endPerfumePrice]').val();
				let perfumeSearch = $('[name=perfumeSearch]').val();

				if (page != 0) {
					// 페이지가 0이 아니면 = 페이지를 조작하면(새로고침)
					$('[name=page]').val(page);
					$('#filter-area').submit();

				} else {
					// 페이지가 0이면 = 필터를 조작하면(비동기)
					$.ajax({
						url: "/perfume/list",
						type: "POST",
						data: {
							"pScentCategory": pScentCategory,
							"perfumeSort": perfumeSort,
							"startPerfumePrice": startPerfumePrice,
							"endPerfumePrice": endPerfumePrice,
							"perfumeSearch": perfumeSearch
						},
						dataType: "html",
						success: function(data) {

							// 가져온 데이터에서 게시글 목록과 페이징 정보 추출
							var pList = $(data).find("#pList").html();
							var paging = $(data).find("#paging").html();

							// 게시글 목록과 페이징 정보를 업데이트
							$("#pList").html(pList);
							$("#paging").html(paging);
						}
					});
				}
			}


			// 페이지 버튼 클릭 이벤트 처리
			$(document).on("click", ".paging-btn", function() {
				var page = $(this).data("page");
				getPerfumeList(page);
			});

			// 처음으로 버튼 클릭 이벤트 처리
			$(document).on("click", "#btn-first", function() {
				var page = 1;
				getPerfumeList(page);
			});

			// 이전 버튼 클릭 이벤트 처리
			$(document).on("click", "#btn-prev", function() {
				var page = $(this).data("prev");
				getPerfumeList(page);
			});

			// 다음 버튼 클릭 이벤트 처리
			$(document).on("click", "#btn-next", function() {
				var page = $(this).data("next");
				getPerfumeList(page);
			});

			// 마지막으로 버튼 클릭 이벤트 처리
			$(document).on("click", "#btn-last", function() {
				var page = $(this).data("last");
				getPerfumeList(page);
			});

			
			// Wish 하트 클릭
			wish = function(e, tag) {
				e.stopPropagation(); // 하트 클릭할 경우 detail로 이동 방지
				let perfumeNo = tag.querySelector('input').value;
				let memberId = '${sessionScope.member.memberId }';
    			$.ajax({
					url:'/wish/add',
					type: 'POST',
					data:{
						"perfumeNo": perfumeNo,
						"memberId": memberId
					},
					success: function(result) {
						alert(result)
					},
					error: function(result) {
						alert(result)
					}

				});
			}

			

		</script>

		<jsp:include page="../common/footer.jsp" />

	</body>

	</html>