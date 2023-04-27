<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- 공통적으로 사용할 라이브러리 추가 -->
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	<table class="table table-hover" align="center">
		<thead>
			<tr>
				<th>방번호</th>
				<th>개설자</th>
				<th>참여인수</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>

				<c:when test="${empty chatRoomList}">
					<tr>
						<td colspan="4" align="center">존재하는 채팅방이 없습니다.</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach var="chatRoom" items="${chatRoomList }">
						<tr>
							<td>${chatRoom.roomNo }</td>
							<td>${chatRoom.memberNickname }<c:if test="${!empty member }">
									<button class="btn btn-primary" onclick="location.href='/chat/room/${chatRoom.roomNo}'">입장</button>
								</c:if></td>
							<td>${chatRoom.cnt }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<!-- 로그인이 되어있는 경우 -->
	<c:if test="${!empty member }">
		<div class="btn-area">
			<form action="/chat/openChatRoom" method="post">
				<button data-toggle="modal" data-target="#chatModal" class="btn btn-danger">채팅방 만들기</button>
			</form>
		</div>
	</c:if>
	<br>
	<br>

	<!-- <div class="modal fade" id="chatModal">
		<div class="modal-dialog modal-sm"> -->
	<!-- <div class="modal-content"> -->
	<!-- 
				모달 해더
				<div class="modal-header">
					<h4 class="modal-title">채팅방 만들기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				 -->
	<!-- <form action="/chat/openChatRoom" method="post">
		<button type="submit" class="btn btn-primary">만들기</button> -->
		<!-- 
					<div class="modal-body">
						<label for="title" class="mr-sm-2">제목</label> <input type="text" class="form-controll mb-2 mr-sm-2" placeholder="채팅방 제목" id="title" name="title">
					</div>

					모달 푸터
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">만들기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div> 
					-->
	<!-- </form> -->
	<!-- 		</div>
		</div>
	</div> -->
</body>