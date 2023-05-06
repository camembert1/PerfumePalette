<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
   <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>

   <link rel="stylesheet" href="../../resources/commonCss/home.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

   <!-- favicon : 탭에 보이는 아이콘 -->
   <link rel="icon" href="../../resources/img/common/favicon.png" />
   <link rel="apple-touch-icon" href="../../resources/img/common/favicon.png" />

   <!-- Swiper 슬라이더 사용 위함 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
   <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

   

</head>

<body>

   <jsp:include page="./common/header.jsp" />

   <!-- home에서만 다른 헤더 css속성 시작! -->
   <style>
      header {
         /* 헤더 배경 */
         background-color: rgba(0, 0, 0, 0);

         /* 헤더 아래 그림자 */
         box-shadow: 0 10px 10px rgba(0, 0, 0, 0);
      }

      #logo-area {
         /* 그림자로 navBar Area랑 분리하기 위함 */
         box-shadow:
                  inset 0px -10px 10px rgba(0, 0, 0, 0);
                  /* , inset 0px 10px 10px rgba(0, 0, 0, 0.2); */
      }
   </style>
   <!-- home에서만 다른 헤더 css속성 끝! -->

   <main>
      <!-- 헤더 부분 피하기 위한 div -->
      <div></div>

      <!-- 여기부터 본문 시작! -->
      <div class="swiper mySwiper">
         <div class="swiper-wrapper">

            <!-- section1 -->
            <div class="swiper-slide">
               <section id="section-1">
                  <div id="background-img">
                     <div id="black">
                        <c:if test="${sessionScope.mbtiResult eq null }">
                           <div onclick="location.href='/mbti/mbti'">
                              <div style="font-size: 15pt; color: rgba(255, 255, 255, 0.5);">버튼수정예정</div>
                              <div style="font-size: 40pt;">MBTI</div>
                              <div style="font-size: 45pt;">퍼스널 향기</div>
                              <div style="font-size: 45pt;">테스트</div>
                              <div style="font-size: 20pt;">나의 퍼스널 향기 알아보기 > </div>
                           </div>
                        </c:if>
                        <c:if test="${sessionScope.mbtiResult ne null }">
                           <div onclick="location.href='/mbti/mbtiResult'">MBTI</div>
                        </c:if>
                     </div>
                  </div>
               </section>
            </div>

            <!-- section2 -->
            <div class="swiper-slide">
               <section id="section-2">

                  <div id="section2-content">
         
                     <div class="wave-img-area">
                        <img src="../../resources/img/common/main-wave.png" alt="">
                     </div>
                     
                     <div id="section2-img-area">
                        
                        <div class="section2-img" onclick="perfumeList(this)"><div>Woody</div></div>
                        <div class="section2-img" onclick="perfumeList(this)"><div>Floral</div></div>
                        <div class="section2-img" onclick="perfumeList(this)"><div>Fruity</div></div>
                        <div class="section2-img" onclick="perfumeList(this)"><div>Spicy</div></div>
                        <div class="section2-img" onclick="perfumeList(this)"><div>Citrus</div></div>
                     </div>
                     
                     <div class="wave-img-area">
                        <img src="../../resources/img/common/main-wave.png" alt="">
                        <div id="insta-id">FOLLOW PERFUME PALETTE INSTAGRAM | @PERFUME_PALETTE</div>
                     </div>
         
                  </div>
               </section>
            </div>

            <!-- section3 footer -->
            <div class="swiper-slide">
               <section id="section-3">
                  <jsp:include page="./common/footer.jsp" />
               </section>
            </div>

         </div>
         <div class="swiper-pagination"></div>
      </div>
   </main>

   <script>

      $(function(){

         // section2 향 분류별 list 이동
         perfumeList = function(tag) {
            let pScentCategory = tag.firstChild.textContent;
            location.href="/perfume/list?pScentCategory=" + pScentCategory;
         }


         // 페이지 넘김 효과
         let swiper = new Swiper(".mySwiper", {
            on: {
               init: function() {    
                  // swiper 초기화 될때 실행
               },

               slideChangeTransitionStart: function() {
                  // 페이지 넘어갈 때마다 실행 - 헤더 변경
                  chageHeader(this.realIndex + 1)
               }
            },
            direction: "vertical", // 슬라이드 방향
            speed: 650,
            //slidesPerView: 1, // 한 슬라이드에 보여줄 개수
            effect: 'cube', // 페이지 넘어가는 효과
            spaceBetween: 30, // 슬라이드 사이 여백 
            mousewheel: true,
            // pagination: {
            //    el: ".swiper-pagination", // 버튼을 담을 태그
            //    clickable: true, // 버튼 클리기 여부
            // },
            loop: 'auto', // 슬라이드 반복 여부
            //loopAdditionalSlides: 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드 보이지 않는 현상 수정
            autoHeight: false, // 현재 활성 슬라이드에 맞게 높이 조정
            resistance: true, // 슬라이드 터치 저항 여부
            allowTouchMove: false, // 스와이핑X 버튼으로만 슬라이드 조작 가능
         });

         // 현재 페이지 index별 header 속성 변경 함수
         function chageHeader(index) {
            switch(index) {

               // section1일 때
               case 1:
                  $('header').css({
                        "display": "none",
                        "background-color": "rgba(0, 0, 0, 0)",
                        "box-shadow": "0 0px 0px rgba(0, 0, 0, 0)"
                  });
                  $('#logo-area').fadeIn(500);
                  $('header').fadeIn(500);
               break;

               // section2일 때
               case 2:
                  $('#logo-area').fadeOut(0);
                  $('header').css({
                     "display": "none",
                     "background-color": "#28302d",
                     "box-shadow": "0 10px 10px rgba(0, 0, 0, 0.2)"
                  }); 
                  setTimeout(function() {
                     $('header').fadeIn(500);                    
                  }, 100);
               break;

                // section2일 때
               case 2:
                  $('#logo-area').fadeOut(0);
                  $('header').css({
                     "display": "none",
                     "background-color": "#28302d",
                     "box-shadow": "0 10px 10px rgba(0, 0, 0, 0.2)"
                  }); 
                  setTimeout(function() {
                     $('header').fadeIn(500);                    
                  }, 100);
               break;

               // section3 = footer일 때
               case 3:
                  setTimeout(function() {
                     $('header').fadeOut(500);
                  }, 100);
               break;

               default:
               break;
            }
         }
      });

   </script>
   
</body>

</html>