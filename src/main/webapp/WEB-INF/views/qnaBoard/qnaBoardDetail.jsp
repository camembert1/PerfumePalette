<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>상품 문의-Detail</title>
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
				integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
				crossorigin="anonymous"></script>
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
			<link rel="stylesheet" href="../../../../resources/qnaCss/qnaBoardDetail.css">
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
					<div class="container">
						<form action="/qnaboard/detail" method="get" enctype="multipart/form-data">
							<!-- foreach 추가 예정 -->
							<h1>문의 상세</h1>
							<div id="category">
								<input type="hidden" class="radius" name="qnaType" value="${qnaboard.qnaType}">
								<c:if test="${qnaboard.qnaType == 1 }">
									<span class="qnatype"><strong>상품문의</strong></span>
								</c:if>
								<c:if test="${qnaboard.qnaType == 2 }">
									<span class="qnatype"><strong>배송문의</strong></span>
								</c:if>
								<c:if test="${qnaboard.qnaType == 3 }">
									<span class="qnatype"><strong>교환/환불</strong></span>
								</c:if>
								<c:if test="${qnaboard.qnaType == 4 }">
									<span class="qnatype"><strong>기타문의</strong></span>
								</c:if>
							</div>

							<input class="radius title" name="qnaSubject" value="${qnaboard.qnaSubject}" type="text"
								placeholder="제목을 입력해 주세요">
							<hr>
							<c:if test="${not empty qnaboard.qFilerename}">
								<div id="photo">
									<img src="../../../resources/img/qnaFileUploads/${qnaboard.qFilerename}" alt="#">
								</div>
							</c:if>
							<div id="textarea">${qnaboard.qnaContents }</div>
							<br> <br>
							<div class="submit-btn">
								<input type="button" value="수정"
									onclick="location.href='/qnaboard/modify?qnaNo=' + ${qnaboard.qnaNo}">
								<input type="button" id="qnaboardDelete" value="삭제"
									onclick="removeCheck(${qnaboard.qnaNo});">
								<input type="button" value="목록" onclick="location.href='/qnaboard/list'">

							</div>
						</form>
					</div>
				</div>
			</main>
			<jsp:include page="../common/footer.jsp" />
			<script>
				// 삭제버튼 클릭한 경우 한번 더 묻는 팝업창 생성, 확인 시 삭제완료
				function removeCheck(qnaNo) {
					if (confirm("정말 삭제하시겠습니까?")) {
						location.href = "/qnaboard/remove?qnaNo=" + qnaNo;
					}
				}
			</script>
		</body>

		</html>

		</html>