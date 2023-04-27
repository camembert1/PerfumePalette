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
		<form action="/review/reviewSearch" method="GET">
         	<select name="searchCondition" id="sortby-select">
			    <option value="latest">최신순</option>
			    <option value="viewed">조회순</option>
			    <option value="star">별점순</option>
			</select>
			<select name="searchPerfume" id="perfume-select">
			    <option value="All">향종류</option>
			    <option value="Woody">Woody</option>
			    <option value="Floral">Floral</option>
			    <option value="Fruity">Fruity</option>
			    <option value="Spicy">Spicy</option>
			    <option value="Citrus">Citrus</option>
			</select>
			<input type="search" name="searchValue" value="${search.searchValue }" placeholder="상품명을 검색해주세요" aria-label="Search">
			<input type="submit" value="검색">
		</form>
		</div>
		
		 <table>
        <thead> <!-- 테이블 헤더 -->
            <tr>
            	<th>번호</th>
                <th>별점</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody> <!-- 테이블 본문 -->
        <c:forEach items="${rList }" var="review" varStatus="r">
            <tr>
            	<td>${r.count }</td>
                <td>
                	<div class="star-rating">
                	<span class="fa ${review.rViewscore >= 1 ? 'fa-star' : 'fa-star-o'}" data-rating="1"></span>
					<span class="fa ${review.rViewscore >= 2 ? 'fa-star' : 'fa-star-o'}" data-rating="2"></span>
					<span class="fa ${review.rViewscore >= 3 ? 'fa-star' : 'fa-star-o'}" data-rating="3"></span>
					<span class="fa ${review.rViewscore >= 4 ? 'fa-star' : 'fa-star-o'}" data-rating="4"></span>
					<span class="fa ${review.rViewscore >= 5 ? 'fa-star' : 'fa-star-o'}" data-rating="5"></span>
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
			        <div id="paging">
					<c:if test="${paging.totalCount ne null }">
						<c:if test="${paging.currentPage != 1}">
							<c:if test="${paging.startNavi != 1}">
								<!-- 첫 페이지로 버튼 -->
								<a href="/review/reviewList?page=1" class="move first">&lt;&lt;</a>
							</c:if>	
							<!-- 이전 페이지로 버튼 -->
							<a href="/review/reviewList?page=${paging.currentPage-1}" class="move prev">&lt;</a>
						</c:if>
						
						<c:forEach begin="${paging.startNavi}" end="${paging.endNavi}" var="i">
							<c:choose>
								<c:when test="${i == paging.currentPage}">
									<span class="page current">${i}</span>
								</c:when>
								<c:otherwise>
									<a href="/review/reviewList?page=${i}" class="page">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		
						<c:if test="${paging.currentPage != paging.lastPage}">
							<!-- 다음 페이지로 버튼 -->
							<a href="/review/reviewList?page=${paging.currentPage+1}" class="move next">&gt;</a>
							<c:if test="${paging.endNavi != paging.lastPage}">
								<!-- 맨 끝 페이지로 버튼 -->
								<a href="/review/reviewList?page=${paging.lastPage}" class="move last">&gt;&gt;</a>
							</c:if>
						</c:if>
					</c:if>
				</div>
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