<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="../../../resources/reviewCss/reviewDetail.css">
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon"
	href="../../resources/img/common/favicon.png" />
</head>
<body>
	<div id="modal-bg"></div>
	<jsp:include page="../common/header.jsp" />
	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<div id="outter">
				<h1>REVIEW</h1>
				<div class="date">
					<label><fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm" /></label>
				</div>
				
				<div class="productInfo">
					<div class="product">
						<label>작성자</label>
					</div>
					<div class="user-name">${review.memberNickname }</div>
				</div>
				
				<div class="productInfo">
						<!-- <div class="product">
							<label>상품정보</label>
						</div> -->
						<div class="product-info">
							<div class="productImg">
								<img src="../../../resources/img/perfumeFileUploads/${review.pFilerename}" alt="">
							</div>
							<div class=productDetails>
								<div class="star-rating">
				                	<span class="fa ${review.rViewscore >= 1 ? 'fa-star' : 'fa-star-o'}" data-rating="1"></span>
									<span class="fa ${review.rViewscore >= 2 ? 'fa-star' : 'fa-star-o'}" data-rating="2"></span>
									<span class="fa ${review.rViewscore >= 3 ? 'fa-star' : 'fa-star-o'}" data-rating="3"></span>
									<span class="fa ${review.rViewscore >= 4 ? 'fa-star' : 'fa-star-o'}" data-rating="4"></span>
									<span class="fa ${review.rViewscore >= 5 ? 'fa-star' : 'fa-star-o'}" data-rating="5"></span>
					    			<input type="hidden" name="rViewscore" class="rating-value" value="${review.rViewscore }">
				    			</div>
					            <div class="productTitle">[${review.perfumeBrand }] ${review.perfumeName }</div>
					            <div class="productPrice"><fmt:formatNumber value="${review.perfumePrice }" pattern="#,##0"/>원</div>
				            </div>
						</div>
					</div>
					<div class="productInfo">
						<div id="good">
							❤ 좋아요[10]
						</div>
						<div id="report">
							<button onclick="report()">🚨신고</button>
						</div>
						<div id="modal">
							<h1>신고하기</h1>
							<form action="" method="post">
								<select>
									<option selected>신고사유</option>
									<option>욕설</option>
								</select>
								<textarea rows="" cols=""></textarea>
								<button onclick="">신고하기</button>
							</form>
								<button onclick="modalClose()">닫기</button>
						</div>
					</div>
				    <div id="reviewContents">
				    ${review.reviewContents }
				    </div>
				    
				    <div id="productImgInfo">
						<img alt="" src="../../../resources/img/reviewFileUploads/${review.rFilerename }">
					</div>
					<div class="input-btn">
						<!-- <input type="submit" value="수정하기">
				        <input type="reset" value="삭제하기"> -->
				        <c:url var="rModify" value="/review/reviewModify">
				        	<c:param name="reviewNo" value="${review.reviewNo }"></c:param>
				        </c:url>
				        <a href="${rModify }">수정하기</a>
				        <a href="">삭제하기</a>
					</div>
					
					<!-- 댓글 영역 -->
					<div id="reply"></div>
			</div>
			
			
			
		</div> 
	</main>
	<script>
		  function report() {
		    $("#modal").css("display", "block");
		    $("#modal-bg").css("display", "block");
		    $("body").css("overflow", "hidden");
		  }

		  function modalClose() {
		    $("#modal").css("display", "none");
		    $("#modal-bg").css("display", "none");
		    $("body").css("overflow", "visible");
		  }
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>