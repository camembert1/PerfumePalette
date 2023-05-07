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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- favicon : 탭에 보이는 아이콘 -->
        <link rel="icon" href="../../resources/img/common/favicon.png" />
        <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />

        <!-- 포트원 결제 -->
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

        <!-- 주소 -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <main>
        <!-- 헤더 부분 피하기 위한 div -->
        <div id="forHeader"></div>
    
        <!-- 본문 내용 가운데 정렬 위한 div -->
        <div id="forCenter">
            
            <!-- 여기부터 내용 입력하시면 됩니다! -->

            <div id="subject">Order Sheet</div>
            <div style="width: 900px; height: 1px; border-bottom: 1px dashed #222; margin-top: 10px; margin-bottom: 40px;"></div>




            <div class="sub-title">주문 상품</div>
            <table id="orderList-tbl">
                <c:forEach items="${cList }" var="cart" varStatus="i">
                    <c:if test="${i.index eq 0 }">
                        <c:choose>
                            <c:when test="${fn:length(cList) > 1}">
                                <c:set var="orderName" value="${cart.perfumeName} 외 ${fn:length(cList)-1}건" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="orderName" value="${cart.perfumeName}" />
                            </c:otherwise>
                        </c:choose>		
                    </c:if>
                    <tr class="orderList">
                        <input type="hidden" value="${cart.cartNo }" id="cartNo${i.index}">
                        <input type="hidden" value="${cart.perfumeNo }" id="perfumeNo${i.index}">
                        <input type="hidden" value="${cart.perfumePrice }" id="perfumePrice${i.index}">
                        <input type="hidden" value="${cart.cartQuantity }" id="orderQuantity${i.index}">
                        <td><img src="../../../resources/img/perfumeFileUploads/${cart.pFilerename}" alt=""></td>
                        <td>${cart.perfumeName}</td>
                        <td><fmt:formatNumber value="${cart.perfumePrice }" pattern="#,##0"/>원</td>
                        <td>${cart.cartQuantity}개</td>
                        <td>총 <fmt:formatNumber value="${cart.perfumePrice * cart.cartQuantity}" pattern="#,##0"/>원</td>
                    </tr>
                </c:forEach>
                <tr>
                    <!-- 총금액은 컨트롤러에서 가져오지 말고 여기서 바로 계산하자.... 가끔 0원댐 어어 -->
                    <td colspan="5">총 결제 금액 : <fmt:formatNumber value="${totalPrice }" pattern="#,##0"/>원</td>                   
                </tr>
            </table>




            <div class="sub-title">주문자 정보</div>
            <table id="orderer-tbl">
                <tr>
                    <td>주문자명</td>
                    <td>${orderer.memberName }</td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>${orderer.memberPhone }</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${orderer.memberEmail}</td>
                </tr>
            </table>




            <div class="sub-title">배송 정보</div>
            <table id="deliveryInfo-tbl">
                <tr>
                    <td colspan="2">
                        <input type="checkbox" id="same" onclick="same(this)">
                        <label for="same">주문자와 동일</label>
                    </td>
                </tr>
                <tr>
                    <td>수취인</td>
                    <td>
                        <div>
                            <input type="text" placeholder="수취인을 입력해주세요." id="recipientName">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>
                        <input style="width: 300px;" type="text" placeholder="전화번호를 입력해주세요." id="recipientPhone" onblur="checkPhone(this)">
                        <span style="color: #6A82FB; font-size: 10pt;" id="recipientPhoneStatus"></span>
                    </td>
                </tr>
                <tr>
                    <td>배송지</td>
                    <td>
                        <div id="postcode-btn-area">
                            <input type="text" placeholder="우편번호" id="postcode" readonly>
                            <span id="addrSearchBtn" onclick="addrSearch()">주소 검색</span>
                        </div>
                        <div>
                            <input type="text" placeholder="주소를 검색해주세요." id="address" readonly>
                        </div>
                        <div>
                            <input type="text" placeholder="상세주소를 입력해주세요." id="detailAddress">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>배송메모</td>
                    <td>
                        <input type="text" placeholder="배송매세지를 입력해주세요." id="deliveryMsg">
                    </td>
                </tr>
            </table>

        
            
            <div class="sub-title">결제 수단</div>
            <table id="payment-tbl">
                <tr>
                    <td>
                        <label for="card">
                            <div>신용카드</div>
                        </label>
                        <input type="radio" id="card" value="card" name="paymentMethod">
                    </td>
                    <td>
                        <label for="vbank">
                            <div>가상계좌</div>
                        </label>
                        <input type="radio" id="vbank" value="vbank" name="paymentMethod">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="kakaopay">
                            <div>카카오페이</div>
                        </label>
                        <input type="radio" id="kakaopay" value="kakaopay" name="paymentMethod">
                    </td>
                    <td>
                        <label for="naverpay">
                            <div>네이버페이</div>
                        </label>
                        <input type="radio" id="naverpay" value="naverpay" name="paymentMethod">
                    </td>
                    <td>
                        <label for="samsung">
                            <div>삼성페이</div>
                        </label>
                        <input type="radio" id="samsung" value="samsung" name="paymentMethod">
                    </td>
                </tr>
                
            </table>

            
            <div class="sub-title">개인정보 제공 동의</div>
            <table id="agreement-tbl">
                <tr>
                    <td>개인정보 수집·이용 및 처리 동의</td>
                    <td style="cursor: pointer; text-decoration:underline; color: grey;">보기</td>
                </tr>
                <tr>
                    <td>결제대행 서비스 약관 동의</td>
                    <td style="cursor: pointer; text-decoration:underline; color: grey;">보기</td>
                </tr>
                <tr>
                    <td>전자지급 결제대행 서비스 이용약관 동의</td>
                    <td style="cursor: pointer; text-decoration:underline; color: grey;">보기</td>
                </tr>
                <tr>
                    <td>위 내용을 확인 하였으며 결제에 동의합니다.</td>
                    <td><input type="checkbox" id="agreeCheck"></td>
                </tr>
            </table>

            <div style="width: 900px; height: 1px; border-bottom: 1px dashed #222; margin-bottom: 30px; margin-top: 80px;"></div>
            <div id="payment-btn" onclick="if(checkOrderSheet()){ payment(); }"><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>원 결제하기</d>
    
        </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    
        
        

        <script>

            // 전화번호 유효성 체크 및 포맷
            checkPhone = function(tag) {

                if($(tag).val() != '') {
                    // 숫자 이외의 문자 제거
                    let input = $(tag).val().replace(/\D/g,'');

                    if (!/^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/.test(input)) {
                        $('#recipientPhoneStatus').html('전화번호를 올바르게 입력해주세요.');
                    } else {
                        $('#recipientPhoneStatus').html('');
                    }

                    let formatted = input.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
                    $(tag).val(formatted);
                }

            }

            // 입력한 태그로 스크롤 이동 및 포커스
            moveScroll = function(tag) {
                $('html, body').animate({
                    scrollTop: tag.offset().top - 400 // 해당 태그 위로 400px 여유
                }, 500);
                tag.focus();
            }

            // 주문서 유효성 체크
            checkOrderSheet = function() {

                let recipientNameTag = $('#recipientName');
                let recipientPhoneTag = $('#recipientPhone');
                let postcodeTag = $('#postcode');
                let detailAddressTag = $('#detailAddress');
                let paymentMethodChk = $('[name="paymentMethod"]:checked').length;
                let agreeCheckTag = $('#agreeCheck');

                if(recipientNameTag.val() == '') {
                    alert('수취인 성함을 입력해주세요.');
                    moveScroll(recipientNameTag);
                    return false;
                }

                if(recipientPhoneTag.val() == '') {
                    alert('수취인 전화번호를 입력해주세요.');
                    moveScroll(recipientPhoneTag);
                    return false;
                } else if (!/^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/.test(recipientPhoneTag.val().replace(/\D/g,''))) {
                    alert('수취인 전화번호를 올바르게 입력해주세요.');
                    moveScroll(recipientPhoneTag);
                    return false;
                }

                if(postcodeTag.val() == '') {
                    alert('주소를 입력해주세요.');
                    moveScroll(postcodeTag);
                    return false;
                }
                
                if(detailAddressTag.val() == '') {
                    alert('상세주소를 입력해주세요.');
                    moveScroll(detailAddressTag);
                    return false;
                }

                if(paymentMethodChk == 0) {
                    alert('결제수단을 선택해주세요.');
                    $('html, body').animate({
                        scrollTop: $('#kakaopay').offset().top - 400 // #recipientName 위로 400px 여유
                    }, 500);
                    return false;
                }

                if(!agreeCheckTag.is(':checked')) {
                    alert('개인 정보 및 이용 등에 관한 약관을 확인 후 동의해주세요.');
                    return false;
                }

                return true;

            }

            

            // 결제수단, 주문상태
            let orderStatus = '결제완료';
            let paymentMethod = '';
            $('[name=paymentMethod]').filter(function() {
                $(this).click(function() {
                    paymentMethod = $(this).val();
                    if(paymentMethod == 'vbank')  {
                        orderStatus = '입금전';
                    }

                    $('#payment-tbl').find('td').find('div').removeClass('selectedPayment');
                    $(this).closest('td').find('div').addClass('selectedPayment');
                });
            });



            // 주문자 = 수령인
            same = function(checkboxTag) {
                if(checkboxTag.checked) {

                    let memberAddr = '${orderer.memberAddr}';
                    let split = memberAddr.split('/ ');

                    let addr = split[0];
                    let detailAddr = split[1].substr(0, split[1].length - 8);
                    let postcode = split[1].substr(split[1].length - 6, 5);
                    
                    $('#recipientName').val('${orderer.memberName}');
                    $('#recipientPhone').val('${orderer.memberPhone}'.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'));
                    $('#address').val(addr);
                    $('#detailAddress').val(detailAddr);
                    $('#postcode').val(postcode);
                } else {
                    $('#recipientName').val('');
                    $('#recipientPhone').val('');
                    $('#address').val('');
                    $('#detailAddress').val('');
                    $('#postcode').val('');
                }
            }


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


            payment = function() {

                let resultMsg = ''; 
                let orderDate = new Date();

                var IMP = window.IMP;
                IMP.init('imp64001400');
    
                IMP.request_pay({
                    pg :            'html5_inicis',
                    pay_method :     paymentMethod,                 // 결제수단 - 카페, 네페, 삼페, 신카, 가상계좌
                    merchant_uid :   getOrderNo(orderDate),         // 주문번호
                    name :          '${orderName}',                 // OOO 외 n건 
                    amount : 100,                                   // 결제금액 - 무조건 100으로
                    // amount :        '${totalPrice}',             // 결제금액 - 총금액
                    buyer_email :   '${orderer.memberEmail}',       // 주문자이메일 - 비워놓고 입력바등면ㅇ안대나?
                    buyer_name :    '${orderer.memberName}',        // 주문자명 - 주문자정보 가져오기 아예 컨트롤러에서 가져와서 쏴줘야될듯!
                    buyer_tel :     '${orderer.memberPhone}',       // 주문자연락처 	
                    vbank_due :     getOrderNo(orderDate).substr(0, 8) + '2400',  // 가상계좌 입금기한 : 당일 밤12시까지 = 다음날 00시까지
                }, function(rsp) {
                    // console.log(rsp);
                    if(rsp.success) {

                        // 결제 검증
                        $.ajax({
                            url : '/order/verifyiamport/' + rsp.imp_uid,
                            type : 'POST'
                        }).done(function(verifyResult) {
                            // console.log(verifyResult);
                            if (rsp.paid_amount == verifyResult.response.amount) {
                                // 검증 후 결제 요청한 금액과 실제 결제 결과 금액이 같다면
                                // 결제 성공 + DB에 넣기
                                let orderNo = rsp.merchant_uid;
                                let order = {
                                    'orderNo'           : orderNo,
                                    'orderDateMilis'    : orderDate.getTime(),
                                    'orderStatus'       : orderStatus,
                                    'memberNo'          : '${orderer.memberNo}',
                                    'recipientName'     : $('#recipientName').val(),
                                    'recipientPhone'    : $('#recipientPhone').val().replace(/\D/g,''),
                                    'deliveryAddr'      : $('#address').val() + '/ ' + $('#detailAddress').val() + ' (' + $('#postcode').val() + ')',
                                    'deliveryMsg'       : $('#deliveryMsg').val(),
                                    'trackingNo'        : ''
                                }

                                let oDetails = [];
                                $('[id^="perfumeNo"]').each(function(index){
                                    let oDetail = {
                                        'orderNo'       : orderNo, // Replace with your Order Number logic
                                        'perfumeNo'     : $('#perfumeNo' + index).val(),
                                        'orderQuantity' : $('#orderQuantity' + index).val(),
                                        'perfumePrice'  : $('#perfumePrice' + index).val(),
                                        'reviewStatus'  : 0
                                    }
                                    oDetails.push(oDetail);
                                });

                                let oPayment = {
                                    'paymentNo'         : rsp.imp_uid,
                                    'orderNo'           : orderNo,
                                    'paymentDateMilis'  : verifyResult.response.paidAt,
                                    'paymentMethod'     : rsp.pay_method,
                                    'paymentStatus'     : rsp.status,
                                    // 'paymentAmount'     : rsp.paid_amount,
                                    'paymentAmount'     : '${totalPrice}',
                                    'cancelAmount'      : 0,
                                    'vbankNo'           : rsp.vbank_num,
                                    'vbankName'         : rsp.vbank_name,
                                    'vbankDateMilis'    : verifyResult.response.vbankDate
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
                                }).done(function(result) {
                                    if (result == 1) {
                                        // 결제 성공 + DB들어감
                                        // 구매한 상품 장바구니 비우기 및 구매 수량만큼 재고 감소
                                        let list = [];
                                        $('[id^=cartNo]').each(function() {
                                            let value = $(this).val();
                                            list.push(value);
                                        });

                                        // 재고 먼저 감소한 다음
                                        $.ajax({
                                            url: '/perfume/minusStock'
                                            , type: 'POST'
                                            , traditional: 'true'
                                            , data: {
                                                'cartNoArr': list
                                            }
                                        }).done(function(result) {
                                            // 그담에 장바 비우기
                                            $.ajax({
                                                url: '/cart/removeCart'
                                                , type: 'POST'
                                                , traditional: 'true'
                                                , data: {
                                                    'arr': list
                                                }
                                            }).done(function(result) {
                                                if (result == 'success') {
                                                    // 장바 삭제 성공
                                                } else if (result == 'fail') {
                                                    // 장바 삭제 실패
                                                } else if (result == 'error') {
                                                    // 에러발생
                                                }
                                                // 결제 성공 페이지 
                                                location.href='/order/orderResult/' + orderNo;
                                            });
                                        });
                                    } else {
                                        // 결제 성공 but DB실패
                                        // alert 띄우고 결제 취소 해주기
                                        resultMsg = '[결제 실패!] 승인된 결제는 1시간 이내로 취소될 예정입니다.';
                                        alert(resultMsg);
                                        cancelPay(rsp.imp_uid);
                                    }
                                });
                            } else {
                                // 검증 후 결제 요청한 금액과 실제 결제 결과 금액이 같지 않다면
                                // alert 띄우고 결제 취소 해주기
                                resultMsg = '[결제 실패!] 결제 요청 금액과 실제 결제 금액이 일치하지 않습니다.';
                                alert(resultMsg);
                                cancelPay(rsp.imp_uid);
                            }
                        });
                    } else {
                        // 결제 실패
                        resultMsg = '[결제 실패!]' + rsp.error_msg;
                        alert(resultMsg);
                    }
                });
            }

            // 결제 취소
            cancelPay = function(paymentNo) {
                $.ajax({
                    url : '/order/cancelPay'
                    , type : 'POST'
                    , data : {
                        'paymentNo'        : paymentNo,
                        'cancelAmount'     : 100,              // 환불금액
                    },
                }).done(function(result) {
                    if (result != 1) {
                        alert('[취소 실패!] 고객센터로 문의해주세요.\n' + result)
                    }
                });
            }








            // 주소
            addrSearch = function() {
                new daum.Postcode({
                    oncomplete : function(data) {

                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') {
                            // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', '
                                    + data.buildingName
                                    : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("address").value = extraAddr;

                        } else {
                            document.getElementById("address").value = '';
                        }

                        // 우편번호 + 주소(도로명,지번) + 참고항목
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("address").value = addr + extraAddr;
                        // 위에가 다 입력될시 커서포커스를 상세주소입력칸으로 이동 
                        document.getElementById("detailAddress").focus();
                        }
                    }).open();
            }
        </script>
    </body>
</html>