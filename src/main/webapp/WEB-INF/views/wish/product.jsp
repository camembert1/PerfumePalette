<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 100px;
	height: 100px;
}

table, td, th, tr {
	border: 1px solid black;
	padding: 10px;
	border-collapse: collapse;
	text-align: center;
}

td td {
	border: none;
	padding: 0;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
</head>

<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>향수명</th>
				<th>브랜드</th>
				<th>이미지</th>
				<c:if test="${sessionScope.member ne null }">
					<th>찜</th>
					<th>장바구니</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${perfumeList }" var="perfume" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${perfume.perfumeName }</td>
					<td>${perfume.perfumeBrand }</td>
					<td><img
						src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename}"
						alt="향수이미지"></td>
					<c:if test="${sessionScope.member ne null }">
						<td id="reload${perfume.perfumeNo }"><c:if
								test="${perfume.wishDate ne null}">
								<img id="add${perfume.perfumeNo }"
									src="../../../resources/img/wish/wish_yes.png" alt="wish_yes"
									onclick="removeWish(${perfume.perfumeNo}, '${sessionScope.member }')">
							</c:if> <c:if test="${perfume.wishDate eq null}">
								<img id="remove${perfume.perfumeNo }"
									src="../../../resources/img/wish/wish_no.png" alt="wish_no"
									onclick="addWish(${perfume.perfumeNo}, '${sessionScope.member }')">
							</c:if></td>
						<td>-</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
                function addWish(perfumeNo, id) {
                    $.ajax({
                        url: "/wish/add",
                        type: "GET",
                        data: {
                            perfumeNo: perfumeNo,
                            memberId: id
                        },
                        success: function (result) {
                            if (result === "success") {
                                $("#add" + perfumeNo).hide();
                                $("#remove" + perfumeNo).show();
                                /* alert("찜 추가 성공!!"); */
                                /* location.reload(); // 페이지 새로고침 */
                                /* 특정부분만 새로고침 */
                                $("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
                            } else if (result === "fail") {
                                alert("찜 추가 실패!!");
                            } else if (result === "error") {
                                alert("에러 발생!!");
                            }
                        },
                        error: function () {
                            alert("서버 처리 실패");
                        }
                    });
                }

                function removeWish(perfumeNo, id) {
                    $.ajax({
                        url: "/wish/remove",
                        type: "GET",
                        data: {
                            perfumeNo: perfumeNo,
                            memberId: id
                        },
                        success: function (result) {
                            if (result === "success") {
                                $("#add" + perfumeNo).show();
                                $("#remove" + perfumeNo).hide();
                                /* alert("찜 삭제 성공!!"); */
                                /* location.reload(); // 페이지 새로고침 */
                                /* 특정부분만 새로고침 */
                                $("#reload" + perfumeNo).load(location.href + " #reload" + perfumeNo);
                            } else if (result === "fail") {
                                alert("찜 삭제 실패!!");
                            } else if (result === "error") {
                                alert("에러 발생!!");
                            }
                        },
                        error: function () {
                            alert("서버 처리 실패");
                        }
                    });
                };

            </script>
</body>

</html>