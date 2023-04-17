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
		
	</head>

	<body>
		<jsp:include page="../common/header.jsp" />
		<main>
        <!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>

        <!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
            
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<h3>perfumeNo : ${perfume.perfumeNo}</h3>
			<h3>perfumeName : ${perfume.perfumeName}</h3>
			<h3>perfumeBrand : ${perfume.perfumeBrand}</h3>

			<h3>perfumeVolume : ${perfume.perfumeVolume}</h3>
			<h3>perfumePrice : ${perfume.perfumePrice}</h3>
			<h3>perfumeQuantity : ${perfume.perfumeQuantity}</h3>

			<h3>pScentCategory : ${perfume.pScentCategory}</h3>
			<h3>pImageCategory : ${perfume.pImageCategory}</h3>
			<h3>perfumeDate : ${perfume.perfumeDate}</h3>

			<div>
                <img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
            </div>


		</div>
		</main>
		<jsp:include page="../common/footer.jsp" />

		
		

		<script>

		</script>

	</body>

	</html>