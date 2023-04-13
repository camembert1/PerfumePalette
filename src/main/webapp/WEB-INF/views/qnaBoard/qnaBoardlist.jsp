<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="./qnaBoardlist.css">

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
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td><a class="1" href="#">아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</a></td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>[ 배송 ]</td>
                        <td>아앙아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아ㅏㅇ</td>
                        <td>2023-04-13</td>
                        <td>서민우</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td colspan="6" class="line">
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
                    </tr>
                </table>

            </div>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

    </body>

    </html>