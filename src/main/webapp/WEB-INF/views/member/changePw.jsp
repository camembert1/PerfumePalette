<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../../../resources/memberCss/changePw.css">
<!-- favicon : 탭에 보이는 아이콘 -->
   <link rel="icon" href="../../resources/img/common/favicon.png" />
   <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			
			<form action="/member/changePw" method="post" >
			<h1>비밀번호 변경</h1>
			<input type="hidden" name="memberId" value="${member.memberId}">
			
			<div class="contentBox">
				<div class="input-box">
					<label for="newPw" class="contentLabel">비밀번호</label>
					<input type="password" name="newPw" required>
				</div>
				
				<div class="input-box">
					<label for="confirmPw" class="contentLabel">비밀번호 확인</label>
					<input type="password" name="confirmPw">
				</div>
			</div>
			<button type="submit">비밀번호 변경</button>
			</form>
			
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>

		
	</script>

</body>
</html>