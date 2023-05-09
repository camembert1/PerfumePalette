<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
			<script src="https://kit.fontawesome.com/092e4e45af.js" crossorigin="anonymous"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
			<link rel="stylesheet" href="../../../../resources/qnaCss/qnaBoardlist.css">
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
					<!-- 여기부터 내용 입력하시면 됩니다! -->
					<h1>문의 게시판</h1>
					<table class="table">
						<caption style="text-align: right; margin-bottom: 5px;">* 향수관련 문의</caption>
						<tr>
							<th width="120px">번호</th>
							<th width="120px">구분</th>
							<th width="500px">제목</th>
							<th width="180px">작성일</th>
							<th width="160px">작성자</th>
							<th width="120px">상태</th>
						</tr>
						<hr>
						<c:forEach items="${qbList }" var="qnaboard" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>
									<c:if test="${qnaboard.qnaType == 1 }">상품문의</c:if>
									<c:if test="${qnaboard.qnaType == 2 }">배송문의</c:if>
									<c:if test="${qnaboard.qnaType == 3 }">교환/환불</c:if>
									<c:if test="${qnaboard.qnaType == 4 }">기타문의</c:if>
								</td>
								<%-- <c:url var="qDetail" value="/qnaboard/detail">
									<c:param name="qnaNo" value="${qnaboard.qnaNo }"></c:param>
									</c:url> --%>
									<%-- <c:choose>
										<c:when test="${not empty qnaboard.qnaPassword}">
											<td><i class="fa-solid fa-lock"></i> ${qnaboard.qnaSubject}</td>
										</c:when>
										<c:otherwise>
											<td><a
													href="/qnaboard/detail?qnaNo=${qnaboard.qnaNo}">${qnaboard.qnaSubject}</a>
											</td>
										</c:otherwise>
										</c:choose> --%>
										<c:choose>
											<c:when test="${not empty qnaboard.qnaPassword and member.memberNo != '2'}">
												<td onclick='lock(this, "${qnaboard.perfumeNo }", ${qnaboard.qnaNo })'>
													<c:if test="${qnaboard.perfumeNo ne 0}">* </c:if>
													${qnaboard.qnaSubject}<i class="fa-solid fa-lock"
														style="margin-left: 5px;"></i>
												</td>
											</c:when>
											<c:otherwise>

												<!-- 꼭 필요!!! -->
												<c:if test="${qnaboard.perfumeNo ne 0 }">
													<td><a href="/qnaboard/qnaDetail/${qnaboard.qnaNo}">
															<c:if test="${qnaboard.perfumeNo ne 0}">* </c:if>
															${qnaboard.qnaSubject}
														</a></td>
												</c:if>
												<c:if test="${qnaboard.perfumeNo eq 0 }">
													<td><a href="/qnaboard/detail?qnaNo=${qnaboard.qnaNo}">
															<c:if test="${qnaboard.perfumeNo ne 0}">* </c:if>
															${qnaboard.qnaSubject}
														</a></td>
												</c:if>
												<!-- 꼭 필요!!! -->

											</c:otherwise>
										</c:choose>

										<td id="listDate">${qnaboard.qnaDate }</td>
										<td>${qnaboard.memberNickname }</td>
										<td>
											<c:if test="${qnaboard.replyStatus == 'Y'}">답변완료</c:if>
											<c:if test="${qnaboard.replyStatus != 'Y'}">답변대기</c:if>
										</td>
							</tr>
							<c:choose>
								<c:when test="${not empty qnaboard.qnaPassword}">
									<tr style="display: none;" class="hiddenTr">
										<td colspan="2"></td>
										<!-- 							<td ></td> -->
										<td>
											<form action="/qnaboard/pwdetail" method="get"
												onsubmit="return validatePassword(${qnaboard.qnaNo})">
												<div class="hidden-password">
													비밀번호 : <input type="password" name="qnaPassword"
														id="qnaPassword${qnaboard.qnaNo}" class="hidden"
														placeholder="숫자만 입력 가능합니다."> <input
														type="hidden" name="qnaNo" id="qnaNo${qnaboard.qnaNo}"
														value="${qnaboard.qnaNo}">
													<!-- 꼭 필요!! -->
													<input type="hidden" id="perfumeNo${qnaboard.qnaNo}" value="">
													<!-- 꼭 필요!! -->
													<button type="submit">확인</button>
												</div>
											</form>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<tr>
							<td colspan="5" class="line">
								<div id="paging">
									<c:if test="${paging.totalCount ne null }">
										<c:if test="${paging.currentPage != 1}">
											<c:if test="${paging.startNavi != 1}">
												<!-- 첫 페이지로 버튼 -->
												<a href="/qnaboard/list?page=1" class="move first">&lt;&lt;</a>
											</c:if>
											<!-- 이전 페이지로 버튼 -->
											<a href="/qnaboard/list?page=${paging.currentPage-1}"
												class="move prev">&lt;</a>
										</c:if>

										<c:forEach begin="${paging.startNavi}" end="${paging.endNavi}" var="i">
											<c:choose>
												<c:when test="${i == paging.currentPage}">
													<span class="page current"
														style="color: white; background-color: #222222; border-radius: 25%;">${i}</span>
												</c:when>
												<c:otherwise>
													<a href="/qnaboard/list?page=${i}" class="page">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:if test="${paging.currentPage != paging.lastPage}">
											<!-- 다음 페이지로 버튼 -->
											<a href="/qnaboard/list?page=${paging.currentPage+1}"
												class="move next">&gt;</a>
											<c:if test="${paging.endNavi != paging.lastPage}">
												<!-- 맨 끝 페이지로 버튼 -->
												<a href="/qnaboard/list?page=${paging.lastPage}"
													class="move last">&gt;&gt;</a>
											</c:if>
										</c:if>
									</c:if>
								</div>
							</td>
							<c:if test="${member.memberId != 'admin' }">
								<td><a href="/qnaboard/write"><input class="submit-btn" type="submit"
											value="문의 글 쓰기"></a></td>
							</c:if>
						</tr>
					</table>


				</div>
			</main>
			<jsp:include page="../common/footer.jsp" />

			<script>
				// 리스트 작성일 시간 년/월/일만 나오도록 함
				var boardDate = document.querySelectorAll("#listDate");
				for (var i = 0; i < boardDate.length; i++) {
					boardDate[i].innerHTML = boardDate[i].innerHTML.substr(0, 10);
				}


				function lock(target, pNum, qNum) {
					// 모든 hiddenTr을 안보이게 설정
					$("#perfumeNo").val();
					$(".hiddenTr").hide();

					$(target).parent().next(".hiddenTr").toggle();

					/* 꼭 필요 */
					$("#perfumeNo" + qNum).val(pNum); // perfumeNo 값 할당
					/* 꼭 필요 */
				}
				
				
				// 비밀글 유효성 검사
				const passwordInput = document.querySelector('[id*="qnaPassword"]');

				passwordInput.addEventListener("input", function (event) {
					const input = event.target.value;
					const regex = /^[0-9]*$/;

					if (!regex.test(input)) {
						event.target.value = input.replace(/\D/g, "");
					}
				});
					
					
				// Ajax 요청을 통해 비밀번호 검증 및 페이지 이동 또는 알림창 표시
				function validatePassword(qNum) {
					var qnaNo = document.getElementById("qnaNo" + qNum).value;
					var password = document.getElementById("qnaPassword" + qNum).value;

					/* 반드시 필요 */
					var perfumeNumber = document.getElementById("perfumeNo" + qNum).value;
					/* 반드시 필요 */

					// 비밀번호 검증 Ajax 요청
					$.ajax({
						type: "POST",
						url: "/qnaboard/samepwd",
						data: {
							"qnaNo": qnaNo,
							"inputPw": password
						},
						success: function (response) {
							if (response === "1") {
								// 비밀번호가 맞을 경우 페이지 이동
								if (perfumeNumber == 0 || perfumeNumber == "") {
									/* 민우 페이지 */
									window.location.href = "/qnaboard/detail?qnaNo=" + qnaNo;
								} else {
									/* 내 페이지 */
									/* 반드시 필요 */
									location.href = "/qnaboard/qnaDetail/" + qnaNo;
									/* 반드시 필요 */
								}

							} else {
								// 비밀번호가 틀릴 경우 알림창 표시
								alert("비밀번호가 일치하지 않습니다.");
							}
						},
						error: function () {
							// 오류 발생 시 알림창 표시
							alert("오류가 발생했습니다.");
						}
					});

					// 폼 전송 방지
					return false;
				}
			</script>
		</body>

		</html>