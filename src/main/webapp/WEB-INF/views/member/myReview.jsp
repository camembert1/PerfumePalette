<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 후기</title>
<link rel="stylesheet" href="../../../resources/memberCss/myReview.css" />
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
      <div id="forCenter"></div>
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
        <h1>내가 작성한 후기</h1>
        <table border="1">
            <thead>
                <!-- 테이블 헤더 -->
                <tr>
                	<th><input type="checkbox" name="allCheck" ></th>
                    <th>제품명</th>
                    <th>상품평</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${myReviews }" var="review" >
            	<tr>
            		<td><input type="checkbox" class="check"  value="${review.reviewNo}"></td>
            		<td>[${review.perfumeBrand }] ${review.perfumeName }</td>
            		<c:set var="str" value="${review.reviewContents }"/>
					<c:set var="result" value="${fn:replace(str, '^.*?>', '')}"/>
					<c:set var="result" value="${fn:replace(result, '<.*$', '')}"/>
            		<td>${result }</td>
            		<td><fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd" /></td>
            		<td>${review.rViewcount }</td>
            	</tr>
            </c:forEach>            
            	<tr>
            		<td><input type="checkbox" class="check"></td>
            		<td>
            			<a href="">[디올] 옴므 코롱 어쩌고</a>
            		</td>
            		<td>디지버지게 좋네요</td>
            		<td>4444-44-44</td>
            		<td>44</td>
            	</tr>
          </tbody>
        </table>
        <button class="btn" class="del">선택삭제</button>
      </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
    
    
    <script>
    // 체크박스 - 전체선택  
	var allCheck = document.querySelector(".allCheck");
	var list = document.querySelectorAll(".check");
	allCheck.onclick = () => {
		if(allCheck.checked) {
			for(var i = 0; i < list.length; i++) {
				list[i].checked = true;
			}
		} else {
			for(var i = 0; i < list.length; i++) {
				list[i].checked = false;
			}
		}
	}
	
	// 선택 삭제 버튼 
	
	
	
    </script>
</body>
</html>