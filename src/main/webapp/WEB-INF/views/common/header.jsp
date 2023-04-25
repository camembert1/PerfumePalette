<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/commonCss/header.css">
<!-- 실시간 채팅 소켓에 사용 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
							<div onclick="location.href='/member/myPage'">${member.memberNickname }님마이페이지</div>
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
				<span id="chat-modal-close-btn" onclick="chat()">×</span>
				<div id="helloMsg">
					<img alt="logo" src="../../resources/img/common/perfume.png">
					<p>Perfume Palette에 문의하기</p>
					<p>️월요일 09:00부터 운영</p>
				</div>
				<div id="chat-real">
					<form id="chatForm">
						<div class="chat_main">
							<div class="modal-header" style="padding: 5px 0">상담 CHAT</div>
							<div class="modal-content" style="padding: 5px 0" id="chat"></div>
							<div class="modal-footer">
								<input type="text" id="message" class="form-control" placeholder="메세지를 입력하세요" />
								<button id="sendBtn">Send</button>
								<button id="closeBtn">연결 종료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>

<script>
	//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
	var socket = null;
	$(document).ready(function() {
		if (${sessionScope.member ne null }){
			connectWS();
		}
	});
	
	$("#closeBtn").click(function() {
	    socket.close();
	});

	function connectWS() {
		var sock = new SockJS("/echo");
		socket = sock;
		sock.onopen = function() {
			console.log('info: connection opened.');
		};
		sock.onmessage = function(e) {
		    var strArray = e.data.split(":");
		    if(e.data.indexOf(":") > -1){
		        $(".modal-header").text(strArray[0]+"님이 메세지를 보냈습니다.");
		    }
		    else{
		    }
		    $("#chat").append(e.data + "<br/>");
		}
		sock.onclose = function() {
			$("#chat").append("연결 종료 ");
			/* 웹소켓을 재연결하는 코드 삽입 */
			/* setTimeout(function(){connectWS();}, 10000); */

		}
		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

		$("#chatForm").submit(function(event) {
			event.preventDefault();
			sock.send($("#message").val());
			$("#message").val('').focus();
		});
	}
	
	
	
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
			$("#chat-btn").css("display", "none");

		} else if ($('#chat-modal').css('display') === 'block') {
			// 모달창이 열려있다면 닫기
			$("#chat-modal").fadeOut(modalSpeed);
			$("#chat-modal-bg").fadeOut(modalSpeed);
			$("#chat-btn").css("display", "flex");
			// 메인화면에선 어차피 overflow hidden이라 바꾸면 안됨
			if (!pattern.test(curURL.slice(-6))) {
				$("body").css("overflow-y", "visible");
			}

		}
	}
</script>