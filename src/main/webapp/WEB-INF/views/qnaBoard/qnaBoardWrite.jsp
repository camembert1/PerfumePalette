<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
				<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
					rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
				<link rel="stylesheet" href="../../../resources/qnaCss/qnaBoardWrite.css">
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
							<h1>문의 작성</h1>
							<form action="/qnaboard/write" method="post">
								<input type="hidden" name="id" value="${id }" id="id">
								<select name="qnaType" id="qnaType" onchange="changeFn()" class="select">
									<option value="1">상품문의</option>
									<option value="2">배송문의</option>
									<option value="3">교환/환불</option>
									<option value="4">기타문의</option>
								</select>
								<input class="radius title" name="qnaSubject" type="text" placeholder="제목을 입력해 주세요"
									required oninvalid="showAlert()">
								<!-- 썸머노트 api -->
								<div id="editorApi">
									<textarea id="summernote" name="qnaContents" required
										oninvalid="showAlert()"></textarea>
								</div>
								<br>
								<br>
								<br>
								공개글 <input type="radio" name="postType" id="publicPost" checked>
								비밀글 <input type="radio" name="postType" id="privatePost" value="비밀글">
								<br>
								<br>
								<!-- <label for="qnaPassword">비밀번호</label> -->
								<div id="hiddendiv" style="display:none">
									<label for="passwordInput" class="password-label">비밀번호 : </label>
									<input class="radius" type="password" name="qnaPassword" id="passwordInput"
										placeholder="숫자만 입력가능합니다.">
								</div>
								<br> <input class="submit-btn" type="submit" value="등록">
							</form>
						</div>
					</div>
				</main>
				<script>
					function showAlert() {
						alert("내용을 입력해주세요");
					}


					// summernote api
					const fontList = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'MapoFlowerIsland', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'];
					$('#summernote').summernote({
						placeholder: '내용을 작성하세요',
						width: 757,
						height: 500,
						maxHeight: 400,
						lang: "ko-KR",
						toolbar: [
							['fontname', ['fontname']],
							['fontsize', ['fontsize']]
							['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
							['color', ['forecolor', 'color']],
							['table', ['table']],
							['para', ['ul', 'ol', 'paragraph']],
							['height', ['height']],
							['insert', ['picture']]
							/* ['view', ['fullscreen', 'help']] */
						],
						fontNames: fontList,
						fontNamesIgnoreCheck: fontList,
						fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
						callbacks: {
							onImageUpload: function (files, editor, welEditable) {
								for (let i = files.length - 1; i >= 0; i--) {
									uploadSummernoteImageFile(files[i],
										this);
								}
							}
						}
					});

					function uploadSummernoteImageFile(file, el) {
						let data = new FormData();
						let id = document.getElementById("id").value;
						data.append("file", file);
						data.append("id", id);
						$.ajax({
							data: data,
							type: "POST",
							url: "/qnaboard/ImgFileUpload",
							contentType: false,
							enctype: 'multipart/form-data',
							processData: false,
							success: function (data) {
								$img = $('<img>').attr({ src: data.src });
								$(el).summernote('insertNode', $img[0]);
							}
						});
					}



					// qnatype 값 저장 스크립트
					function changeFn() {
						var qnaType = document.getElementById("qnaType");
						var value = (qnaType.options[qnaType.selectedIndex].value);
					}

					// 비밀글 토글
					// const publicPost = document.getElementById('publicPost');
					// const privatePost = document.getElementById('privatePost');
					// const passwordInput = document.getElementById('passwordInput');
					// const passwordLabel = document.querySelector('.password-label');

					// privatePost.addEventListener('click', () => {
					// 	if (passwordInput.style.display === 'none') {
					// 		passwordInput.style.display = 'block';
					// 		passwordLabel.style.display = 'block';
					// 	}
					// 	hiddendiv.style.display = 'block';
					// });

					// publicPost.addEventListener('click', () => {
					// 	passwordInput.style.display = 'none';
					// 	passwordLabel.style.display = 'none';
					// 	hiddendiv.style.display = 'none';
					// });

					// 	비밀글 라디오 버튼 토글
					const publicPost = document.getElementById('publicPost');
					const privatePost = document.getElementById('privatePost');
					const hiddendiv = document.getElementById('hiddendiv');

					privatePost.addEventListener('click', () => {
						hiddendiv.style.display = privatePost.checked ? 'block' : 'none';
					});

					publicPost.addEventListener('click', () => {
						hiddendiv.style.display = 'none';
					});

					// 비밀글 유효성 검사
					const passwordInput = document.getElementById("passwordInput");

					passwordInput.addEventListener("input", function(event) {
					  const input = event.target.value;
					  const regex = /^[0-9]*$/;
					  
					  if (!regex.test(input)) {
					    event.target.value = input.replace(/\D/g, "");
					  }
					});




				</script>
				<jsp:include page="../common/footer.jsp" />


			</body>

			</html>