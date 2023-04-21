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
							<input type="hidden" name="qnaType" value="${qnaboard.qnaType}">
							<c:if test="${qnaboard.qnaType == 1 }">상품문의</c:if>
							<c:if test="${qnaboard.qnaType == 2 }">배송문의</c:if>
							<c:if test="${qnaboard.qnaType == 3 }">교환/환불</c:if>
							<c:if test="${qnaboard.qnaType == 4 }">기타문의</c:if>
							<input class="radius title" name="qnaSubject" value="${qnaboard.qnaSubject}" type="text"
								placeholder="제목을 입력해 주세요">
							<!-- 썸머노트 api -->
							<textarea id="summernote" name="qnaContents" value="${qnaboard.qnaContents }"></textarea>
							<br> <br>
							<div class="submit-btn">
								<input type="submit" value="수정"> <input type="submit" value="삭제">

							</div>
						</form>
					</div>
				</div>
			</main>
			<jsp:include page="../common/footer.jsp" />
			<script>
				const fontList = ['Arial', 'Arial Black', 'Comic Sans MS',
					'Courier New', 'MapoFlowerIsland', '맑은 고딕', '궁서', '굴림체', '굴림',
					'돋움체', '바탕체'];
				$(document)
					.ready(
						function () {
							$('#summernote')
								.summernote(
									{
										minHeight: 200,
										maxHeight: 500,
										width: 750,
										toolbar: [
											['fontname',
												['fontname']],
											['fontsize',
												['fontsize']],
											[
												'style',
												[
													'bold',
													'italic',
													'underline',
													'strikethrough',
													'clear']],
											[
												'color',
												['forecolor',
													'color']],
											['table', ['table']],
											[
												'para',
												['ul', 'ol',
													'paragraph']],
											['height',
												['height']],
											// ['insert', ['picture']],
											// ['view', ['fullscreen', 'help']]
										],
										fontNames: fontList,
										fontNamesIgnoreCheck: fontList,
										fontSizes: ['8', '9', '10',
											'11', '12', '14', '16',
											'18', '20', '22', '24',
											'28', '30', '36', '50',
											'72']
									});
						});
			</script>
		</body>

		</html>

		</html>