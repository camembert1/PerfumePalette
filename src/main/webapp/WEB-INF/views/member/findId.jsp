 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../../../resources/memberCss/findId.css" />
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

        <form action="/member/findId" method="post">
          <h1>아이디 찾기</h1>

          <div class="radioDiv">
            <input
              type="radio"
              id="findByEmail"
              name="findType"
              value="memberEmail"
             checked
            />
            <label for="findByEmail">이메일로 찾기</label>

            <input
              type="radio"
              id="findByPhone"
              name="findType"
              value="memberPhone"
            />
            <label for="findByPhone">전화번호로 찾기</label><br />
          </div>

          <br />
          <div class="contetnBox">
          
              <div class="input-box">
                <label for="name" class="contentLabel">이름</label>
              	<input type="text" name="memberName" />
              </div>

              <div id="emailDiv" class="input-box">
                <label for="memberEmail" class="contentLabel">이메일</label>
              	<input type="email" id="email" name="memberEmail"  />
              </div>

              <div id="phoneDiv" class="input-box" style="display: none;">
                <label for="memberPhone" class="contentLabel">전화번호</label>
              	<input type="text" id="phone" name="memberPhone" />
              </div>
          </div>

          <br />
          <button type="submit" onclick="checkInput(event)">확인</button>
        </form>
      </div>
    </main>
    <jsp:include page="../common/footer.jsp" />

    <script>
      const emailRadio = document.getElementById("findByEmail");
      const phoneRadio = document.getElementById("findByPhone");

      const emailDiv = document.getElementById("emailDiv");
      const phoneDiv = document.getElementById("phoneDiv");

      // 라디오 버튼 값이 변경될 때마다 실행되는 함수
      function toggleInputFields() {
        if (emailRadio.checked) {
          emailDiv.style.display = "flex";
          phoneDiv.style.display = "none";
        } else {
          emailDiv.style.display = "none";
          phoneDiv.style.display = "flex";
        }
      }

      // 라디오 버튼의 change 이벤트에 togglePhoneNumberInput 함수를 바인딩
      emailRadio.addEventListener("change", toggleInputFields);
      phoneRadio.addEventListener("change", toggleInputFields);
      
      
      
      
      // required 대신 js로 alert 창 띄우기 
      function checkInput(event) {
    	    const nameInput = document.getElementsByName("memberName")[0];
    	    const emailInput = document.getElementsByName("memberEmail")[0];
    	    const phoneInput = document.getElementsByName("memberPhone")[0];
    	    const selectedOption = document.querySelector('input[name="findType"]:checked').value;

    	    if (!nameInput.value) {
    	      alert("이름을 입력하세요.");
    	      event.preventDefault(); 		// submit 이벤트 취소
    	    } else if (selectedOption === "memberEmail" && !emailInput.value) {
    	      alert("이메일을 입력하세요.");
    	      event.preventDefault(); 
    	    } else if(selectedOption === "memberPhone" && !phoneInput.value) {
    	    	alert("전화번호를 입력하세요.");
      	      	event.preventDefault();
    	    }
    	  }
    </script>
  </body>
</html>
