<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

        <link rel="stylesheet" href="../../../resources/perfumeShopCss/order.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <!-- favicon : 탭에 보이는 아이콘 -->
        <link rel="icon" href="../../resources/img/common/favicon.png" />
        <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />

    </head>
    <body>
        <h1>주문결과페이지입니다</h1>
        <c:if test="${oPayment.paymentMethod eq 'vbank'}">
            <h1>은행 : ${oPayment.vbankName }</h1>
            <h1>가상계좌번호 : ${oPayment.vbankNo }</h1>
            <c:set var="vbDate" value="${fn:split(oPayment.vbankDate, '.')}" />
            <h1>입금기한 : ${vbDate[0] }</h1>
        </c:if>
        <h1><a href="/member/orderList">주문내역확인하기</a></h1>
    </body>
</html>