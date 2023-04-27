<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>상품 문의</title>
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
				integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
				crossorigin="anonymous"></script>
			<script src="https://kit.fontawesome.com/092e4e45af.js" crossorigin="anonymous"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
			<link rel="stylesheet" href="../../../../resources/qnaCss/qnaBoardlist.css">
			<!-- favicon : 탭에 보이는 아이콘 -->
			<link rel="icon" href="../../resources/img/common/favicon.png" />
			<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />


		</head>

		<body>
			<jsp:include page="../common/header.jsp" />
			<main>
				<!-- 헤더 부분 피하기 위한 div -->
				<div id="forHeader"></div>
				<!-- 본문 내용 가운데 정렬 위한 div -->
				<div id="forCenter">
					<!-- 여기부터 내용 입력하시면 됩니다! -->
					<h1>문의 게시판</h1>
					<table class="table">
						<tr>
							<th width="120px">번호</th>
							<th width="120px">구분</th>
							<th width="500px">제목</th>
							<th width="180px">작성일</th>
							<th width="160px">작성자</thw>
							<th width="120px">상태</th>
						</tr>
						<hr>
						<c:forEach items="${qbList }" var="qnaboard" varStatus="i">
							<tr>
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
									<c:choose>
										<c:when test="${not empty qnaboard.qnaPassword}">
											<td><i class="fa-solid fa-lock"></i> ${qnaboard.qnaSubject}</td>
										</c:when>
										<c:otherwise>
											<td><a
													href="/qnaboard/detail?qnaNo=${qnaboard.qnaNo}">${qnaboard.qnaSubject}</a>
											</td>
										</c:otherwise>
									</c:choose>
									<td id="listDate">${qnaboard.qnaDate }</td>
									<td>${qnaboard.memberNickname }</td>
									<td>
										<c:if test="${qnaboard.qQnaNo eq null}">답변대기</c:if>
										<c:if test="${qnaboard.qQnaNo ne null}">답변완료</c:if>
									</td>
							</tr>
							<c:choose>
								<c:when test="${not empty qnaboard.qnaPassword}">
									<tr style="display: none;" class="hiddenTr">
										<td colspan="2"></td>
										<!-- 							<td ></td> -->
										<td>
											<form action="/qnaboard/pwdetail" method="get">
												<div class="hidden-password">
													비밀번호 : <input type="password" name="qnaPassword" class="hidden">
													<input type="hidden" name="qnaNo" value="${qnaboard.qnaNo}">
													<button type="submit">확인</button>
												</div>
											</form>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<tr>
							<td colspan="5" class="line">
								<div id="paging">
									<c:if test="${paging.totalCount ne null }">
										<c:if test="${paging.currentPage != 1}">
											<c:if test="${paging.startNavi != 1}">
												<!-- 첫 페이지로 버튼 -->
												<a href="/qnaboard/list?page=1" class="move first">&lt;&lt;</a>
											</c:if>
											<!-- 이전 페이지로 버튼 -->
											<a href="/qnaboard/list?page=${paging.currentPage-1}"
												class="move prev">&lt;</a>
										</c:if>

										<c:forEach begin="${paging.startNavi}" end="${paging.endNavi}" var="i">
											<c:choose>
												<c:when test="${i == paging.currentPage}">
													<span class="page current">${i}</span>
												</c:when>
												<c:otherwise>
													<a href="/qnaboard/list?page=${i}" class="page">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:if test="${paging.currentPage != paging.lastPage}">
											<!-- 다음 페이지로 버튼 -->
											<a href="/qnaboard/list?page=${paging.currentPage+1}"
												class="move next">&gt;</a>
											<c:if test="${paging.endNavi != paging.lastPage}">
												<!-- 맨 끝 페이지로 버튼 -->
												<a href="/qnaboard/list?page=${paging.lastPage}"
													class="move last">&gt;&gt;</a>
											</c:if>
										</c:if>
									</c:if>
								</div>
							</td>
							<c:if test="${member.memberId != 'admin' }">
								<td><a href="/qnaboard/write"><input class="submit-btn" type="submit"
											value="문의 글 쓰기"></a></td>
							</c:if>
						</tr>
					</table>


				</div>
			</main>
			<jsp:include page="../common/footer.jsp" />

			<script>
				var boardDate = document.querySelectorAll("#listDate");
				for (var i = 0; i < boardDate.length; i++) {
					boardDate[i].innerHTML = boardDate[i].innerHTML.substr(0, 10);
				}

				$(document).ready(function () {
					$("tr").click(function () {
						$(this).next(".hiddenTr").toggle();
						// 				        if ($(this).next().is(".hiddenTr") && $(this).next().is(":visible")) {
						// 				            $(this).next().css("display", "none");
						// 				        } else {
						// 				        	$(this).next().css("display", "");
						// 				        }
					});
				});
			</script>
		</body>

		</html>