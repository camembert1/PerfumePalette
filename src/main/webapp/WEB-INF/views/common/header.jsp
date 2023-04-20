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
					<div style="width: 150px; background-color: rgba(255, 255, 255, 0);"></div>
					<div class="nav-left-detail">
						<div onclick="location.href='/perfume/list'">Shop</div>
						<div>Recommend</div>
					</div>
				</div>
			</div>

			<div class="nav-left-title">
				<div>Community</div>
				<div class="nav-left-hidden">
					<div class="nav-left-bar"></div>
					<div style="width: 150px; background-color: rgba(255, 255, 255, 0);"></div>
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
				<div onclick="location.href='/member/enroll'">
				<img src="../../resources/img/common/user.png" alt="">
				<div class="menu-info">회원가입</div>
				</div>
				<div onclick="location.href='/member/login'">
				<img src="../../resources/img/common/login.png" alt="">
				<div class="menu-info">로그인</div>
				</div>
			</c:if>

			<!-- 로그인 상태 -->
			<c:if test="${sessionScope.member ne null }">

				<!-- 관리자가 아니라면 마이페이지 -->
				<c:if test="${member.memberId ne 'admin' }">
				<div id="alert-hover-area">
					<img src="../../resources/img/common/user.png" alt="">

					<div id="alert">
						<div onclick="location.href='/member/myPage'">${member.memberNickname }님 마이페이지</div>
					</div>

				</div>
				</c:if>

				<!-- 관리자가 맞다면 관리자페이지 -->
				<c:if test="${member.memberId eq 'admin' }">
				<div onclick="location.href='#'">Manager Page</div>
				</c:if>

				<div onclick="location.href='/member/logout'">
				<img src="../../resources/img/common/logout.png" alt="">
				<div class="menu-info">로그아웃</div>
				</div>

			</c:if>

			<div>
				<img src="../../resources/img/common/cart.png" alt="" onclick="location.href = '/cart/list'">
				<div class="menu-info">장바구니</div>
			</div>
			<div>
				<img src="../../resources/img/common/wish.png" alt="" onclick="location.href = '/wish/list'">
				<div class="menu-info">찜</div>
			</div>

		</div>
	</div>

	<div id="chat-area">

		<div onclick="chat()" id="chat-btn">
			<img src="../../resources/img/common/chat-white.png" alt="">
		</div>

		<div id="chat-modal-bg">
			<div id="chat-modal">
				<div id="chat-modal-close-btn" onclick="chat()">×</div>
				<div id="chat-real"><h1>채팅창입니다</h1>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br>채팅창입니다<br></div>
			</div>
		</div>
	</div>
</header>

<script>
	let curURL = window.location.href;
	const pattern = /:\d{4}\//;
	
	// 채팅 버튼 눌렀을 때
	chat = function() {

		// 모달창 여닫는 속도
		let modalSpeed = 200;

		if ($('#chat-modal').css('display') === 'none') {
			// 모달창이 닫혀있다면 열기
			$("#chat-modal").fadeIn(modalSpeed);
			$("#chat-modal-bg").fadeIn(modalSpeed);
			$("body").css("overflow", "hidden");
		
		} else if ($('#chat-modal').css('display') === 'block') {
			// 모달창이 열려있다면 닫기
			$("#chat-modal").fadeOut(modalSpeed);
			$("#chat-modal-bg").fadeOut(modalSpeed);
			// 메인화면에선 어차피 overflow hidden이라 바꾸면 안됨
			if (!pattern.test(curURL.slice(-6))) {
				$("body").css("overflow-y", "visible");
			}

		}
	}


	// $('.nav-left-title').find('div:eq(0)').hover(function() {

	// 	$('.nav-left-hidden').fadeIn(200);

	// 	$('.nav-left-bar').css({
	// 		'transition-duration': '0.4s',
	// 		'width': '150px'
	// 	});

	// 	$('#nav-left').css({
	// 		'transition-duration': '0.4s',
	// 		'height': '155px'
	// 	});

	// }, function() {

	// 	$('.nav-left-hidden').fadeOut(200);

	// 	$('.nav-left-bar').css({
	// 		'transition-duration': '0.4s',
	// 		'width': '0px'
	// 	});

	// 	$('#nav-left').css({
	// 		'transition-duration': '0.4s',
	// 		'height': '50px'
	// 	});
	// });
</script>