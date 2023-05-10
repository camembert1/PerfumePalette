# PerfumePalette
6남매 - 파이널프로젝트

# 목차
* 프로젝트 소개
* 개발 기간
* 팀원 소개
* 개발 환경
* 기술 스택
  * 회원관리
  * MBTI
  * 상품 SHOP
  * 상품 결제
  * 찜 & 
  * 알림
  * 채팅 기능
  * 문의 게시판
  * 후기 게시판
  * 마이페이지(일반회원, 관리자)
* 실행화면

# 💝 프로젝트 소개
Perfume Palette는 요즘 MZ세대 사이에서 니치향수에 대한 관심이 높아지고 있는 추세에 맞추어 성향과 취향을 고려한 
맞춤형 추천 시스템인 MBTI 향수 추천과 함께 사용자들이 향수를 보다 쉽게 이해하고 선택, 추천할 수 있도록 도움을 주는 사이트입니다.

# 📆 개발 기간
```
2023.03.27 ~ 2023.05.09
```

# 👪 멤버 구성
![팀원 1](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/bcc99fa4-a2e4-483e-b1ed-e5cf14e58805)
![팀원 2](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/eceb2fed-1525-48cc-9547-2575c0e5dfb7)

# 💻 개발 환경
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"> <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=for-the-badge&logo=Visual Studio Code&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> <img src="https://img.shields.io/badge/MyBatis-black?style=for-the-badge&logo=Apache MyBatis&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

# 🔧 기술 스택
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">

# 주요 기능 및 상세
## 1. 회원관리

|기능|내용|
|------|---|
|회원가입|개인정보를 입력하여 회원가입(유효성검사와 Ajax를 활용)|
|로그인|세션을 이용하여 로그인 구현, AdminCheck(Boolean) 값을 이용해 관리자와 회원 구분|
|아이디, 비밀번호 찾기|회원가입시 입력했던 정보를 통해 아이디를 알려주고, 비밀번호는 변경할 수 있다.|

## 2. MBTI
|기능|내용|
|------|---|
|MBTI 추천|회원들은 메인화면에 있는 MBTI테스트의 12가지 질문을 통하여 나의 성향과 취향을 알아볼 수 있으며 취합한 정보를 통하여 향수 추천을 받아 볼 수 있다. 비회원도 이용 가능하지만 결과를 보려면 가입 or 로그인이 필요하다.| 

## 3. 상품 SHOP

|기능|내용|
|------|---|
|상품 목록|판매중인 상품 목록을 볼 수 있다. 마음의 드는 상품은 찜 목록 추가 가능하며, 향수의 종류, 브랜드, 가격을 선택하여 검색 가능하고, 이미지를 클릭하면 상세페이지를 볼 수 있다.|
|상품 비교함|상품 리스트 페이지 좌측에 항상 노출된다. 비교함을 통해 상품의 향, 용량, 가격, 25ml당 가격을 한 눈에 볼 수 있으며 상세보기가 가능하다.|
|상품 상세|상세 페이지에서 바로구매 / 장바구니 / 찜 / sns공유/ 재입고 알림 서비스를 이용할 수 있다.(재고가 없을 경우 재입고 알림 버튼 노출) 또, 해당 상품의 재고가 5개 미만인 경우 재고 정보 표시한다. 바로구매를 선택 시 수량 선택후 구매 페이지 이동, 찜과 장바구니 선택 가능, 선택 상품의 정보를 sns공유 api룰 통하여 사람들에게 전달가능하다.|
|페이징|한 페이지당 16개의 상품이 보이도록 처리|

## 4. 상품 구매

|기능|내용|
|------|---|
|결제 정보|배송 정보와 결제 수단(신용카드, 가상계좌, 카카오페이, 네이버페이, 삼성페이) 개인정보 제공에 대한 동의를 입력받는다.|
|결제|결제하기 선택 시 결제 페이지로 이동하며, 결제 api를 통해 결제할 수 있다.

## 5. 찜 & 장바구니

|기능|내용|
|------|---|
|찜|회원은 상품 목록이나 상품 상세에서 찜하기 가능하며, 찜 목록에서 장바구니에 담을 수 있다다.|
|장바구니|회원은 상품 상세에서 장바구니 등록 가능하며 장바구니 목록에서 상품 선택 후 결제 OR 삭제 가능하다.|

