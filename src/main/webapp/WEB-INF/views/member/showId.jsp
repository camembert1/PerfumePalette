<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 출력 페이지</title>
<link rel="stylesheet" href="../../../resources/memberCss/showId.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<main>
		<div id="forHeader"></div>
		<div id="forCenter">
			<div class="mainContent">
			<h1>아이디 찾기</h1>
			<div>회원님 아이디 찾기가 완료되었습니다.</div>
			<div class="input-box">
				<input type="text" name="memberId" value="${member.memberId} " readonly>
			</div>
			<div class="input-btn">
				<button type="button" onclick="location.href='/member/login'">로그인</button>
			</div>
		</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>