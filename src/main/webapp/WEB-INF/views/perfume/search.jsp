<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="../../../resources/perfumeCss/mList.css">
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon" href="../../../resources/img/common/favicon.png" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	/* 		고정 */
	#id_ok, #pw_ok, #nickName_ok, #email_ok {
		color: #008000;
		display: none;
	}
	
	#id_not_ok2, #id_not_ok3, #pw_not_ok2, #pw_not_ok3, #nickName_not_ok2,
		#nickName_not_ok3, #email_not_ok2, #email_not_ok3, #email_not_ok4 {
		color: #6A82FB;
		display: none;
	}
</style>
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
				<div id="hrefName">${sessionScope.member.memberName }님</div>
				<span><a href="/perfume/mList">판매상품관리</a></span>
				<span><a href="#">주문내역관리</a></span>
				<span><a href="/admin/member/amList">회원관리</a></span>
				<span><a href="/admin/qna/list">문의관리</a></span>
				<span><a href="/admin/review/list">후기관리</a></span>
			</div>

			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<h1>상품 관리</h1>
			<a href="/perfume/write">상품 등록</a>
			<table>
				<thead>
					<tr>
						<th><select>
								<option id="New">최신순</option>
								<option id="New">인기순</option>
								<option id="New">별점순</option>
						</select></th>
						<th><select>
								<!-- 						<option id="New">향종류</option> -->
								<option id="New">All</option>
								<option id="New">Citrus</option>
								<option id="New">Fruity</option>
								<option id="New">Floral</option>
								<option id="New">Spicy</option>
								<option id="New">Woody</option>
						</select></th>
						<th>
							<div> 
								<form action="/perfume/search" method="get">
									<select name="searchCondition">
										<option value="All" <c:if test="${search.searchCondition == 'All' }">selected</c:if>>All</option>
										<option value="Brand" <c:if test="${search.searchCondition == 'Brand' }">selected</c:if>>Brand</option>
										<option value="perfumeName" <c:if test="${search.searchCondition == 'perfumeName' }">selected</c:if>>perfumeName</option>
									</select> 
									<input type="text" name="searchValue" placeholder="상품명 검색">
									<button type="submit">검색</button>
								</form>
							</div>
						</th>
					</tr>
					<tr>
						<th><input type="checkbox" class="allCheck"></th>
						<th>번 호</th>
						<th>이미지</th>
						<th>브랜드</th>
						<th>상품명</th>
						<th>용 량</th>
						<th>가 격</th>
						<th>재 고</th>
						<th>향 분류</th>
						<th>이미지 분류</th>
						<th>노출 여부</th>
						<th>수 정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sList }" var="perfume" varStatus="i">
						<tr>
							<td class="td"><input type="checkbox" class="check"
								value="${perfume.perfumeNo }"></td>
							<td class="td">${i.count }</td>
							<td class="td"><img
								src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }"
								alt="상품 이미지"></td>
							<td class="td">${perfume.perfumeBrand }</td>
							<td class="td"><a
								href="/perfume/mDetail?perfumeNo=${perfume.perfumeNo }">${perfume.perfumeName }</a></td>
							<td class="td">${perfume.perfumeVolume }ml</td>
							<td class="td">${perfume.perfumePrice }원</td>
							<td class="td">${perfume.perfumeQuantity }&nbsp;EA</td>
							<td class="td">${perfume.pScentCategory }</td>
							<td class="td">${perfume.pImageCategory }</td>
							<td class="td"><c:choose>
									<c:when test="${perfume.perfumeStatus eq 1}">O</c:when>
									<c:when test="${perfume.perfumeStatus eq 0}">X</c:when>
								</c:choose></td>
							<td><button
									onclick="location.href='/perfume/modify?perfumeNo=' + ${perfume.perfumeNo}">수정</button></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td><button type="button" class="show">선택 노출</button></td>
						<td><button type="button" class="noShow">선택 비노출</button></td>
						<td><button type="button" class="del">삭제하기</button></td>
						<td><button type="button"
								onclick="location.href='/perfume/write'">상품 등록</button></td>
					</tr>
				</tfoot>
			</table>
			
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		// 전체 선택 박스
// 		$(document).ready(function() {
// 	        $('.allCheck').change(function() {
// 	            if ($(this).is(":checked")) {
// 	                $('.check').prop('checked', true);
// 	            } else {
// 	                $('.check').prop('checked', false);
// 	            }
// 	        });
// 	    });
			// 전체 선택 박스
			var allCheck = document.querySelector(".allCheck");
			var list = document.querySelectorAll(".check");
			allCheck.onclick = () => {
				if(allCheck.checked) {
					for(var i = 0; i < list.length; i++) {
						list[i].checked = true;
					}
				} else {
					for(var i = 0; i < list.length; i++) {
						list[i].checked = false;
					}
				}
			}
		
		
		// 선택 삭제
// 		var del = document.querySelector(".del");
		
// 		del.onclick = () => {
// 		    for(var i = 0; i < list.length; i++) {
// 		        if(list[i].checked) {
// 		            // list[i].parentElement.parentElement.remove();
// 		            console.log(list[i]);
// 		            let perfumeNo = list[i].value;
// 		            console.log(perfumeNo);
// 		            location.href='/perfume/remove?perfumeNo='+ perfumeNo;
// 		        }
// 		    }
// 		}
			// 선택 삭제
			document.querySelector(".del").addEventListener('click', function() {
				var del = new Array();
				var list = document.querySelectorAll(".check");
				for(var i = 0; i < list.length; i++){
					if(list[i].checked){
						del.push(list[i].value);
					}
				}
				console.log(del);
				if(confirm("정말 삭제 하시겠습니까?")) {
					$.ajax({
						url:'/perfume/remove',
						type : 'post',
						dataType : 'json',
						traditional : 'true',
						data : {'arr':del},
						success : function(data){
							if(data == 1) {
								alert("삭제되었습니다!");
								location.href = "/perfume/mList";
							}
						},
						error : function(data) {
							console.log(data)
						}
					});
				}
			});
			
			// 선택 공개
			document.querySelector(".show").addEventListener('click', function() {
				var show = new Array();
				var list = document.querySelectorAll(".check");
				for(var i = 0; i < list.length; i++) {
					if(list[i].checked) {
						show.push(list[i].value);
					}
				}
				console.log(show);
				if(confirm("정말 변경 하시겠습니까?")) {
					$.ajax({
						url:'/perfume/show',
						type : 'post',
						dataType : 'json',
						traditional : 'true',
						data : {'arr':show},
						success : function(data) {
							if(data == 1) {
								alert("노출로 변경되었습니다.");
								location.href = "/perfume/mList";
							}
						},
						error : function(data) {
							console.log(data)
						}
					})
				}
			});
			
			// 선택 비공개
			document.querySelector(".noShow").addEventListener('click', function() {
				var noShow = new Array();
				var list = document.querySelectorAll(".check");
				for(var i = 0; i < list.length; i++) {
					if(list[i].checked) {
						noShow.push(list[i].value);
					}
				}
				console.log(noShow);
				if(confirm("정말 변경 하시겠습니까?")) {
					$.ajax({
						url:'/perfume/noShow',
						type : 'post',
						dataType : 'json',
						traditional : 'true',
						data : {'arr':noShow},
						success : function(data) {
							if(data == 1) {
								alert("비노출로 변경되었습니다.");
								location.href = "/perfume/mList";
							}
						},
						error : function(data) {
							console.log(data)
						}
					})
				}
			});
		</script>
</body>
</html>