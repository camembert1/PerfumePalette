<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세</title>
	</head>
	<body>
		<div class="container">
			<div>
				<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="상품 이미지">
				
			</div>
			<div>
				브랜드 : ${perfume.perfumeBrand } <br>
				제품명 : ${perfume.perfumeName } <br>
				가격 : ${perfume.perfumePrice } <br>
				용량 : ${perfume.perfumeVolume } <br>
				
			</div>
			<div>
				<c:url var="pModify" value="/perfume/modify">
					<c:param name="perfumeNo" value="${perfume.perfumeNo }"></c:param>
				</c:url>
				<a href="${pModify }">수정하기</a>
				<a href="/perfume/mList">목록보기</a>
				<a href="javascript:void(0);" onclick="removeCheck(${perfume.perfumeNo });">삭제하기</a>
				
			</div>
		</div>
		<script>
			function removeCheck(perfumeNo){
				if(confirm("정말 삭제하시겠습니까?")) {
					location.href="/perfume/remove?perfumeNo=" + perfumeNo;
				}
			}
		</script>
	</body>
</html>