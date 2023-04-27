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
								<c:if test="${member.memberNo != '2' }">
									<input type="button" value="수정"
										onclick="location.href='/qnaboard/modify?qnaNo=' + ${qnaboard.qnaNo}">
									<input type="button" id="qnaboardDelete" value="삭제"
										onclick="removeCheck(${qnaboard.qnaNo});">
									<input type="button" value="목록" onclick="location.href='/qnaboard/list'">
								</c:if>
								<c:if test="${member.memberNo == '2' }">
									<!-- <input type="button" value="답변하기"> -->
									<!-- 댓글 영역 -->
									<!-- 댓글 등록 -->
									<table align="center" width="500" border="1">
										<tr>
											<td>${member.memberNickname}</td>
											<!-- <td><input type="text" id="memberNickname" name="memberNickname"></td> -->
										</tr>
										<tr>
											<td><textarea name="replyContents" id="replyContents" cols="55"
													rows="3"></textarea></td>
											<td><button id="rsubmit">등록하기</button></td>
										</tr>
									</table>
									<!-- 댓글 목록 -->
									<table align="center" width="500" border="1" id="replyTable">
										<thead>
											<tr>
												<!-- 댓글 갯수 -->
												<td colspan="4"><b id="replyCount"></b></td>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</c:if>
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

				$("#rsubmit").on("click", function () {
					event.preventDefault();  // 버튼의 기본 동작을 막음
					const qnaNo = "${qnaboard.qnaNo}";
					const memberNo = "${member.memberNo}";
					const replyContents = $("#replyContents").val();
					console.log({
						repQnaNo: qnaNo,
						memberNo: memberNo,
						replyContents: replyContents
					});
					$.ajax({
						url: "/qnaboard/reply/register",  // ajax 요청을 보낼 URL
						data: {
							repQnaNo: qnaNo,
							memberNo: memberNo,
							replyContents: replyContents
						},
						type: "POST",  // ajax 요청 방식
						success: function (result) {
							if (result == '1') {
								alert("댓글 등록 성공");
								$("#replyContents").val("");  // 댓글 입력창 비우기
							}
						}
					})
				});



				// 댓글 목록을 가져오는 함수
				function getReplyList() {
					const qnaNo = "${qnaboard.qnaNo}"; // Q&A 게시물 번호
					$.ajax({
						url: "/qnaboard/reply/list", // 댓글 목록을 가져오는 URL
						data: { "qnaNo": qnaNo },
						type: "GET",
						success: function (data) {
							$("#replyCount").text("댓글 (" + data.length + ")");
							const tableBody = $("#replyTable tbody");
							tableBody.html("");
							console.log(data);
							let tr, rWriter, rContent, repDate, btnArea;
							if (data.length > 0) {
								for (let i in data) {
									tr = $("<tr>");
									rWriter = $("<td width='100'>").text(data[i].replyWriter);
									rContent = $("<td>").text(data[i].replyContents);
									rCreateDate = $("<td width='100'>").text(data[i].repDate);
									btnArea = $("<td width='80'>").append(
										$("<a href='javascript:void(0)' onclick='modifyReply(this, \"" + data[i].repDate + "\", " + data[i].replyNo + ");'>수정</a>")
									).append(
										$("<a href='javascript:void(0)' onclick='removeReply(" + data[i].replyNo + ");'>삭제</a>")
									);
									tr.append(rWriter);
									tr.append(rContent);
									tr.append(repDate);
									tr.append(btnArea);
									tableBody.append(tr);
								}
							}
						},
						error: function () {
							alert("AJAX 처리 실패! 관리자 문의 요망");
						}
					});
				}




			</script>
		</body>

		</html>

		</html>