<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mbti결과</title>
</head>
<body>
	<h1>${sessionScope.nickname }</h1>
	<h1>${sessionScope.member }</h1>
    <!-- 비로그인상태라면 -->
    <c:if test="${sessionScope.member eq null }"></c:if>

    <!-- 로그인상태라면 -->
    <c:if test="${sessionScope.member ne null }">
        <h1>${sessionScope.nickname }님의 MBTI는 ${mbtiResult }입니다.!</h1>
        <a href="/member/mbti">다시검사하기</a>
    </c:if>

    <script>
        if("${sessionScope.nickname }" == "") {
        	alert("결과 확인을 위해선 로그인이 필요합니다");
            location.href = "/member/login";
        } else {
            alert("예비 결과입니다.")
            // questions[currentQuestion].classList.remove("current");
            // $("#result h1").append("${loginUser.memberName }님의 MBTI는 " + mbtiResult + "입니다.");
        }
    </script>
</body>
</html>