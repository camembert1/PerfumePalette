<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="../../../resources/reviewCss/reviewWrite.css">
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
         	<div id="subject">REVIEW</div>
         	<form action="" method="post">
         	<div class="productInfoContainer">
		        <div class="productSubject">상품정보</div>
		        <div class="productInfo">
		        	<div class="productImg">상품이미지</div>
		        	<div class=productDetails>
			            <div class="productTitle">[조말론] 라임 바질 앤 만다리 코롱</div>
			            <div class="productPrice">218000원</div>
		            </div>
		        </div>
		    </div>
         	<div id="writer">
         		<div class="left">작성자</div>
         		<div class="right">닉네임</div>
         	</div>
         	<div id="starScore">
         		<div class="left">별점</div>
         		<div class="right">
         			<fieldset>
			            <input type="radio" name="reviewStar" value="5" id="rate1">
			            <label for="rate1">★</label>
			            <input type="radio" name="reviewStar" value="4" id="rate2">
			            <label for="rate2">★</label>
			            <input type="radio" name="reviewStar" value="3" id="rate3">
			            <label for="rate3">★</label>
			            <input type="radio" name="reviewStar" value="2" id="rate4">
			            <label for="rate4">★</label>
			            <input type="radio" name="reviewStar" value="1" id="rate5">
			            <label for="rate5">★</label>
			        </fieldset>
         		</div>
         	</div>
         	<div id="productContent">
         		<div class="left">상품평</div>
         		<div class="api">
         			<textarea id="summernote" name="boardContents"></textarea>
         		</div>
         	</div>
         	<!-- <div class="filbox">
         		<input type="file" name="uploadFile">
         	</div>
         	<div class="filbox">
         		<input type="file" name="uploadFile">
         	</div>
         	<div class="filbox">
         		<input type="file" name="uploadFile">
         	</div> -->
         	
         	<div class="input-btn">
         		<button type="submit">등록하기</button>
         		<button type="reset">취소하기</button>
         	</div>
         	</form>
		</div>
	</main>
	<script>
		$(document).ready(function () {
            const fontList =  ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'MapoFlowerIsland', '맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'];
            $('#summernote').summernote({
               placeholder: '내용을 작성하세요',
               height: 400,
               maxHeight: 400,
			   lang: "ko-KR",
               toolbar: [
                  //[groupName, [list of button]]
                  ['fontname', ['fontname']],
                  ['fontsize', ['fontsize']],
                  ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                  ['color', ['forecolor','color']],
                  ['table', ['table']],
                  ['para', ['ul', 'ol', 'paragraph']],
                  ['height', ['height']],
                  ['insert',['picture','link','video']],
                  /* ['view', ['fullscreen', 'help']] */
               ],
               fontNames: fontList,
               fontNamesIgnoreCheck: fontList,
               fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
            });
         });
		</script>
		
	<jsp:include page="../common/footer.jsp" />

</body>
</html>