## 6. 알림
|기능|내용|
|------|---|
|회원 알림|어떻게 적어야할지 모르겠어요..|

## 7. 채팅 기능
|기능|내용|
|------|---|
|1:1고객센터|회원은 오른쪽 하단의 아이콘을 통해 관리자에게 실시간 1:1 채팅을 통하여 문의 할 수 있다.|

## 8. 문의 게시판
|기능|내용|
|------|---|
|문의 게시판|상품이나, 배송, 교환, 환불, 기타에 관한 문의를 하는 게시판이다. 상품의 상세페이지와 문의 게시판에서 작성 가능하며, 비공개를 원할 시 비밀번호 입력을 통하여 글쓴이만 볼 수 있다. 글 작성, 수정 가능하다.|
|댓글|회원이 남긴 문의 글에는 관리자가 답글을 남겨줄 수 있다.|
|페이징|한 페이지 당 10개의 글을 볼 수 있다.|

## 9. 후기 게시판
|기능|내용|
|------|---|
|후기 게시판|회원들이 상품의 정보를 얻을 수 있는 게시판이다. 후기게시판은 글 작성(구매자), 수정, 삭제, 좋아요, 신고가 가능하다.|
|신고|회원들은 구매회원들의 후기글을 보고 신고사유(욕설/혐오/차별적 표현, 부적절한 내용, 기타)와 함께 글을 작성하여 신고 가능하다.|
|댓글|댓글과 대댓글 작성, 수정, 삭제 가능하고 여러명이 작성 가능하다.
|페이징|한 페이지당 10개의 게시물을 보여준다.|

## 10. 마이페이지(일반회원, 관리자)
### 10-1 일반회원
|기능|내용|
|------|---|
|마이페이지|회원은 마이페이지에서 회원의 정보를 확인 가능하며 닉네임, 비밀번호, 이름, 이메일, 휴대번호, 주소에 대해 수정이 가능하다.|
|주문내역 조회|회원이 구매한 제품의 주문번호, 주문상품, 상품가격, 주문수량, 총 결제금액, 주문상태(입금 전, 결제완료, 배송준비중, 배송중, 배송완료, 취소), 후기작성을 확인할 수 있고, 주문상태가 배송완료가 되면 후기 작성이 가능하게 된다.|
|작성 문의|회원이 작성한 문의 글을 확인할 수 있으며, 분류(배송, 교환, 환불, 기타), 제목, 작성일, 답변상태(관리자의 답변 유/무)를 확인할 수 있고, 회원이 작성한 문의는 선택 후 삭제 가능하다.|
|작성 후기|회원이 작성한 후기 글을 확인할 수 있으며, 상품 이미지, 브랜드, 상품명, 작성일, 조회수 확인 가능하며 이미지와 내용을 통해 후기 상세페이지로 이동하고, 회원이 작성한 후기는 체크박스 선택 후 삭제 가능하다.|
|작성 댓글|회원이 작성한 댓글을 확인할 수 있으며, 상품명, 브랜드, 내용, 작성일 확인 가능하고, 내용 클릭 시 자신이 작성한 댓글 페이지로 이동한다. 체크박스 선택 후 삭제 가능|
|회원 탈퇴|회원은 회원탈퇴를 선택하여 비밀번호 입력 후 회원 탈퇴 가능하다.(DB에는 남아있음)|

### 10-2 관리자
|기능|내용|
|------|---|
|판매상품 관리|상품 관리 페이지는 상품의 등록, 수정, 삭제 가능하며, 상품의 정보(이미지, 브랜드, 상품명(상품 상세 이동 가능), 용량, 가격, 재고, 향 분류, 이미지 분류, 찜 수, 장바구니 수, 노출여부, 수정)를 확인하고, 상품 선택 후 상품의 노출, 비노출, 삭제 가능하다.|
|주문내역관리|회원들이 구매한 제품의 주문번호, 주문상태, 구매자, 수취인, 주문 상품, 가격 등 필수 항목들을 볼 수 있고, 상세보기를 통해 상품정보, 결제정보, 주문정보에 대한 내용들을 상세히 볼 수 있으며 주문상태를 수정해 줄 수 있다.|
|회원관리|회원의 대략적인 정보를 볼 수 있으며 수정을 통해 상세정보와 함께 정보 수정이 가능하다. 체크박스를 통해 회원들을 정지, 활성, 완전한 삭제가 가능하다.|
|문의관리|회원들이 작성한 문의 글을 확인할 수 있으며, 분류(배송, 교환, 환불, 기타), 이미지, 브랜드, 상품명, 제목, 작성일, 답변상태(관리자의 답변 유/무)를 확인할 수 있고
|후기관리|회원들이 작성한 후기 글을 확인할 수 있으며, 별점, 상품 이미지, 브랜드, 상품명, 작성일, 조회수, 신고수, 후기상세 확인 가능하며 후기 상세를 통해 후기 상세페이지로 이동하고, 신고수를 통해 신고한 회원 리스트와 상세를 확인할 수 있다. 회원이 작성한 후기는 체크박스 선택 후 삭제 가능하다.|
|검색| 각 관리 페이지에는 상품이나 회원에 대한 검색 기능이 있다.|
|페이징|한 페이지 당 10개의 글을 볼 수 있다.|

