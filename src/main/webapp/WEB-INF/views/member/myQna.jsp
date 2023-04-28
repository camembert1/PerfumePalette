<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 문의</title>
<link rel="stylesheet" href="../../../resources/memberCss/myQna.css" />
<!-- favicon : 탭에 보이는 아이콘 -->
    <link rel="icon" href="../../resources/img/common/favicon.png" />
    <link
      rel="apple-touch-icon"
      href="../../resources/img/common/favicon.png"
    />
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <main>
      <!-- 헤더 부분 피하기 위한 div -->
      <div id="forHeader"></div>
      <!-- 본문 내용 가운데 정렬 위한 div -->
      <div id="forCenter">
        <!-- 사이드바 -->
        <div id="hrefList">
          <div id="hrefName">${member.memberName }님</div>
          <span><a href="/member/myPage">마이페이지</a></span>
          <span><a href="/member/orderList">주문내역조회</a></span>
          <span><a href="/member/myReview">작성후기</a></span>
          <span><a href="/member/myQna">작성문의</a></span>
          <span><a href="/member/myComment">작성댓글</a></span>
          <span><a href="/member/bye">회원탈퇴</a></span>
        </div>

        <!-- 여기부터 내용 입력하시면 됩니다! -->

<div class="content">
        <h1>내가 작성한 문의</h1>
        <table border="1">
            <thead>
                <!-- 테이블 헤더 -->
                <tr>
                    <th><input type="checkbox" name="allCheck" ></th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>답변 상태</th>
                </tr>
            </thead>
            <tbody>
            <!-- 테이블 본문 -->
            <c:forEach items="${myQna }" var="qna" >
            	<tr>
            		<td><input type="checkbox" class="check"  value="${qna.qnaNo}"></td>
            		<td>
            			<c:if test="${qna.qnaType == 1 }">상품문의</c:if>
	                    <c:if test="${qna.qnaType == 2 }">배송문의</c:if>
	                    <c:if test="${qna.qnaType == 3 }">교환/환불</c:if>
	                    <c:if test="${qna.qnaType == 4 }">기타문의</c:if>
	                </td>
            		<td>${qna.qnaSubject }</td>
            		<td><fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
            		<td>
            			<c:if test="${qna.qQnaNo eq null}">대기</c:if>
	                    <c:if test="${qna.qQnaNo ne null}">완료</c:if>
	                 </td>
            	</tr>
            </c:forEach>  
          </tbody>
        </table>
        <button class="btn" class="del">선택삭제</button>
      </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>