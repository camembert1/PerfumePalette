<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/commonCss/header.css">
</head>
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
				
				<!-- 관리자가 아니라면 마이페이지 -->
				<c:if test="${sessionScope.member ne 'admin' }">
					<div onclick="location.href='#'">${sessionScope.nickname }'s MyPage</div>
				</c:if>
				
				<!-- 관리자가 맞다면 관리자페이지 -->
				<c:if test="${sessionScope.member eq 'admin' }">
					<div onclick="location.href='#'">Manager Page</div>
				</c:if>

			</c:if>

		</div>

	</div>
	
</header>

