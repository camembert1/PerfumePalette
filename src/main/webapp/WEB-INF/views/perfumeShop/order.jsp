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

        <!-- 포트원 결제 -->
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <main>
        <!-- 헤더 부분 피하기 위한 div -->
        <div id="forHeader"></div>
    
        <!-- 본문 내용 가운데 정렬 위한 div -->
        <div id="forCenter">
            
            <!-- 여기부터 내용 입력하시면 됩니다! -->
        
            <h1>주문자 MemberNo : ${memberNo }</h1>
            <h1>향수번호 perfumeNo : ${perfumeNo }</h1>
            <h1>주문수량 orderQuantity : ${orderQuantity }</h1>
            <button onclick="payment()">구매하기</button>
    
        </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    
        
        
    
        <script>

            // 현재 시간에 맞게 주문번호 생성하는 함수
            getOrderNo = function(now) {
                nowYear = now.getFullYear();
                nowMonth = String(now.getMonth() + 1).padStart(2, '0');
                nowDate = String(now.getDate()).padStart(2, '0');
        
                nowHours = String(now.getHours()).padStart(2, '0');
                nowMinutes = String(now.getMinutes()).padStart(2, '0');
                nowSeconds = String(now.getSeconds()).padStart(2, '0');
                nowMiliseconds = String(now.getMilliseconds()).padStart(3, '0');
        
                let orderNo = nowYear + nowMonth + nowDate + nowHours + nowMinutes + nowSeconds + nowMiliseconds;
                return orderNo;
            }

            //console.log(getOrderNo(new Date()));
    
            

            payment = function() {

                let perfumeName = '';
                let memberNo = '';
                let orderQuantity = parseInt($('#orderQuantity').val());
                let resultMsg = '';

                // 주문서에 여러개가 있다면
                // 1. 결제 함수에 들어가는 name 값은 가장 상위에 있는 향수 정보를 가져온 후 
                //    OOO 외 n건 이런식으로 처리하자
                //    DB에 넣을 때는 주문상세 컬럼에 하나하나 다 넣어줘야 되니까 어차피 각각의 정보는 다 쏴주긴 해야됨

                // 2. 결제 금액은 (perfumePrice)*(orderQuantity)의 총 합
                //    근데 결제 함수에 들어가는 amount값은 100으로 고정
                //    일단 동적으로 다 받아올 수는 있도록 하되 서버에 뿌릴 때만 고정하자!
                //    시연 연상 찍을 때는 그냥 그대로 넣어 다 

                // 
                
                let orderDate = new Date();

                var IMP = window.IMP;
                IMP.init('imp64001400');
    
                IMP.request_pay({
                    pg : 'html5_inicis',
                    pay_method : 'card',                    // 결제수단 - 카드
                    //pay_method : 'samsung',               // 결제수단 - 삼성페이
                    //pay_method : 'vbank',                 // 결제수단 - 가상계좌    
                    merchant_uid : getOrderNo(orderDate),    //주문번호
                    name : 'Perfume Palette',               // 주문명(사이트명)이 아닌데? 카카오페이 기준 걍 상품명인데.. 상품명 넣겟음 ㅇ어ㅓ
                    amount : 100,                           // 결제금액
                    buyer_email : '',
                    buyer_name : '이유정',                   // 주문자명 - 주문자정보 가져오기 아예 컨트롤러에서 가져와서 쏴줘야될듯!
                    buyer_tel : '01011112222',              // 주문자연락처 	
                    //vbank_due : 'YYYYMMDDhhmm',           // 가상계좌 입금기한
                }, function(rsp) {

                    console.log(rsp);
                    console.log((rsp.imp_uid).replace(/\D/g, ''));

                    if(rsp.success) {

                        // 결제 검증
                        $.ajax({
                            url : '/order/verifyiamport/' + rsp.imp_uid,
                            type : 'POST'
                        }).done(function(verifyResult) {

                            console.log(verifyResult);
                            if (rsp.paid_amount == verifyResult.response.amount) {
                                
                                // 검증 후 결제 요청한 금액과 실제 결제 결과 금액이 같다면
                                // 결제 성공 + DB에 넣기
                                let orderNo = rsp.merchant_uid;
                                let order = {
                                    'orderNo'           : orderNo,
                                    'orderDateMilis'    : orderDate.getTime(),
                                    'orderStatus'       : rsp.status,
                                    'memberNo'          : '${memberNo}',
                                    'recipientName'     : '수령인',
                                    'recipientPhone'    : '01012341234',
                                    'deliveryAddr'      : '서울특별시 중구 남대문로120 그레이츠청계',
                                    'deliveryMsg'       : '부재시 경비실에 맡겨주세요',
                                }

                                let oDetails = [];
                                let oDetail1 = {
                                    'orderNo'           : orderNo,
                                    'perfumeNo'         : '${perfumeNo}',
                                    'orderQuantity'     : '${orderQuantity}',
                                    'perfumePrice'      : 300000,
                                }
                                let oDetail2 = {
                                    'orderNo'           : orderNo,
                                    'perfumeNo'         : '22',
                                    'orderQuantity'     : '33',
                                    'perfumePrice'      : 400000,
                                }
                                oDetails.push(oDetail1);
                                oDetails.push(oDetail2);

                                let oPayment = {
                                    'paymentNo'         : rsp.imp_uid,
                                    'orderNo'           : orderNo,
                                    'paymentDateMilis'  : rsp.paid_at * 1000,
                                    'paymentMethod'     : rsp.pay_method,
                                    'paymentAmount'     : rsp.paid_amount
                                }

                                $.ajax({
                                    url : '/order/paySuccess'
                                    , type : 'POST'
                                    , data : JSON.stringify({
                                        'order'         : order,
                                        'oDetails'      : oDetails,
                                        'oPayment'      : oPayment
                                    })
                                    , contentType : 'application/json'
                                    , success : function(result) {
                                        alert(result);
                                    }
                                    , error : function(result) {
                                        alert(result);
                                    }
                                });

                            } else {
                                 // 검증 후 결제 요청한 금액과 실제 결제 결과 금액이 같지 않다면
                                resultMsg = '결제 실패';
                                resultMsg += '\n 결제 금액 불일치';
                                alert(resultMsg);
                            }
                        });
    
                    } else {
                        // 결제 실패
                        resultMsg = '결제 실패';
                        resultMsg += '\n에러 내용' + rsp.error_msg;
                        alert(resultMsg);
                    }
                });
            }
    
    
        </script>
    
    </body>
</html>