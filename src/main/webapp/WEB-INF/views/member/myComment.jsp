<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글</title>
<link rel="stylesheet" href="../../../resources/memberCss/myComment.css" />
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
        <h1>내가 작성한 댓글</h1>
        <table border="1">
            <thead>
                <!-- 테이블 헤더 -->
                <tr>
                    <th><input type="checkbox" name=""></th>
                    <th>내용</th>
                    <th>작성일</th>
                    
                </tr>
            </thead>
            <tbody>
            <!-- 테이블 본문 -->
            <tr>
              <td><input type="checkbox" name=""></td>
              <td>향수 패키지가 정말 예쁘네용</td>
              <td>2023-04-01</td>
            </tr>
            
            <tr>
              <td><input type="checkbox" name=""></td>
              <td>뻥이에요</td>
              <td>2023-04-01</td>
            </tr>
          </tbody>
        </table>
        <button>삭제</button>
      </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>