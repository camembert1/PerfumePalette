<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆 - 𝑴𝑩𝑻𝑰</title>

        <link rel="stylesheet" href="../../../resources/commonCss/mbtiResult.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <!-- favicon : 탭에 보이는 아이콘 -->
        <link rel="icon" href="../../../resources/img/common/favicon.png" />
        <link rel="apple-touch-icon" href="../../../resources/img/common/favicon.png" />

    </head>
    <body>

        <jsp:include page="../common/header.jsp" />
        <main>
            <!-- 헤더 부분 피하기 위한 div -->
            <div id="forHeader"></div>
            <!-- 본문 내용 가운데 정렬 위한 div -->
            <div id="forCenter">
                <!-- 여기부터 내용 입력하시면 됩니다! -->
                <h1>${sessionScope.nickname }</h1>
                <h1>${sessionScope.member }</h1>
                <!-- 비로그인상태라면 -->
                <c:if test="${sessionScope.member eq null }"></c:if>

                <!-- 로그인상태라면 -->
                <c:if test="${sessionScope.member ne null }">
                    <h1>${sessionScope.nickname }님의 MBTI는 ${mbtiResult }입니다.!</h1>
                    <a href="/mbti/mbti">다시검사하기</a>
                </c:if>

            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

        

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