<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>상품 문의</title>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
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
                        <tr>
                            <th width="120px">번호</th>
                            <th width="120px">구분</th>
                            <th width="540px">제목</th>
                            <th width="180px">작성일</th>
                            <th width="120px">작성자</thw>
                            <th width="120px">상태</th>
                        </tr>
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
                                    <td><a href="/qnaboard/detail?qnaNo=${qnaboard.qnaNo}"> ${qnaboard.qnaSubject }</a>
                                    </td>
                                    <td>${qnaboard.qnaDate }</td>
                                    <td>${qnaboard.memberNickname }</td>
                                    <td>
                                        <c:if test="${qnaboard.qQnaNo eq null}">답변대기</c:if>
                                        <c:if test="${qnaboard.qQnaNo ne null}">답변완료</c:if>

                                    </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5" class="line">
                                <a href="" class="page"> &lt;&lt;</a>
                                <a href="" class="page"> &lt;</a>
                                <a href="" class="number page">1</a>
                                <a href="" class="number page">2</a>
                                <a href="" class="number page">3</a>
                                <a href="" class="number page">4</a>
                                <a href="" class="number page">5</a>
                                <a href="" class="page">&gt;</a>
                                <a href="" class="page">&gt;&gt;</a>
                            </td>
                            <td>
                            	<a href="/qnaboard/write"><input class="submit-btn" type="submit" value="문의 글 쓰기"></a>
                            </td>
                            
                        </tr>
                    </table>
                    
                        
                </div>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />

        </body>

        </html>