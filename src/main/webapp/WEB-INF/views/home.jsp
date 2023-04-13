<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
   <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

   <link rel="stylesheet" href="../../resources/commonCss/home.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

   <!-- favicon : 탭에 보이는 아이콘 -->
   <link rel="icon" href="../../resources/img/common/favicon.png" />
   <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />
</head>

<body>

   <header>
      <div id="logo-area">
         <div id="logo-img" onclick="location.href='/'"></div>
      </div>

      <div id="navBar-area">

         <div id="nav-left">
            <div class="nav-left-title">
               <div>Perfume</div>
               <div class="nav-left-hidden">
                  <div class="nav-left-bar"></div>
                  <div class="nav-left-detail">
                     <div>Shop</div>
                     <div>Recommend</div>
                  </div>
               </div>
            </div>

            <div class="nav-left-title">
               <div>Community</div>
               <div class="nav-left-hidden">
                  <div class="nav-left-bar"></div>
                  <div class="nav-left-detail">
                     <div>Review</div>
                     <div>Q&A</div>
                  </div>
               </div>
            </div>
         </div>

         <div id="nav-right">
            

            <!-- 비로그인 상태 -->
            <c:if test="${sessionScope.member eq null }">
               <div onclick="location.href='/member/enroll'"><img src="../../resources/img/common/user.png" alt=""></div>
               <div onclick="location.href='/member/login'"><img src="../../resources/img/common/login.png" alt=""></div>
            </c:if>

            <!-- 로그인 상태 -->
            <c:if test="${sessionScope.member ne null }">

               <!-- 관리자가 아니라면 마이페이지 -->
               <c:if test="${sessionScope.member ne 'admin' }">
                  <div id="alert-hover-area">
                     <img onclick="location.href='/member/myPage/${sessionScope.member}'" src="../../resources/img/common/user.png" alt="">

                     <div id="alert">
                        <div onclick="location.href='/member/myPage/${sessionScope.member}'">${sessionScope.nickname }님 마이페이지</div>

                     </div>

                  </div>
               </c:if>

               <!-- 관리자가 맞다면 관리자페이지 -->
               <c:if test="${sessionScope.member eq 'admin' }">
                  <div onclick="location.href='#'">Manager Page</div>
               </c:if>

               <div onclick="location.href='/member/logout'"><img src="../../resources/img/common/logout.png" alt=""></div>

            </c:if>


            <div><img src="../../resources/img/common/cart.png" alt=""></div>
            <div><img src="../../resources/img/common/wish.png" alt=""></div>

         </div>

      </div>
   </header>

   <main>
      <!-- 헤더 부분 피하기 위한 div -->
      <div></div>
      <!-- 
      여기부터 내용 입력하시면 됩니다.
   -->
      <!-- 여기부터 본문 시작! -->

      <section id="section-1">
         <div id="background-img">
            <div id="black">
               <c:if test="${sessionScope.mbtiResult eq null }">
                  <div onclick="location.href='/member/mbti'">MBTI</div>
               </c:if>
               <c:if test="${sessionScope.mbtiResult ne null }">
                  <div onclick="location.href='/member/mbtiResult'">MBTI</div>
               </c:if>
            </div>
         </div>
      </section>

      <section id="section-2">
         <h1 style="text-align: center">향수 사진 5개 딱!?</h1>
      </section>

      <section id="section-3">
         <jsp:include page="./common/footer.jsp" />
      </section>

   </main>

   <script>

      $(function(){

         // 새로고침할 경우 맨 위로 이동
         $(window).scrollTop(0);

         // section 요소들 저장하는 변수 선언
         const sections = $('section');

         // 현재 보여지고 있는 section 요소의 인덱스를 저장하는 변수
         let currentSectionIndex = 0;

         // 스크롤 이벤트를 throttle하기 위한 변수
         let isThrottled = false;

         // 스크롤 이벤트를 throttle하기 위한 함수
         function throttle(callback, time) {
            // 이전에 실행된 콜백 함수가 아직 실행 중인 경우 함수 실행을 중지함
            if (isThrottled) return;

            // 함수 실행이 가능하도록 isThrottled 값을 true로 변경함
            isThrottled = true;

            // 일정 시간이 지난 후에 callback 함수를 실행하고 isThrottled 값을 false로 변경함
            setTimeout(() => {
               callback();
               isThrottled = false;
            }, time);
         }

         // section별 header 속성 변경
         function changeColor() {
            switch(currentSectionIndex) {

               // section1일 때
               case 0:
                  $('header').fadeIn(500);
                  $('header').css({
                     "transition-duration": "0.5s",
                     "background-color": "#34443E00",
                     "box-shadow": "0 0px 0px rgba(0, 0, 0, 0)"
                  });
                  $('#logo-area').css({
                     "box-shadow": "inset 0px -10px 10px rgba(0, 0, 0, 0), inset 0px 10px 10px rgba(0, 0, 0, 0)"
                  });
               break;

               // section2일 때
               // timeout함수 낼 다시 활용해보자ㅜ
               // 로고가 보이는 상태라면 안 보이게
               // 안보이는 상태라면 보이게 로 바꿀 예정
               case 1:
                  // $('#logo-area').fadeOut(500);
                  setTimeout(function() {
                     $('header').fadeIn(500);
                     $('header').css({
                        "transition-duration": "0.5s",
                        "background-color": "#34443E",
                        "box-shadow": "0 10px 10px rgba(0, 0, 0, 0.2)"
                     });
                     $('#logo-area').css({
                        "box-shadow": "inset 0px -10px 10px rgba(0, 0, 0, 0.2), inset 0px 10px 10px rgba(0, 0, 0, 0.2)"
                     });   

                  }, 0);
                              
               break;

               // section3 = footer일 때
               case 2:
                  $('header').fadeOut(500);
               break;

               default:
               break;
            }
         }

         // wheel 작동 시
         $(document).on('wheel', function(event) {
            // 스크롤 방향을 확인하는 변수
            const direction = event.originalEvent.deltaY > 0 ? 1 : -1;

            // 스크롤 방향에 따라 currentSectionIndex 값을 변경함
            if (direction === 1 && currentSectionIndex < sections.length - 1) {
               currentSectionIndex++;
            } else if (direction === -1 && currentSectionIndex > 0) {
               currentSectionIndex--;
            }

            // 이부분을 헤더 관련 요소로 바꾸면 대겟다
            // fixed-element 요소의 배경색을 변경함
            changeColor();

            // 스크롤 이벤트를 throttle하여 일정 시간(0으로 설정해서 바로) 지난 후에 스크롤이 이동하도록 함
            throttle(() => {
               $('html, body').animate({
               scrollTop: sections.eq(currentSectionIndex).offset().top
               },650);
            }, 0);
         });
   });

   </script>
   
</body>

</html>