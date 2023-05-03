<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

        <link rel="stylesheet" href="../../../resources/perfumeShopCss/detail.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <!-- favicon : 탭에 보이는 아이콘 -->
        <link rel="icon" href="../../resources/img/common/favicon.png" />
        <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
    </head>
    <body>
        <h1>알림창 테스트 페이지</h1>
        <!-- 비로그인 상태 -->
        <c:if test="${sessionScope.member eq null }">
            <a href="/member/login">로그인</a>
        </c:if>

        <!-- 로그인 상태 -->
        <c:if test="${sessionScope.member ne null }">
            <a href="/member/myPage">${member.memberNickname}님마이페이지</a>
            <a href="/member/logout">로그아웃</a>
        </c:if>

        <h1>안 읽은 알림 개수 : <span id="alertCnt">${aCnt}</span></h1>

        <c:forEach items="${aList}" var="a" varStatus="i">
            <div style="display: flex; cursor: pointer;" onclick="clickAlert('${a.alertNo}', this)">
                <div style="
                            width: 70px;
                            font-weight: 900;
                            margin-right: 10px;
                            display: flex;
                            justify-content: space-between;">
                    <div>[</div>
                    <div class="alertCategory">${a.alertCategory}</div>
                    <div>]</div>
                </div>
                <c:choose>
                    <c:when test="${a.alertCategory eq '재입고'}">
                        <input type="hidden" class="perfumeNo" value="${a.perfumeNo}">
                        <div>[${a.perfumeBrand}] ${a.perfumeName}이(가) 재입고되었습니다.</div>
                    </c:when>
                    <c:when test="${a.alertCategory eq '좋아요'}">
                        <input type="hidden" class="reviewNo" value="${a.reviewNo}">
                        <div>${a.reviewContents}...에 ${a.likeMemberNickname}님이 좋아요를 눌렀습니다.</div>
                    </c:when>
                    <c:when test="${a.alertCategory eq '댓글'}">
                        <input type="hidden" class="reviewNo" value="${a.reviewNo}">
                        <div>${a.reviewContents}에 댓글이 달렸습니다.</div>
                    </c:when>
                    <c:when test="${a.alertCategory eq '답댓글'}">
                        <input type="hidden" class="reviewNo" value="${a.reviewNo}">
                        <div>${a.pCommentContent}에 답댓글이 달렸습니다.</div>
                    </c:when>
                </c:choose>
            </div>
        </c:forEach>


        <script>
            clickAlert = function(alertNo, tag) {
                $.ajax({
                    url: '/perfume/clickAlert'
                    , type: 'POST'
                    , data: {
                        'alertNo': alertNo
                    }
                }).done(function(result) {
                    if(result == 1) {
                        
                        $(tag).fadeOut(200);
                        $('#alertCnt').html(parseInt($('#alertCnt').html()) - 1);

                        let alertCategory = $(tag).find('.alertCategory').html();
                        if (alertCategory == '재입고') {
                            location.href = '/perfume/detail/' + $(tag).find('.perfumeNo').val();
                        } else {
                            location.href = '/review/reviewDetail/' + $(tag).find('.reviewNo').val();
                        }                        
                    }
                });
            }
        </script>
    </body>
</html>