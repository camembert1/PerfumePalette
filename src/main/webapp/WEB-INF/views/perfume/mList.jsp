<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>향수 리스트 관리자 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
					<th>노출 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="perfume" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td><a href="/perfume/mDetail?perfumeNo=${perfume.perfumeNo }">${perfume.perfumeName }</a></td>
						<td>${perfume.perfumeBrand }</td>
						<td>
							<c:choose>
								<c:when test="${perfume.perfumeStatus eq 1}">O</c:when>
								<c:when test="${perfume.perfumeStatus eq 0}">X</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script>
			
		</script>
	</body>
</html>