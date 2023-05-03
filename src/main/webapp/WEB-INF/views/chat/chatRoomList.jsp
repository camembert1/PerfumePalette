<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<!-- favicon : 탭에 보이는 아이콘 -->
<link rel="icon" href="../../resources/img/common/favicon.png" />
<link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
<link rel="stylesheet" href="../../../resources/chatCss/chatRoomList.css">
<!-- 채팅 관련 필요 -->
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- sockjs  -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- alertify 꾸미는 알림창-->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<main>
		<div id="modal-bg"></div>
		<iframe id="chat-iframe" src="" frameborder="0" style="display: none;"></iframe>
		<!-- 헤더 부분 피하기 위한 div -->
		<div id="forHeader"></div>
		<!-- 본문 내용 가운데 정렬 위한 div -->
		<div id="forCenter">
			<!-- 여기부터 내용 입력하시면 됩니다! -->
			<table class="table table-hover" style="text-align: center">
				<thead>
					<tr>
						<th>방번호</th>
						<th>개설자</th>
						<th>대기여부</th>
						<th>입장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chatRoom" items="${chatRoomList }">
						<tr>
							<td>${chatRoom.roomNo }</td>
							<td>${chatRoom.memberId }</td>
							<td><c:if test="${chatRoom.cnt == 0}">
													X
												</c:if> <c:if test="${chatRoom.cnt > 0}">
													O
												</c:if></td>
							<td>
								<button type="button" onclick="goChatModal(${chatRoom.roomNo});">선택</button> <input type="hidden" onclick="outChatModal(${chatRoom.roomNo});">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>

	<jsp:include page="../common/footer.jsp" />

	<script>
						function goChatModal(roomNo) {
							var url = "/chat/room/" + roomNo;
							document.getElementById("chat-iframe").src = url;
							$("#chat-iframe").css("display", "block");
							$("#modal-bg").css("display", "block");
							$("body").css("overflow", "hidden");
						}

						function outChatModal(roomNo) {
							$("#chat-iframe").attr("src", "");
							$("#chat-iframe").css("display", "none");
							$("#modal-bg").css("display", "none");
							$("body").css("overflow", "auto");
						}
					</script>
</body>

</html>