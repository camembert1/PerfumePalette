<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/commonCss/footer.css">
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->

	<!-- 유튜브 플레이어 -->
	<script async src="https://www.youtube.com/iframe_api"></script>

</head>
<footer>

	<div id="footer-left">

		<div id="footer-left-up">
			<img id="footer-logo" src="../../../resources/img/common/footer-logo-white.png" alt="">
			<div id="footer-txt">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>
				Maecenas blandit tincidunt odio, vitae gravida lorem porta vitae. <br>
				Vivamus maximus, erat non dictum viverra. <br>
				Nunc rhoncus magna diam. <br>
				Aenean quis ex et ligula congue tincidunt faucibus a est. <br>
				In pretium nulla nunc, consequat consectetur nisl cursus at. <br>
				Proin efficitur tempus quam et laoreet. <br>
				Duis nisi nisi, aliquam a quam egestas, semper consectetur ex.
			</div>
		</div>

		<div id="footer-left-down">
			<img id="footer-icon" src="../../../resources/img/common/footer-icon.png" alt="">
		</div>

	</div>

	<div id="footer-right">

		<div id="footer-right-up">
			<div id="footer-menu">
				<div onclick="location.href='/perfume/list'">SHOP <img src="../../../resources/img/common/shortcut-arrow.png" alt=""></div>
				<c:if test="${sessionScope.mbtiResult eq null }">
					<div onclick="location.href='/mbti/mbti'">RECOMMEND <img src="../../../resources/img/common/shortcut-arrow.png" alt=""></div>
				</c:if>
				<c:if test="${sessionScope.mbtiResult ne null }">
					<div onclick="location.href='/mbti/mbtiResult'">RECOMMEND <img src="../../../resources/img/common/shortcut-arrow.png" alt=""></div>
				</c:if>
				<div onclick="location.href='/review/reviewList'">REVIEW <img src="../../../resources/img/common/shortcut-arrow.png" alt=""></div>
				<div onclick="location.href='/qnaboard/list'">Q&A <img src="../../../resources/img/common/shortcut-arrow.png" alt=""></div>
			</div>
			<div id="footer-sns">
				<div>
					<img onclick="youtube()" src="../../../resources/img/common/facebook.png" alt="">
					<img onclick="youtube()" src="../../../resources/img/common/twitter.png" alt="">
					<img onclick="youtube()" src="../../../resources/img/common/instagram.png" alt="">
					<img onclick="youtube()" src="../../../resources/img/common/youtube.png" alt="">
				</div>
			</div>
		</div>
		<div id="footer-right-down">
			<div id="footer-info">
				<div class="footer-title"> Information. </div>


				<div><span>대표자: </span>이유정</div>
				<div><span>대표전화: </span>031-957-1615 <span>팩스: </span>031-878-7104</div>
				<div><span>주소: </span>서울특별시 중구 남대문로 120 그레이츠청계 3층 6NAMMAE</div>
			</div>
			
			<div id="footer-policy">
				<div class="footer-title"> 개인정보처리방침 </div>

				<div><span>개인정보책임관리자 : </span>현죽이형</div>
				<div>Copyright&copy;2023 6NAMMAE Group Co., Ltd. All Rights Reserved.</div>
			</div>
		


		</div>

	</div>
	


	<div id="youtube-area">

		<div id="youtube-modal-bg">
			<div id="youtube-modal">
				<div id="youtube-modal-close-btn" onclick="youtube()">×</div>
				<div id="muteYouTubeVideoPlayer">유튭모달창입니다</div>
			</div>
		</div>
	</div>
</footer>

<script>

	var player;
	
	function onYouTubePlayerAPIReady(){
		player = new YT.Player('muteYouTubeVideoPlayer', {
			videoId : 'JYbybEKfchc',
			playerVars : {
				autoplay : 1, 		// Auto-play the video on load
				controls : 1, 		// Show pause/play buttons in player
				//loop : 1, 			// Run the video in a loop
				// rel : 0,
				// start : 30,
				// end : 60,
				// showinfo : 0,
				// showinfo : 0, 		// Hide the video title
				// modestbranding : 1, // Hide the Youtube Logo
				// fs : 0, 			// Hide the full screen button
				// cc_load_policy : 0, // Hide closed captions
				// iv_load_policy : 3, // Hide the Video Annotations
				// autohide : 1		// Hide video controls when playing
			},
			events:{
				onReady:function(e){
					e.target.mute();
				}
			}
		});
	}

	// 채팅 버튼 눌렀을 때
	youtube = function() {

		// 모달창 여닫는 속도
		let modalSpeed = 200;

		if ($('#youtube-modal').css('display') === 'none') {
			// 모달창이 닫혀있다면 열기
			$("#youtube-modal").fadeIn(modalSpeed);
			$("#youtube-modal-bg").fadeIn(modalSpeed);
			$("body").css("overflow", "hidden");

		} else if ($('#youtube-modal').css('display') === 'block') {
			// 모달창이 열려있다면 닫기
			$("#youtube-modal").fadeOut(modalSpeed);
			$("#youtube-modal-bg").fadeOut(modalSpeed);
			// 메인화면에선 어차피 overflow hidden이라 바꾸면 안됨
			if (!pattern.test(curURL.slice(-6))) {
				$("body").css("overflow-y", "visible");
			}

		}
	}

	$(function() {
		let windowHeight = $(window).height();
		let footerHeight = windowHeight; // footer = 100vh니까
		let documentHeight = $(document).height();
		let direction = "";

		$(window).on('wheel', function(e) {
			direction = e.originalEvent.deltaY > 0 ? 'down' : 'up';
		});

		$(window).on('scroll', function() {
			let scrollPosition = $(window).scrollTop() + windowHeight;

			// console.log("문서 전체 높이 : " + documentHeight);
			// console.log("화면 높이 : " + windowHeight);
			// console.log("휠 방향 : " + direction);
			// console.log("현재 화면 가장 하단 위치 : " + scrollPosition);

			if (scrollPosition >= (documentHeight - footerHeight/4)) {
				// 마우스 휠을 내릴 떄 && 스크롤이 푸터 위치에 도달했을 때
				//$('html, body').animate({ scrollTop: documentHeight - windowHeight }, 500);
				$('header').fadeOut(300);
				
			} else {
				// 마우스 휠을 올릴 때 && 스크롤이 푸터 위치를 벗어났을 때
				//$('html, body').animate({ scrollTop: documentHeight - windowHeight - footerHeight }, 500);
				$('header').fadeIn(300);
			}
		});
	});

	
</script>