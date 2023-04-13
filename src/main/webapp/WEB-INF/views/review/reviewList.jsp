<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet" href="../../../resources/reviewCss/reviewList.css">
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
		<div id="subject">REVIEW</div>
		<div id="search">
         	<select name="sortby" id="sortby-select">
			    <option value="latest">최신순</option>
			    <option value="most-viewed">조회순</option>
			    <option value="highest-rated">별점순</option>
			</select>
			<select name="perfume" id="perfume-select">
			    <option value="">향종류</option>
			    <option value="Woody">Woody</option>
			    <option value="Floral">Floral</option>
			    <option value="Fruity">Fruity</option>
			    <option value="Spicy">Spicy</option>
			    <option value="Citrus">Citrus</option>
			</select>
			<input type="text">
			<button>검색</button>
		</div>
		
		 <table border="1">
        <thead> <!-- 테이블 헤더 -->
            <tr>
                <th>별점</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody> <!-- 테이블 본문 -->
        <%-- <c:forEach items="${rList }" var="review"> --%>
            <tr>
                <td>5</td>
                <td>
                	<div>
                		<a href="">
	                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
	                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
	                    </a>
                    </div>
                </td>
                <td>닉네임</td>
                <td>2023-04-08</td> 
                <td>102</td>
            </tr>
         <%-- </c:forEach> --%>
            <tr>
                <td>
                	<fieldset>
			            <input type="radio" name="reviewStar" value="5" id="rate1">
			            <label for="rate1">★</label>
			            <input type="radio" name="reviewStar" value="4" id="rate2">
			            <label for="rate2">★</label>
			            <input type="radio" name="reviewStar" value="3" id="rate3">
			            <label for="rate3">★</label>
			            <input type="radio" name="reviewStar" value="2" id="rate4">
			            <label for="rate4">★</label>
			            <input type="radio" name="reviewStar" value="1" id="rate5">
			            <label for="rate5">★</label>
			        </fieldset>
                </td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>3</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>2</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>1</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>1</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>2</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>3</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>4</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
            <tr>
                <td>5</td>
                <td>
                	<img src="../../../resources/img/common/favicon.png" alt="향수1" width="200" height="150">
                    <strong>[조말론] 라임 바질 앤 만다리 코롱</strong>
                </td>
                <td>닉네임</td>
                <td>2023-04-07</td>
                <td>78</td>
            </tr>
        </tbody>
        <tfoot>
	        <tr>
		        <td colspan="6" class="line">
			        <a href="" class="page">&lt;&lt;</a> 
			        <a href="" class="page"> &lt;</a> 
			        <a href="" class="number page">1</a> 
			        <a href="" class="number page">2</a> 
			        <a href="" class="number page">3</a> 
			        <a href="" class="number page">4</a>
					<a href="" class="number page">5</a> <a href="" class="page">&gt;</a>
					<a href="" class="page">&gt;&gt;</a>
				</td>
			</tr>
		</tfoot>
    </table>
	</div>
	</main>
		
	<jsp:include page="../common/footer.jsp" />
</body>
</html>