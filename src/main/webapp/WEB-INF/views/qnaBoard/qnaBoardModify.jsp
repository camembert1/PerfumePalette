<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
				<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
					integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
					crossorigin="anonymous"></script>
				<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
					rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
				<link rel="stylesheet" href="../../../resources/qnaCss/qnaBoardModify.css">
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
						<h1>문의 수정</h1>
							<form action="/qnaboard/modify" method="post" enctype="multipart/form-data">
								<input type="hidden" name="qnaNo" value="${qnaboard.qnaNo }">
								<select name="qnaType" id="qnaType" onchange="changeFn()" class="select"
									value="${qnaboard.qnaType }">
									<option name="qnaType" value="1">상품문의</option>
									<option name="qnaType" value="2">배송문의</option>
									<option name="qnaType" value="3">교환/환불</option>
									<option name="qnaType" value="4">기타문의</option>
								</select>
								<input class="radius title" name="qnaSubject" type="text" placeholder="제목을 입력해 주세요"
									value="${qnaboard.qnaSubject }">
								<div id="photo">
								<img src="../../../resources/img/qnaFileUploads/${qnaboard.qFilerename}" alt="이미지">
								</div>
									<!-- 썸머노트 api -->
									<div id="editorApi">
										<textarea id="summernote" name="qnaContents">${qnaboard.qnaContents }</textarea>
									</div>
									<br> <input type="file" name="uploadFile" onchange="loadImg(this);">
									<br>
									<br>
									비밀번호 <input class="radius" type="password" name="qnaPassword" id=""
										placeholder="비밀번호를 입력해주세요" value="${qnaboard.qnaPassword }">
									<br> <input class="submit-btn" type="submit" value="수정완료"
										onclick="location.href='/qnaboard/detail?qnaNo=${qnaboard.qnaNo}'">
							</form>
						</div>
					</div>
				</main>
				<script>
					const fontList = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'MapoFlowerIsland', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'];
					$('#summernote').summernote({
						placeholder: '내용을 작성하세요',
						width: 757,
						height: 500,
						maxHeight: 400,
						lang: "ko-KR",
						toolbar: [
							['fontname', ['fontname']],
							['fontsize', ['fontsize']],
							['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
							['color', ['forecolor', 'color']],
							['table', ['table']],
							['para', ['ul', 'ol', 'paragraph']],
							['height', ['height']],
							['insert', ['picture']],
							['view', ['fullscreen', 'help']]
						],
						fontNames: fontList,
						fontNamesIgnoreCheck: fontList,
						fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
					});
					function loadImg(obj) {
						if (obj.files.length != 0 && obj.files[0] != 0) {
							let reader = new FileReader();
							reader.readAsDataURL(obj.files[0]);
							reader.onload = function (e) {
								document.querySelector("#img-view").setAttribute("src",
									e.target.result);
							}
						} else {
							// 					$("#img-view").attr("src", "");
							document.querySelector("#img-view").setAttribute("src", "");
						}
					}
					function changeFn() {
						var qnaType = document.getElementById("qnaType");
						var value = (qnaType.options[qnaType.selectedIndex].value);
					}
				</script>
				<jsp:include page="../common/footer.jsp" />


			</body>

			</html>