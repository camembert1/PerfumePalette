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
					<td>
						<c:if test="${chatRoom.cnt == 0}">
							X	
						</c:if>
						<c:if test="${chatRoom.cnt > 0}">
							O
						</c:if>
					</td>
					<td>
						<c:if test="${chatRoom.cnt == 0}">
							<button class="btn btn-primary" onclick="location.href='/chat/room/${chatRoom.roomNo}'">선택</button>
						</c:if>
						<c:if test="${chatRoom.cnt > 0}">
							<button class="btn btn-danger" onclick="location.href='/chat/room/${chatRoom.roomNo}'">선택</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>