<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
		
		<link rel="stylesheet" href="../../resources/commonCss/home.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		
		<!-- favicon : 탭에 보이는 아이콘 -->
		<link rel="icon" href="../../resources/img/common/favicon.png"/>
		<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png"/>	
	</head>
	<body>
		<jsp:include page="./common/header.jsp" />
		
		<main>
			<!-- 헤더 부분 피하기 위한 div -->
			<div></div>
			<!-- 
				여기부터 내용 입력하시면 됩니다.
			-->
			<!-- 여기부터 본문 시작! -->
			<section id="section-1">
				<div id="background-img">
					<div id="black">
						<c:if test="${sessionScope.mbtiResult eq null }">
							<div onclick="location.href='/member/mbti'">MBTI</div>
						</c:if>
						<c:if test="${sessionScope.mbtiResult ne null }">
							<div onclick="location.href='/member/mbtiResult'">MBTI</div>
						</c:if>
					</div>
				</div>
			</section>
			<section id="section-2">
				<h1 style="text-align: center">향수 사진 5개 딱!?</h1>
			</section>
		</main>

		<jsp:include page="./common/footer.jsp" />

	</body>
</html>