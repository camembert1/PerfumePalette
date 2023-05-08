<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆 - 𝑴𝑩𝑻𝑰</title>

        <link rel="stylesheet" href="../../../resources/commonCss/mbtiResult.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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
                <!-- 로그인상태라면 -->
                <c:if test="${sessionScope.member ne null }">

                    <div>
                        <div>${member.memberNickname }님의 MBTI는 ${mbtiResult }입니다!</div>

                        <div id="mbti">${mbtiResult }</div>
                        
                        <div id="perfumeImg-area">
                            <img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
                        </div>
                        
                        <div>
                            <span>${perfume.perfumeBrand }</span>
                            <span>${perfume.perfumeName }</span>
                        </div>

                        <div id="hashTags"></div>
                    </div>

                    
                    <div id="btn-area">
                        <div onclick="location.href='/perfume/detail/${perfume.perfumeNo }'">사러가기</div>
                        <div onclick="location.href='/mbti/mbti'">다시 검사하기</div>
                    </div>







                </c:if>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

        

        <script>
            if("${member.memberId }" == "") {
                alert("결과 확인을 위해선 로그인이 필요합니다");
                location.href = "/member/login";
            }
        </script>
    </body>
</html>