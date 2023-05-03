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
				<div id="subject">REVIEW</div>
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
					<div id="like">
						<c:if test="${likeNo ne null }">
							<img alt="like_yes" src="../../../resources/img/wish/wish_yes.png" onclick="removeLike('${likeNo}')">
						</c:if>
						<c:if test="${likeNo eq null }">
							<img alt="like_no" src="../../../resources/img/wish/wish_no.png" onclick="addLike()">
						</c:if>
						<span>좋아요[0]</span>
					</div>
					<div id="report">
						<button onclick="report()">🚨</button>
					</div>
					<div id="modal">
						<h1>신고하기</h1>
						<div id="reportReason">
							<label>신고사유 : </label> 
							<select id="reportSelect" onchange="handleChange()">
								<option value="0">욕설/혐오/차별적 표현</option>
								<option value="1">부적절한 내용</option>
								<option value="2">기타</option>
							</select>
						</div>
						<div id="reportperfume">
							<label>향수명 : </label> 
							<span>[${review.perfumeBrand }] ${review.perfumeName }</span>
						</div>
						<div id="reportWrite">
							<label>작성자 : </label> 
							<span>${review.memberNickname }</span>
						</div>
						<div id="reportContents">
							<textarea rows="10" cols="50" placeholder="신고 사유를 입력해주세요." id="reportContent"></textarea>
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
						<a href="/review/reviewList">
							<input type="button" value="목록으로">
						</a>
				        <c:url var="rModify" value="/review/reviewModify">
				        	<c:param name="reviewNo" value="${review.reviewNo }"></c:param>
				        </c:url>
				        <a href="${rModify }">
				        	<input type="submit" value="수정하기">
				        </a>
				        <a href="javascript:void(0);" onclick="removeCheck(${review.reviewNo});">
				        	<input type="button" value="삭제하기">
				        </a>
					</div>
					
					<!-- 댓글 영역 -->
					<!-- 댓글이 출력되는 영역 -->
					<div id="replyList">
			            <div class="replyHeader">
			                <label>댓글(<span id="replyCount"></span>)</label>
			            </div>
			            <div class="replyTable">
			                <!-- 댓글 리스트가 들어갈 부분 -->
			                
			            </div>
			            <!-- 댓글 등록하기 -->
			            <div class="replyForm">
			                <div class="replyWriter">
			                    <p>가나다라바사</p>
			                </div>
			                <div class="replyContents">
			                    <input type="text">
			                </div>
			                <div class="replySubmit">
			                    <button id="rSubmit">댓글작성</button>
			                </div>
			            </div>
			        </div>
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
				success: function(result){
					if(result == -1){
						alert("이미 신고한 게시글 입니다.");
					} else{
						$("#modal").css("display", "none");
						$("#modal-bg").css("display", "none");
						alert("신고 완료");
					}
				},
				error: function(){
					alert("로그인 후 이용해주세요.");
				}
			});
		}
		  
		  
		function addLike() {
			let reviewNo = '${review.reviewNo}';
			let memberNo = '${member.memberNo}';

			$.ajax({
				url : "/review/like",
				type : "POST",
				data : {
					reviewNo : reviewNo,
					memberNo : memberNo
				},
				success : function(result) {
					if (result === "success") {
						 $("#like img").attr("src", "../../../resources/img/wish/wish_yes.png");
						 $("#like img").attr("onclick", "removeLike('" + result.likeNo + "')"); // likeNo 값을 받아와 removeLike 함수에 전달
					} else if(result === "fail"){
						alert("좋아요 추가 실패!");
					}
				},
				error : function() {
					alert("로그인 후에 이용해주세요.");
				}
			});
		}

		function removeLike(likeNo) { // likeNo 값을 인자로 받도록 변경
			$.ajax({
				url : "/review/remove",
				type : "POST",
				data : {
					likeNo : likeNo
				},
				success : function(result) {
					$("#like img").attr("src", "../../../resources/img/wish/wish_no.png");
					 $("#like img").attr("onclick", "addLike()"); // 좋아요 취소 후에는 다시 addLike 함수를 실행할 수 있도록 onclick 속성 변경
				},
				error : function() {
					alert("좋아요 취소 실패");
				}
			});
		}
		
		// 댓글 작성하면 나오는 부분
		getReplyList();
		function getReplyList(){
			const reviewNo = "${review.reviewNo}";
			$.ajax({
				url : "/reply/list",
				data : {"reviewNo" : reviewNo},
				type : "get",
				success : function(data){
					$("#replyCount").text(data.length);
					const replyList = $("#replyTable");
					replyList.html("");
					if(data.length > 0){
						for(let i in data){
							
						}
					}
				}
			})
		}
		
		//삭제하기 버튼 클릭 했을 때
		function removeCheck(reviewNo){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/review/reviewRemove?reviewNo="+reviewNo;
			}
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>