# 📹 실행화면
## 1. 메인화면
![메인](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/ec3966d0-ea3f-4db1-adc1-6acfb5a43346)
![메인2](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/1d474d27-110e-4126-a8a2-ed1cb58c6ad9)
![메인3](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/85079ba0-7635-4aa1-b5ff-13003e8b8ccd)

## 2. MBTI
![mbti](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/271208a7-c6d7-431e-a28a-f9a818d3690c)
![MBTI2 1](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/6eb9146b-f589-4465-a383-ba5cb8d5bd13)

## 3. 상품 SHOP
![상품 리스트](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/901d7233-a2e1-4f3d-b081-df0767926398)
![비교함](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/ca5607a0-156f-49ff-a392-bf8186e05aff)
![상품 상세](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/9e40778d-cd75-4c74-a1d4-150cd9d78e76)
![상품 상세_후기](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/44640c4e-cd80-4578-b8fc-f65c7d35937b)
![상품 상세_문의](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/f7de7d2a-2a3a-4bda-b3f9-ff6c1c8cba5e)
![상품상세_sns](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/79fd0ff6-0751-46d5-8af1-a97418df8c11)

## 4. 상품 구매
![상품 주문](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/94f9852a-5693-4326-b36b-1028b27a5338)
![image](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/3d0cd7fa-d0ef-42c1-9cda-f6a2b8fc435a)

## 5. 찜 & 장바구니
![찜 리스트](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/48788482-37dc-4509-92c9-75a43a7d53be)
![장바구니 리스트](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/d6c52874-5647-4647-a279-4e174971548e)

## 6. 알림
![알림](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/a9d9c175-a89f-43d1-b466-6d83ee94a707)

## 7. 채팅
![1ㄷ1채팅](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/f64885be-1def-49f9-bbc1-d89370b27e85)

## 8. 문의 게시판
![문의 작성](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/4c1726da-4684-47fe-a13d-5697a3be28c8)
![문의 수정](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/5501d14a-21ca-4cfa-b1b1-1d3301470aee)
![문의 게시판 리스트](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/8cec6339-6af6-45bb-a9a2-a5e4bcb67416)
![문의 상세](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/ccfb2f38-a8ce-4cd5-82de-f50d22d20e2c)

## 9. 후기 게시판
![리뷰 등록](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/5a9e2e25-f7f1-4160-93a9-e350fa2bc02d)
![리뷰 수정](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/b273265c-ea8e-4dc3-986b-22dfcafaa45c)
![리뷰 리스트](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/d0e27430-dd5e-4084-a1a9-0ae0dde0a458)
![리뷰 상세](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/1a1ecb1f-2861-47b4-9b58-8cdca5b24ac4)

## 10. 마이페이지 회원
### 10.1 정보_수정
![마이페이지 회원 정보_수정](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/5844bfd9-25f8-4c3f-bb39-733559a0634b)

### 10.2 주문내역 조회
![주문조회](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/9dc20288-5c4d-4c92-997f-ffa36b835686)

### 10.3 작성 문의
![작성 문의 회원](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/0c914044-5a5d-4808-8400-69b2ff473afd)

### 10.4 작성 후기
![작성 후기 회원](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/bbc98c7b-86d3-4cb9-ad74-1373ec47fd8c)

### 10.5 작성 댓글
![작성 댓글](https://github.com/2211SpringCloudWebApp/PerfumePalette/assets/119032790/36d1ee3d-04e1-4239-8c1f-acadbb057358)


## 11 관리자




















