<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
		<div class ="search">
		<form action="/review/search" method="GET">
         	<select name="searchCondition" id="sortby-select">
         		<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
			    <option value="latest" <c:if test="${search.searchCondition == 'latest' }">selected</c:if>>최신순</option>
			    <option value="most-viewed" <c:if test="${search.searchCondition == 'most-viewed' }">selected</c:if>>조회순</option>
			    <option value="highest-rated" <c:if test="${search.searchCondition == 'highest-rated' }">selected</c:if>>별점순</option>
			</select>
			<select name="searchPerfume" id="perfume-select">
			    <option value="">향종류</option>
			    <option value="Woody" <c:if test="${search.searchPerfume == 'Woody' }">selected</c:if>>Woody</option>
			    <option value="Floral" <c:if test="${search.searchPerfume == 'Floral' }">selected</c:if>>Floral</option>
			    <option value="Fruity" <c:if test="${search.searchPerfume == 'Fruity' }">selected</c:if>>Fruity</option>
			    <option value="Spicy" <c:if test="${search.searchPerfume == 'Spicy' }">selected</c:if>>Spicy</option>
			    <option value="Citrus" <c:if test="${search.searchPerfume == 'Citrus' }">selected</c:if>>Citrus</option>
			</select>
			<input type="search" name="searchValue" value="${search.searchValue }" placeholder="상품명을 검색해주세요" aria-label="Search">
			<input type="submit" value="검색">
		</form>
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
        <c:forEach items="${rList }" var="review">
            <tr>
                <td>
                	<div class="star-rating">
                	<span class="fa ${review.rViewscore >= 1 ? 'fa-star' : 'fa-star-o'}" data-rating="1"></span>
					<span class="fa ${review.rViewscore >= 2 ? 'fa-star' : 'fa-star-o'}" data-rating="2"></span>
					<span class="fa ${review.rViewscore >= 3 ? 'fa-star' : 'fa-star-o'}" data-rating="3"></span>
					<span class="fa ${review.rViewscore >= 4 ? 'fa-star' : 'fa-star-o'}" data-rating="4"></span>
					<span class="fa ${review.rViewscore >= 5 ? 'fa-star' : 'fa-star-o'}" data-rating="5"></span>

					<!-- <span class="fa fa-star-o" data-rating="1"></span>
					    <span class="fa fa-star-o" data-rating="2"></span>
					    <span class="fa fa-star-o" data-rating="3"></span>
					    <span class="fa fa-star-o" data-rating="4"></span>
					    <span class="fa fa-star-o" data-rating="5"></span> -->
					    <input type="hidden" name="rViewscore" class="rating-value" value="${review.rViewscore }">
				     </div>
                </td>
                <td>
                	<div>
                		<a href="/review/reviewDetail/${review.reviewNo }">
						<img src="../../../resources/img/perfumeFileUploads/${review.pFilerename}" alt="">
	                    <strong>[${review.perfumeBrand }] ${review.perfumeName }</strong>
	                    </a>
                    </div>
                </td>
                <td>${review.memberNickname }</td>
                <td><fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd" /></td> 
                <td>${review.rViewcount}</td>
            </tr>
        </c:forEach>
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
	
	<script>
    const stars = document.querySelectorAll('.star-rating span');
    const ratingInput = document.querySelector('.rating-value');
    const rViewscore = ${review.rViewscore}; // DB에서 가져온 평점 값

    stars.forEach(function (star, index) {
        if (index < rViewscore) {
            star.classList.remove('fa-star-o');
            star.classList.add('fa-star');
        } else {
            star.classList.remove('fa-star');
            star.classList.add('fa-star-o');
        }

        star.addEventListener('click', function () {
            const rating = this.getAttribute('data-rating');
            ratingInput.value = rating;
            for (let i = 0; i < stars.length; i++) {
                if (i < rating) {
                    stars[i].classList.remove('fa-star-o');
                    stars[i].classList.add('fa-star');
                } else {
                    stars[i].classList.remove('fa-star');
                    stars[i].classList.add('fa-star-o');
                }
            }
        });
    });
</script>
</body>
</html>