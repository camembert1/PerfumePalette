<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="../../../resources/qnaCss/qnaBoardModify2.css">
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
				<div id="perfumeInfo">
					<div id="imgBox">
						<img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="image">
					</div>
					<div id="infoBox">
						<div>${perfume.perfumeBrand }</div>
						<div>${perfume.perfumeName }</div>
						<div>${perfume.perfumeVolume }ml</div>
						<div>
							<fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,##0" />
							원
						</div>
					</div>
				</div>
				<form action="/qnaboard/modify2" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${id }" id="id"> <input type="hidden" name="qnaNo" value="${qnaboard.qnaNo }"> <input type="hidden" name="qFilename" value="${qnaboard.qFilename }"> <select name="qnaType" id="qnaType" onchange="changeFn()" class="select">
						<option value="1" ${qnaboard.qnaType==1 ? 'selected' : '' }>상품문의</option>
						<option value="2" ${qnaboard.qnaType==2 ? 'selected' : '' }>배송문의</option>
						<option value="3" ${qnaboard.qnaType==3 ? 'selected' : '' }>교환/환불</option>
						<option value="4" ${qnaboard.qnaType==4 ? 'selected' : '' }>기타문의</option>
					</select> <input class="radius title" name="qnaSubject" type="text" placeholder="제목을 입력해 주세요" value="${qnaboard.qnaSubject }">
					<!-- 								<div id="photo"> -->
					<%-- <img src="../../../resources/img/qnaFileUploads/${qnaboard.qFilerename}" alt="이미지">
									--%>
					<!-- 								</div> -->
					<!-- 썸머노트 api -->
					<div id="editorApi">
						<textarea id="summernote" name="qnaContents">${qnaboard.qnaContents }</textarea>
					</div>


					<div id="footer">
						<div id="left">
							<c:if test="${qnaboard.qnaPassword eq null}">
								<div>
									<label for="publicPost">공개글</label> <input type="radio" name="postType" id="publicPost" value="공개글" checked> <label for="privatePost">비밀글</label> <input type="radio" name="postType" id="privatePost" value="비밀글">
								</div>
								<div id="hiddendiv" style="display: none">
									<label for="passwordInput" class="password-label">비밀번호 : </label> <input class="radius" type="password" name="qnaPassword" id="passwordInput" placeholder="숫자만 입력가능합니다." oninput="chkPw()">
								</div>
							</c:if>
							<c:if test="${qnaboard.qnaPassword ne null}">
								<div>
									<label for="publicPost">공개글</label> <input type="radio" name="postType" id="publicPost" value="공개글"> <label for="privatePost">비밀글</label> <input type="radio" name="postType" id="privatePost" value="비밀글" checked>
								</div>
								<div id="hiddendiv" style="display: block">
									<label for="passwordInput" class="password-label">비밀번호 : </label> <input class="radius" type="password" name="qnaPassword" id="passwordInput" placeholder="숫자만 입력가능합니다." oninput="chkPw()" value="${qnaboard.qnaPassword }">
								</div>
							</c:if>

						</div>
						<div id="right">
							<button class="submit-btn" type="submit">수정하기</button>
						</div>
					</div>
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
							// 							['view', ['fullscreen', 'help']]
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

					//				 	비밀글 라디오 버튼 토글
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

					passwordInput.addEventListener("input", function (event) {
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