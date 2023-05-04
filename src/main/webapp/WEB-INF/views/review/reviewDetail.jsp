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
						<c:if test="${likeNo ne 0 }">
							<img alt="like_yes" src="../../../resources/img/common/wish-1.png" onclick="removeLike('${review.reviewNo}','${member.memberNo}')">
						</c:if>
						<c:if test="${likeNo eq 0 }">
							<img alt="like_no" src="../../../resources/img/wish/wish_no.png" onclick="addLike('${review.reviewNo}','${member.memberNo}')">
						</c:if>
						<span>좋아요[${totalNo }]</span>
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
						<c:if test="${member.memberNo == review.memberNo }">
					        <c:url var="rModify" value="/review/reviewModify">
					        	<c:param name="reviewNo" value="${review.reviewNo }"></c:param>
					        </c:url>
					        <a href="${rModify }">
					        	<input type="submit" value="수정하기">
					        </a>
					        <a href="javascript:void(0);" onclick="removeCheck(${review.reviewNo});">
					        	<input type="button" value="삭제하기">
					        </a>
				        </c:if>
					</div>
					
					<!-- 댓글 영역 -->
					<!-- 댓글이 출력되는 영역 -->
					<div id="replyList">
			            <div class="replyHeader">
			                <label>댓글(<span id="replyCount"></span>)</label>
			            </div>
				            <div class="replyTable">
				                <!-- 댓글 리스트가 들어갈 부분 -->
				                <!-- 댓글 등록하기 -->
					            <div class="replyForm" id="replyWriteForm">
					                <div class="replyWriter">
					                    <p>${member.memberNickname}</p>
					                </div>
					                <div class="replyContents">
					                    <input type="text" id="replyContents">
					                </div>
					                <div class="replySubmit">
					                    <button id="rSubmit" data-memberno = "${member.memberNo }" data-reviewno="${review.reviewNo }">댓글작성</button>
					                </div>
					            </div>

								<!-- 댓글 출력 -->
								<div class="replyForm reviewHidden" id="replyListForm">
									<div class="replyWriter">
										<p>${member.memberNickname}</p>
									</div>
									<div class="replyContents">
										<p></p>
									</div>
									<div class="">
										<p>시간...</p>
									</div>
									<div class="">
										<a onclick="replyComment(this)">답댓글</a>
									</div>
									<div class="">
										<a>수정</a>
									</div>
									<div class="">
										<a class="removeComment" onclick="removeComment(this)">삭제</a>
									</div>
								</div>

								<div class="replyForm reviewHidden" id="commentListForm">
									<div class="replyWriter">
										<p>${member.memberNickname}</p>
									</div>
									<div class="replyContents">
										<p></p>
									</div>
									<div class="">
										<p></p>
									</div>
								</div>

								<div class="replyForm" id="replycommentWrite">
									<div class="replyWriter">
										<p>${member.memberNickname}</p>
									</div>
									<div class="replyContents">
										<input type="text" id="commentContents">
									</div>
									 <div class="replySubmit">
										<button id="commentBtn">대댓작성</button>
									</div>
								</div>

					            <div id="replyListComment">
						            <div class="replyForm">
						                <div class="replyWriter">
						                    <p></p>
						                </div>
						                <div class="replyContents">
						                    <p></p>
						                </div>
						                <div class="">
						                	<p></p>
						                </div>
						                <div class="">
						                    <a>수정</a>
						                </div>
						                <div class="">
						                    <a>삭제</a>
						                </div>
						            </div>
					            </div>
				            </div>
			        </div>
			</div>
		</div> 
	</main>
	<script>
		replyCommentList();
		
		  // 모달창
		  function report() {
			  if(${member eq null}){
				  alert("로그인이 필요한 서비스입니다.");
			  }
		    
		    $.ajax({
				url: "/review/reportCheck",
				type: "POST",
				data: {
					'reviewNo' : '${review.reviewNo}',
					'memberNo' : '${member.memberNo}',
				},
				success: function(result){
					if(result > 0){
						alert("이미 신고된 게시글 입니다");
					} else{
						$("#modal").css("display", "block");
					    $("#modal-bg").css("display", "block");
					    $("body").css("overflow", "hidden");
					}
				}
		  	})
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
					if(result > 0){
						$("#modal").css("display", "none");
						$("#modal-bg").css("display", "none");
						$("body").css("overflow", "visible");
						alert("신고 완료");
					} 
				}
			});
		}
		  
		  
		function addLike() {
			if(${member eq null}){
				  alert("로그인이 필요한 서비스입니다.");
			  }
			  
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
						$("#like").load(location.href + " #like");
					} else if(result === "fail"){
						alert("좋아요 추가 실패!");
					}
				}
				
			});
		}

		function removeLike(reviewNo, memberNo) { // likeNo 값을 인자로 받도록 변경
			if(${member eq null}){
				  alert("로그인이 필요한 서비스입니다.");
			  }
			  
			$.ajax({
				url : "/review/remove",
				type : "POST",
				data : {
					reviewNo : reviewNo,
					memberNo : memberNo
				},
				success : function(result) {
					$("#like").load(location.href + " #like");
				}
			});
		}
		
		// 댓글 작성
		document.getElementById("rSubmit").addEventListener('click', function(){
			let replyContents = document.getElementById("replyContents").value;
			let memberNo = document.getElementById("rSubmit").dataset.memberno;
			let reviewNo = document.getElementById("rSubmit").dataset.reviewno;
			$.ajax({
				url: "/review/replyComment",
				type: "POST",
				data : {
					reviewNo : reviewNo,
					memberNo : memberNo,
					Contents : replyContents
				},success : function(data){
					if(data == "success"){
						document.getElementById("replyContents").value = "";
						replyCommentList();
					}
				}, error : function(){
				
				}
			})
			
		})
		

		getCommentDate = function(commentDate) {
			let date = new Date(commentDate);
			dateYear = date.getFullYear();
			dateMonth = String(date.getMonth() + 1).padStart(2, '0');
			dateDate = String(date.getDate()).padStart(2, '0');
	
			dateHours = String(date.getHours()).padStart(2, '0');
			dateMinutes = String(date.getMinutes()).padStart(2, '0');
								
			let commentDateStr = dateYear + '-' + dateMonth + '-'  + dateDate + ' ' + dateHours + ':'  + dateMinutes;
			return commentDateStr;
		}
		//댓글대댓글 리스트 
		function replyCommentList(){
			let reviewNo = document.getElementById("rSubmit").dataset.reviewno;
			$.ajax({
				url: "/review/replyCommentList",
				type: "GET",
				data : {
					reviewNo : reviewNo
				}, success : function(data){
					$("#replyCount").text(data.length);
					let commentWriteBox = document.getElementById("replycommentWrite");
					let replyList = document.querySelector("#replyListComment");
					replyList.before(commentWriteBox);
					commentWriteBox.style.display="none";
					replyList.innerHTML = "";
					
					data.forEach(element => {
						let commentDate = getCommentDate(element.commentDate);
						if(element.pcommentNo == 0){
							let replyBox = document.querySelector("#replyListForm").cloneNode(true);
							replyBox.classList.remove("reviewHidden");
							let nickname = replyBox.children[0];
							replyBox.dataset.replyno = element.commentNo;
							// console.log(nickname);
							nickname.innerHTML = element.memberNickname;
							replyBox.children[1].innerHTML = element.commentContent;
							replyBox.children[2].innerHTML = commentDate;
							replyList.append(replyBox);
						} else{
							let replyBox = document.querySelector("#commentListForm").cloneNode(true);
							replyBox.classList.remove("reviewHidden");
							let nickname = replyBox.children[0];
							// console.log(nickname);
							nickname.innerHTML = "┖ "+ element.memberNickname;
							replyBox.children[1].innerHTML = element.commentContent;
							replyBox.children[2].innerHTML = commentDate;
							replyBox.dataset.replyno = element.commentNo;
							replyList.append(replyBox);
						}
						
					});
				}, error : function(){

				}
			})
		}

		function replyComment(btn){
			const replyBoxes = btn.parentElement.parentElement;
			let commentWriteBox = document.getElementById("replycommentWrite");
			if(replyBoxes.nextSibling == commentWriteBox){
				let replyList = document.querySelector("#replyListComment");
					replyList.before(commentWriteBox);
					commentWriteBox.style.display="none";
			} else {
				replyBoxes.after(commentWriteBox);
				commentWriteBox.style.display = "block";
			}
			
		}
		
		
		//대댓 작성
		document.querySelector("#commentBtn").addEventListener("click", function(e){
			let pcommentNo = e.target.parentElement.parentElement.previousElementSibling.dataset.replyno;
			let replyContents = document.getElementById("commentContents").value;
			let memberNo = document.getElementById("rSubmit").dataset.memberno;
			let reviewNo = document.getElementById("rSubmit").dataset.reviewno;
			$.ajax({
				url: "/review/commentReply",
				type: "POST",
				data : {
					pcommentNo : pcommentNo,
					reviewNo : reviewNo,
					memberNo : memberNo,
					Contents : replyContents
				},success : function(data){
					if(data == "success"){
						document.getElementById("commentContents").value = "";
						replyCommentList();
					}
				}, error : function(){
				
				}
			})
		})



		//후기 게시글 삭제하기 버튼 클릭 했을 때
		function removeCheck(reviewNo){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/review/reviewRemove?reviewNo="+reviewNo;
			}
		}


		function removeComment(removeBtnTag){
			if(confirm("정말 삭제하시겠습니까?")){
				let commentNo = removeBtnTag.closest('.replyForm').getAttribute('data-replyno');
				$.ajax({
					url: "/review/deleteComment",
					type : "get",
					data : {
						commentNo : commentNo
					}, 
					success : function(result){
						alert(result);
						replyCommentList();
					},
					error : function(){
						alert("AJAX 처리 실패!!");
					}
				});
			}
		}	
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>