<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글</title>
<link rel="stylesheet" href="../../../resources/memberCss/myComment.css" />
<!-- favicon : 탭에 보이는 아이콘 -->
    <link rel="icon" href="../../resources/img/common/favicon.png" />
    <link
      rel="apple-touch-icon"
      href="../../resources/img/common/favicon.png"
    />
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <main>
      <!-- 헤더 부분 피하기 위한 div -->
      <div id="forHeader"></div>
      <!-- 본문 내용 가운데 정렬 위한 div -->
      <div id="forCenter">
        <!-- 사이드바 -->
        <div id="hrefList">
          <div id="hrefName">${member.memberName }님</div>
          <span><a href="/member/myPage">마이페이지</a></span>
          <span><a href="/member/orderList">주문내역조회</a></span>
          <span><a href="/member/myReview">작성후기</a></span>
          <span><a href="/member/myQna">작성문의</a></span>
          <span><a href="/member/myComment">작성댓글</a></span>
          <span><a href="/member/bye">회원탈퇴</a></span>
        </div>

        <!-- 여기부터 내용 입력하시면 됩니다! -->

<div class="content">
        <h1>내가 작성한 댓글</h1>
        <table>
            <thead>
                <!-- 테이블 헤더 -->
                <tr>
                    <th><input type="checkbox" class="allCheck" id="thCheck" ></th>
                    <th>ㅇ?</th>
                    <th>내용</th>
                    <th>작성일</th>
                    
                </tr>
            </thead>
            <tbody>
            <!-- 테이블 본문 -->
            <tr>
              <td><input type="checkbox" name=""></td>
              <td>[디올] 옴므 코롱</td>
              <td>향수 패키지가 정말 예쁘네용</td>
              <td>2023-04-01</td>
            </tr>
            
            <tr>
              <td><input type="checkbox" name=""></td>
              <td>[디올] 옴므 코롱</td>
              <td>뻥이에요</td>
              <td>2023-04-01</td>
            </tr>
          </tbody>
        </table>
        <tfoot>
          	<tr style="border: none;">
          		<td><button type="button" id="del" style="margin-top: 30px;">선택삭제</button></td>
          	</tr>
          </tfoot>
      </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
    
    <script>
 // 전체 선택 박스   
	var allCheck = document.querySelector(".allCheck");
	var list = document.querySelectorAll(".check");
	allCheck.onclick = () => {
		if(allCheck.checked) {
			for(var i = 0; i < list.length; i++) {
				list[i].checked = true;
			}
		} else {
			for(var i = 0; i < list.length; i++) {
				list[i].checked = false;
			}
		}
	}
	
	// 선택 박스 클릭
	var list = document.querySelectorAll(".check");
	for (var i = 0; i < list.length; i++) {
	  list[i].addEventListener('click', function () {
	    var isAllChecked = true;
	    for (var j = 0; j < list.length; j++) {
	      if (!list[j].checked) {
	        isAllChecked = false;
	        break;
	      }
	    }
	    if (isAllChecked) {
	      allCheck.checked = true;
	    } else {
	      allCheck.checked = false;
	    }
	  });
	}
	
	
	// 선택 삭제 
	document.querySelector("#del").addEventListener('click', function() {
		
		// 선택된 체크박스들의 value값을 저장할 배열을 선언 
		var del = new Array();
		
		// .check 클래스를 가진 요소들을 모두 선택하여 배열에 담음 
		var list = document.querySelectorAll(".check");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				del.push(list[i].value);
			}
		}
		
		// del 배열이 비어있는 경우 경고창 띄우고 함수 종료하기 
		if(del.length === 0 ) {
			alert("삭제할 항목을 선택해 주세요.");
			return;
		}
		
		// "선택한 댓글을 삭제 하시겠습니까?" 라는 메시지와 함께 확인/취소 버튼이 있는 경고창 띄우기
		if(confirm("선택한 댓글을 삭제 하시겠습니까?")) {
			// Ajax를 이용하여 서버에 선택한 체크박스의 value 값을 전송하여 삭제
			$.ajax({
				url:'/member/removeReview',
				type : 'post',
				dataType : 'json',
				traditional : 'true',
				data : {'arr':del},
				success : function(data){
					// 삭제가 성공적으로 이루어졌을 경우, "삭제되었습니다." 라는 경고창 띄우기
					if(data == 1) {
						alert("삭제되었습니다.");
						// 삭제 완료되면 내 작성댓글 페이지 그대로 유지
						location.href = "/member/myComment";
					}
				},
				error : function(data) {
					console.log(data)
				}
			});
		}
	});
    </script>
</body>
</html>