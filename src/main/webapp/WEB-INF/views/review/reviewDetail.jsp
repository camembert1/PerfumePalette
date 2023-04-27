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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
							<div id="">
								<label>신고사유 : </label> 
								<select id="reportSelect" onchange="handleChange()">
									<option value="0">욕설/혐오/차별적 표현</option>
									<option value="1">부적절한 내용</option>
									<option value="2">기타</option>
								</select>
							</div>
							<div id="">
								<label>향수명 : </label> 
								<span>[${review.perfumeBrand }] ${review.perfumeName }</span>
							</div>
							<div id="">
								<label>작성자 : </label>
								<span>${review.memberNickname }</span>
							</div>
							<div id="reportContents">
								<textarea rows="10" cols="50" placeholder="·신고 사유를 입력해주세요." id="reportContent"></textarea>
							</div>
							<div id="btn-box">
								<button onclick="modalClose()">
									<span>닫기</span>
								</button>
								<button onclick="reportAjax()">
									<span>신고하기</span>
								</button>
							</div>
						</div>
					</div>
				    <div id="reviewContents">
				    ${review.reviewContents }
				    </div>
				    
					<div class="input-btn">
				        <c:url var="rModify" value="/review/reviewModify">
				        	<c:param name="reviewNo" value="${review.reviewNo }"></c:param>
				        </c:url>
				        <a href="${rModify }">
				        	<input type="submit" value="수정하기">
				        </a>
				        <a href="">
				        	<input type="reset" value="삭제하기">
				        </a>
					</div>
					
					<!-- 댓글 영역 -->
					<div id="reply"></div>
			</div>
			
			
			
		</div> 
	</main>
	<script>
		  // 모달창
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
		  
		  
		  function handleChange() {
			  let reportCont = 0;
			  const selectBox = document.getElementById("reportSelect");
			  reportCont = selectBox.options[selectBox.selectedIndex].value;
			  console.log(reportCont);
			}
		  
		  //신고하기 모달창에서 select 박스 클릭했을 때
		  const reportSelect = document.getElementById('reportSelect');
		  const reportContents = document.getElementById('reportContents').querySelector('textarea');

		  reportSelect.addEventListener('change', function() {
		    const selectedOption = reportSelect.options[reportSelect.selectedIndex].value;

		    if (selectedOption === '0') {
		      reportContents.placeholder = 'ex)\n·직·간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용\n·신체/외모/취향 등을 경멸하는 표현';
		    } else if (selectedOption === '1') {
		      reportContents.placeholder = 'ex)\n· 불쾌한 표현 포함';
		    } else {
		      reportContents.placeholder = 'ex)\n·신고 사유를 입력해주세요.';
		    }
		  });
		  
		 
		  /* 신고하기 AJAX*/
		  reportAjax = function() {
			let reportContent = $('#reportContent').val();
			let reportType = $('#reportSelect').val();
			
			$.ajax({
				url: "/review/report",
				type: "POST",
				data: {
					'reviewNo' : '${review.reviewNo}',
					'memberNo' : '${member.memberNo}',
					'reportType' : reportType,
					'reportContent' : reportContent
				},
				success: function(){
					$("#modal").css("display", "none");
					$("#modal-bg").css("display", "none");
				},
				error: function(){
					
				}
			});
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>