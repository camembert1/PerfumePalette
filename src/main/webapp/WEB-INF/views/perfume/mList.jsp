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
					<th><input type="checkbox" class="checkBox-"></th>
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="perfume" varStatus="i">
					<tr>
						<td class="td"><input type="checkbox" class="checkBox_"></td>
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
			<tbody>
				<tr>
					<td><button>선택 노출</button></td>
					<td><button>선택 비노출</button></td>
					<td><button>선택 삭제하기</button></td>
					<td><button type="button" onclick="location.href='/perfume/write'">상품 등록</button></td>
				</tr>
			</tbody>
		</table>
		<script>
		$(document).ready(function() {
	        $('.checkBox-').change(function() {
	            if ($(this).is(":checked")) {
	                $('.checkBox_').prop('checked', true);
	            } else {
	                $('.checkBox_').prop('checked', false);
	            }
	        });
	    });
		</script>
	</body>
</html>