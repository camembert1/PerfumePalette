<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../../../resources/memberCss/login.css">
</head>

<body>
	<form action="/member/login" method="post">
		<div id="outter">
			<c:if test="${sessionScope.mbtiResult ne null }">
				<input type="hidden" name="returnUrl" value="/member/mbtiResult">
			</c:if>
			<c:if test="${sessionScope.mbtiResult eq null }">
				<input type="hidden" name="returnUrl" value="">
			</c:if>
			<div id="inner">
				<h2>로그인</h2>
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
				<br>
				<h2>SNS 로그인</h2>
				<div class="input-btn">
					<button type="button">
						<span>카카오 원터치 로그인/회원가입</span>
					</button>
					<button type="button">
						<span>네이버 계정으로 로그인</span>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>

</html>