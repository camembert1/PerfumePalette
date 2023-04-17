<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 관리</title>
		<style>
/* 			모달 css */
			.modal {
		        position: absolute;
		        top: 0;
		        left: 0;
				
		        width: 100%;
		        height: 100%;
		
		        display: none;
		
		        background-color: rgba(0, 0, 0, 0.4);
		    }
		    .modal.show {
			  display: block;
			}
			
			.modal_body {
			  position: absolute;
			  top: 50%;
			  left: 50%;
			
			  width: 500px;
			  height: 600px;
			
			  padding: 40px;
			
			  text-align: center;
			
			  background-color: rgb(255, 255, 255);
			  border-radius: 10px;
			  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			
			  transform: translateX(-50%) translateY(-50%);
			}
		</style>
	</head>
	<body>
		<h1>회원 관리</h1>

		<table>
			<thead>
				<tr>
					<th><input type="checkbox" class="allCheck"></th>
					<th>번 호</th>
					<th>이 름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>등록일</th>
					<th>수 정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${amList }" var="member" varStatus="i">
					<tr>
						<td class="td"><input type="checkbox" class="check"></td>
						<td class="td">${i.count }</td>
						<td class="td">${member.memberName }</td>
						<td class="td">${member.memberId }</td>
						<td class="td">${member.memberPw }</td>
						<td class="td">${member.memberNickname }</td>
						<td class="td">${member.memberEmail }</td>
						<td class="td">${member.memberPhone }</td>
						<td class="td">${member.memberAddr }</td>
						<td class="td">${member.memberDate }</td>
						<td class="td"><button class="modal_btn" data-target="#modal${i.index }">수정하기</button></td>
					</tr>
					<!-- 		여기서부터 모달 -->
					<form action="/member/amList" method="post">
					<input type="hidden" class="" name="memberNo" value="${member.memberNo }"/>
					<div class="modal" id="modal${i.index }">
			      		<div class="modal_body">
			      			<h1>${member.memberNickname } 님의 상세정보입니다.</h1>
			      			<div class="Detail_box">
				                <div>
				                    <label>아이디</label>
				                    <input type="text" class="" name="memberId" value="${member.memberId }"/>
				                </div>
				                <div>
				                	<label>비밀번호</label>
				                	<input type="password" class="" name="memberPw" value="${member.memberPw }">
				                </div>
				      			<div>
				                    <label>이름</label>
				                    <input type="text" class="" name="memberName" value="${member.memberName }"/>
				                </div>
				      			<div>
				                    <label>닉네임</label>
				                    <input type="text" class="" name="memberNickname" value="${member.memberNickname }"/>
				                </div>
				      			<div>
				                    <label>이메일</label>
				                    <input type="text" class="" name="memberEmail" value="${member.memberEmail }"/>
				                </div>
				      			<div>
				                    <label>전화번호</label>
				                    <input type="text" class="" name="memberPhone" value="${member.memberPhone }"/>
				                </div>
				      			<div>
				                    <label>주소</label>
				                    <input type="text" class="" name="memberAddr" value="${member.memberAddr }" readonly/>
				                </div>
			      			</div>
			      			<div>
				      			<button class="modal_modify">수정하기</button>
				      			<button type="button" class="modal_close">닫기</button>
			      			</div>
			      		</div> <br>
			   	 	</div>
			   	 	</form>
<!--    	 	모달 끝~ -->
				</c:forEach>
			</tbody>
		</table>
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
		
		// modal, modal_btn, modal_close의 요소를 가져옴
		const modals = document.querySelectorAll('.modal');
    	const btnOpenPopup = document.querySelectorAll('.modal_btn');
    	const btnClosePopup = document.querySelectorAll('.modal_close');
		
    	// 각각의 btnOpenPopup요소에 대해 반복문 수행
    	btnOpenPopup.forEach((btn, i) => {
    		// 클릭시 이벤트 리스너 등록
    		btn.addEventListener('click', () => {
    			// data-target 속성의 값을 가져옴
    			const target = btn.dataset.target;
    			// 해당 요소를 보옂기 위해 디스플레이 속성값 블럭으로 변경
    			document.querySelector(target).style.display = 'block';
    		});
    	});
    	// 각각의 btnClosePopup요소에 대해 반복문 수행
		btnClosePopup.forEach((btn) => {
			btn.addEventListener('click', () => {
// 가장 가까운 modal 요소를 찾아서 display 속성 값을 none으로 변경하여 모달 닫기
				const modal = btn.closest('.modal');
				modal.style.display = 'none';
			});
		});
		</script>
	</body>
</html>