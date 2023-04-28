<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
main img {
width: 98%;
margin: auto;
    display: block;
   margin-bottom: 10px;
}
</style>
<link rel="stylesheet" href="../../../resources/memberCss/login.css">

<!-- favicon : 탭에 보이는 아이콘 -->
   <link rel="icon" href="../../resources/img/common/favicon.png" />
   <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		
		<!-- 본문 내용 가운데 정렬 위한 div, 안에다가 모든 내용 입력 -->
		<div id="forCenter">
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<form action="/member/login" method="post">

				<c:if test="${sessionScope.mbtiResult ne null }">
					<input type="hidden" name="returnUrl" value="/member/mbtiResult">
				</c:if>
				<c:if test="${sessionScope.mbtiResult eq null }">
					<input type="hidden" name="returnUrl" value="">
				</c:if>
		
				<h1>로그인</h1>
	
				<div id="input-main">
					<div class="input-box">
						<input type="text" name="memberId" placeholder="아이디를 입력해주세요"
							required autofocus>
					</div>
					<div class="input-box">
						<input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요"
							required>
					</div>
				</div>
	
				<div id="input-find">
					<a href="/member/findId">아이디 찾기</a> <span>|</span> <a href="/member/findPw">비밀번호 찾기</a>
				</div>
	
				<div class="input-btn">
					<button type="submit">
						<span>로그인</span>
					</button>
				</div>
				<div class="input-btn">
					<button type="submit" onclick="location.href='/member/enroll'">
						<span>회원가입</span>
					</button>
				</div>
	
				<br><br>
	
				<h2>SNS 로그인</h2>
	
				<div class="input-btn">
					<div class="kakaoBtn">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=59c4b66fb0ac37a154ec85db3a5e6f99&redirect_uri=	
http://localhost:8080/kakaoLogin&response_type=code">
							<img src="../../../resources/img/member/kakao_login_btn.png">
						</a>
					</div>
					<button type="button">
						<span>네이버 계정으로 로그인</span>
					</button>
				</div>
			</form>
		</div>
		
	</main>
	<jsp:include page="../common/footer.jsp" />

	
</body>

<script>

</script>
	

</html>