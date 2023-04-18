<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>향수 리스트 관리자 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="../../../resources/perfumeCss/mList.css">
	</head>
	<body>
		<h1>상품 관리</h1> <a href="/perfume/write">상품 등록</a>
		<table>
			<thead>
				<tr>
					<th>
						<select>
							<option id="New">최신순</option>
							<option id="New">인기순</option>
							<option id="New">별점순</option>
						</select>
					</th>
					<th>
						<select>
	<!-- 						<option id="New">향종류</option> -->
							<option id="New">All</option>
							<option id="New">Citrus</option>
							<option id="New">Fruity</option>
							<option id="New">Floral</option>
							<option id="New">Spicy</option>
							<option id="New">Woody</option>
						</select>
					</th>
					<th><input type="text" placeholder="상품명 검색"><button>검색</button></th>
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
				<c:forEach items="${pList }" var="perfume" varStatus="i">
					<tr>
						<td class="td"><input type="checkbox" class="check" value="${perfume.perfumeNo }"></td>
						<td class="td">${i.count }</td>
						<td class="td"><img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="상품 이미지"></td>
						<td class="td">${perfume.perfumeBrand }</td>
						<td class="td"><a href="/perfume/mDetail?perfumeNo=${perfume.perfumeNo }">${perfume.perfumeName }</a></td>
						<td class="td">${perfume.perfumeVolume }ml</td>
						<td class="td">${perfume.perfumePrice }원</td>
						<td class="td">${perfume.perfumeQuantity }&nbsp;EA</td>
						<td class="td">${perfume.pScentCategory }</td>
						<td class="td">${perfume.pImageCategory }</td>
						<td class="td">
							<c:choose>
								<c:when test="${perfume.perfumeStatus eq 1}">O</c:when>
								<c:when test="${perfume.perfumeStatus eq 0}">X</c:when>
							</c:choose>
						</td>
						<td><button onclick="location.href='/perfume/modify?perfumeNo=' + ${perfume.perfumeNo}">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><button type="button" class="show">선택 노출</button></td>
					<td><button type="button" class="noShow">선택 비노출</button></td>
					<td><button type="button" class="del">삭제하기</button></td>
					<td><button type="button" onclick="location.href='/perfume/write'">상품 등록</button></td>
				</tr>
			</tfoot>
		</table>
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