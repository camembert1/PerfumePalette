<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/commonCss/header.css">
</head>
<header>
	<div id="logo-area">
		<div id="logo-img" onclick="location.href='/'"></div>
	</div>

	<div id="navBar-area">

		<div id="nav-left">
			<div class="nav-left-title">
				<div>Perfume</div>
				<div class="nav-left-hidden">
					<div class="nav-left-bar"></div>
					<div class="nav-left-detail">
						<div>Shop</div>
						<div>Recommend</div>
					</div>
				</div>
			</div>

			<div class="nav-left-title">
				<div>Community</div>
				<div class="nav-left-hidden">
					<div class="nav-left-bar"></div>
					<div class="nav-left-detail">
						<div>Review</div>
						<div>Q&A</div>
					</div>
				</div>
			</div>
		</div>

		<div id="nav-right">


			<!-- 비로그인 상태 -->
			<c:if test="${sessionScope.member eq null }">
				<div onclick="location.href='/member/enroll'"><img src="../../../resources/img/common/user.png"
						alt=""></div>
				<div onclick="location.href='/member/login'"><img src="../../../resources/img/common/login.png"
						alt=""></div>
			</c:if>

			<!-- 로그인 상태 -->
			<c:if test="${sessionScope.member ne null }">

				<!-- 관리자가 아니라면 마이페이지 -->
				<c:if test="${sessionScope.member ne 'admin' }">
					<div id="alert-hover-area">
						<img onclick="location.href='/member/myPage/${sessionScope.member}'" src="../../../resources/img/common/user.png" alt="">

						<div id="alert">
							<div onclick="location.href='/member/myPage/${sessionScope.member}'">
								${sessionScope.nickname }님 마이페이지</div>

						</div>

					</div>
				</c:if>

				<!-- 관리자가 맞다면 관리자페이지 -->
				<c:if test="${sessionScope.member eq 'admin' }">
					<div onclick="location.href='#'">Manager Page</div>
				</c:if>

				<div onclick="location.href='/member/logout'"><img src="../../../resources/img/common/logout.png"
						alt=""></div>

			</c:if>


			<div><img src="../../../resources/img/common/cart.png" alt=""></div>
			<div><img src="../../../resources/img/common/wish.png" alt=""></div>

		</div>

	</div>
</header>