<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../../../resources/memberCss/orderList.css">
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
      
      <h1>주문조회</h1>
     
      <table border="1">
        <thead> 
        <!-- 테이블 헤더 -->
            <tr>
                <th>주문번호</th>
                <th>제품명</th>
                <th>가격</th>
                <th>주문처리상태</th>
                <th>후기작성</th>
            </tr>
        </thead>
        <tbody>
        <!-- 테이블 본문 -->
            <tr>
                <td>1234567</td>
                <td>
                		<a href="">딥디크 어쩌고</a>
                </td>
                <td>10,000,000원</td>
                <td>배송 완</td> 
                <td>
                	<button onclick = "location.href = '/review/reviewWrite'">후기작성</button>
                </td>
            </tr>
            
            <tr>
                <td>444444</td>
                <td>
                		<a href="">디올옴므</a>
                </td>
                <td>9,000,000원</td>
                <td>배송 완</td> 
                <td>
                	<button>후기작성</button>
                </td>
            </tr>
            </tbody>
            </table>
      </div>
      
      
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>