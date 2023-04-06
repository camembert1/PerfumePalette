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
		<header>
		
			<div id="logo-area">
				<img src="../../../resources/img/common/logo_white.png" alt="logo_white" onclick="location.href='/'">
			</div>
			<div id="navBar-area">
		
				<div id="nav-left">
		
					<div class="nav-left-title">
						<div>Perfume</div>
						<div class="nav-left-hidden">
							<div class="nav-left-bar"></div>
							<div class="nav-left-detail">
								<div>shop</div>
								<div>recommend</div>
							</div>
						</div>
					</div>
		
					<div class="nav-left-title">
						<div>Community</div>
						<div class="nav-left-hidden">
							<div class="nav-left-bar"></div>
							<div class="nav-left-detail">
								<div>review</div>
								<div>qna</div>
							</div>
						</div>
					</div>
		
					<div></div>
				</div>
		
				<div id="nav-right">
					<div>Cart</div>
					<div>Wish</div>
					<!-- 비로그인 상태 -->
					<c:if test="${sessionScope.member eq null }">
						<div onclick="location.href='/member/login'">Login</div>
						<div onclick="location.href='/member/enroll'">Join</div>
					</c:if>
		
					<!-- 로그인 상태 -->
					<c:if test="${sessionScope.member ne null }">
						<div onclick="location.href='/member/logout'">Logout</div>
						<div onclick="location.href='#'">Alert</div>
						
						<!-- 관리자가 아니라면 마이페이지 -->
						<c:if test="${sessionScope.member ne 'admin' }">
							<div onclick="location.href='/member/myPage/${sessionScope.member}'">${sessionScope.nickname }'s MyPage</div>
						</c:if>
						
						<!-- 관리자가 맞다면 관리자페이지 -->
						<c:if test="${sessionScope.member eq 'admin' }">
							<div onclick="location.href='#'">Manager Page</div>
						</c:if>
		
					</c:if>
		
				</div>
		
			</div>
			
		</header>
		
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