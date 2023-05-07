<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="../../../resources/memberCss/bye.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

<form action="/member/bye" method="post">
<div class="content">
        <h1>회원탈퇴</h1>
        <div class="content_msg">
        	※ 탈퇴시 모든 정보가 삭제됩니다. <br>
        	※ 현재 로그인한 비밀번호를 입력 후 탈퇴버튼을 누르시면 탈퇴처리가 완료됩니다.
        </div>
        <input type="hidden"  name="memberId" value="${member.memberId }"/>
        <input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요" />
		<button type="submit" >탈퇴하기</button>
</div>
</form>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>