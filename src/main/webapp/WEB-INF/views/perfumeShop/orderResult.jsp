<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

        <link rel="stylesheet" href="../../../resources/perfumeShopCss/orderResult.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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
                
                <div id="subject">주문 완료</div>
                <div style="width: 900px; height: 1px; border-bottom: 1px dashed #222; margin-top: 10px; margin-bottom: 40px;"></div>
                
                <img src="../../../resources/img/common/orderResult-perfume.png" alt="">

                <div id="text">주문이 성공적으로 완료되었습니다.</div>

                <table id="order-tbl">
                    <tr>
                        <th>주문번호</th>
                        <td>${oPayment.orderNo }</td>
                    </tr>
                </table>
                
                <c:if test="${oPayment.paymentMethod eq 'vbank'}">
                    <c:set var="vbDate" value="${fn:split(oPayment.vbankDate, '.')}" />

                    <table id="vbank-tbl">
                        <tr>
                            <th>입금은행</th>
                            <td>${oPayment.vbankName }</td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td>${oPayment.vbankNo }</td>
                        </tr>
                        <tr>
                            <th>입금기한</th>
                            <td> ${vbDate[0] }</td>
                        </tr>
                    </table>
                </c:if>
                
                <div id="orderList-btn" onclick="location.href='/member/orderList'">주문내역 확인하기</div>
                <div style="width: 900px; height: 1px; border-bottom: 1px dashed #222; margin-top: 80px; margin-bottom: 200px;"></div>

            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

    </body>
</html>