<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="../../../../resources/adminCss/adReviewCss/list.css">
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon"
	href="../../resources/img/common/favicon.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>

</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">

			<!-- 사이드바 -->
			<div id="hrefList">
				<div id="hrefName">${sessionScope.member.memberName }님</div>
				<span><a href="/perfume/mList">판매상품관리</a></span> 
				<span><a href="#">주문내역관리</a></span> 
				<span><a href="/admin/member/amList">회원관리</a></span>
				<span><a href="/admin/qna/list">문의관리</a></span> 
				<span><a href="/admin/review/list">후기관리</a></span>
			</div>

			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<div id="subject"></div>
			<h1>문의 관리</h1>
			<form action="/admin/qna/search" method="get">
				<select name="searchCondition">
					<option value="All">전체</option>
					<option value="subject">제목</option>
					<option value="contents">내용</option>
				</select> 
				<input type="text" name="searchValue" placeholder="검색어를 입력해주세요.">
				<button type="submit" class="small_btn">검 색</button>
			</form>
			<table class="table">
				<thead>
	                <tr>
	                	<th><input type="checkbox" class="allCheck"></th>
	                    <th width="120px">번호</th>
	                    <th width="120px">구분</th>
	                    <th width="540px">제목</th>
	                    <th width="180px">작성일</th>
	                    <th width="120px">작성자</thw>
	                    <th width="120px">상태</th>
	                </tr>
                </thead>
                <tbody>
	                <c:forEach items="${qList }" var="qnaboard" varStatus="i">
	                    <tr>
	                    	<td><input type="checkbox" class="check" value="${qnaboard.qnaNo }"></td>
	                        <td>${i.count }</td>
	                        <td>
	                            <c:if test="${qnaboard.qnaType == 1 }">상품문의</c:if>
	                            <c:if test="${qnaboard.qnaType == 2 }">배송문의</c:if>
	                            <c:if test="${qnaboard.qnaType == 3 }">교환/환불</c:if>
	                            <c:if test="${qnaboard.qnaType == 4 }">기타문의</c:if>
	                        </td>
	                        <%-- <c:url var="qDetail" value="/qnaboard/detail">
	                            <c:param name="qnaNo" value="${qnaboard.qnaNo }"></c:param>
	                            </c:url> --%>
	                            <td><a href="/qnaboard/detail?qnaNo=${qna.qnaNo}"> ${qnaboard.qnaSubject }</a>
	                            </td>
	                            <td>${qnaboard.qnaDate }</td>
	                            <td>${qnaboard.memberNickname }</td>
	                            <td>
	                                <c:if test="${qnaboard.qQnaNo eq null}">답변대기</c:if>
	                                <c:if test="${qnaboard.qQnaNo ne null}">답변완료</c:if>
	                            </td>
	                    </tr>
	                </c:forEach>
                </tbody>
                <tfoot>
                	<tr>
						<td><button type="button" class="del">삭제하기</button></td>
					</tr>
	                <tr>
	                    <td colspan="7" class="line">
	                        <a href="" class="page"> &lt;&lt;</a>
	                        <a href="" class="page"> &lt;</a>
	                        <a href="" class="number page">1</a>
	                        <a href="" class="number page">2</a>
	                        <a href="" class="number page">3</a>
	                        <a href="" class="number page">4</a>
	                        <a href="" class="number page">5</a>
	                        <a href="" class="page">&gt;</a>
	                        <a href="" class="page">&gt;&gt;</a>
	                    </td>
	                </tr>
                </tfoot>
            </table>
		</div>
	</main>
	<script>
		// 전체 선택 박스
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
		
		// 선택 삭제 
		document.querySelector(".del").addEventListener('click', function() {
			var del = new Array();
			var list = document.querySelectorAll(".check");
			for(var i = 0; i < list.length; i++) {
				if(list[i].checked) {
					del.push(list[i].value);
				}
			}
			console.log(del);
			if(confirm("정말 삭제 하시겠습니까?")) {
				$.ajax({
					url:'/admin/qna/aqRemove',
					type : 'post',
					dataType : 'json',
					traditional : 'true',
					data : {'arr':del},
					success : function(data){
						if(data == 1) {
							alert("삭제되었습니다!");
							location.href = "/admin/qna/list";
						}
					},
					error : function(data) {
						console.log(data)
					}
				});
			}
		});
	</script>
</body>
</html>