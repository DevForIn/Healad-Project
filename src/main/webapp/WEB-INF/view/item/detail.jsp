<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
</style>
</head>
<body>
<style>
body{
background:#dcdcdc;    
}
.total-like-user-main a {
    display: inline-block;
    margin: 0 -17px 0 0;
}
.total-like {
    border: 1px solid;
    border-radius: 50px;
    display: inline-block;
    font-weight: 500;
    height: 34px;
    line-height: 33px;
    padding: 0 13px;
    vertical-align: top;
}
.restaurant-detailed-ratings-and-reviews hr {
    margin: 0 -24px;
}
.graph-star-rating-header .star-rating {
    font-size: 17px;
}
.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}
.rating-list {
    display: inline-flex;
    margin-bottom: 15px;
    width: 100%;
}
.rating-list-left {
    height: 16px;
    line-height: 29px;
    width: 10%;
}
.rating-list-center {
    width: 80%;
}
.rating-list-right {
    line-height: 29px;
    text-align: right;
    width: 10%;
}
.restaurant-slider-pics {
    bottom: 0;
    font-size: 12px;
    left: 0;
    z-index: 999;
    padding: 0 10px;
}
.restaurant-slider-view-all {
    bottom: 15px;
    right: 15px;
    z-index: 999;
}
.offer-dedicated-nav .nav-link.active,
.offer-dedicated-nav .nav-link:hover,
.offer-dedicated-nav .nav-link:focus {
    border-color: #3868fb;
    color: #3868fb;
}
.offer-dedicated-nav .nav-link {
    border-bottom: 2px solid #fff;
    color: #000000;
    padding: 16px 0;
    font-weight: 600;
}
.offer-dedicated-nav .nav-item {
    margin: 0 37px 0 0;
}
.restaurant-detailed-action-btn {
    margin-top: 12px;
}
.restaurant-detailed-header-right .btn-success {
    border-radius: 3px;
    height: 45px;
    margin: -18px 0 18px;
    min-width: 130px;
    padding: 7px;
}
.text-black {
    color: #000000;
}
.icon-overlap {
    bottom: -23px;
    font-size: 74px;
    opacity: 0.23;
    position: absolute;
    right: -32px;
}
.menu-list img {
    width: 41px;
    height: 41px;
    object-fit: cover;
}
.restaurant-detailed-header-left img {
    width: 88px;
    height: 88px;
    border-radius: 3px;
    object-fit: cover;
    box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
}
.reviews-members .media .mr-3 {
    width: 56px;
    height: 56px;
    object-fit: cover;
}
.rounded-pill {
    border-radius: 50rem!important;
}
.total-like-user {
    border: 2px solid #fff;
    height: 34px;
    box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
    width: 34px;
}
.total-like-user-main a {
    display: inline-block;
    margin: 0 -17px 0 0;
}
.total-like {
    border: 1px solid;
    border-radius: 50px;
    display: inline-block;
    font-weight: 500;
    height: 34px;
    line-height: 33px;
    padding: 0 13px;
    vertical-align: top;
}
.restaurant-detailed-ratings-and-reviews hr {
    margin: 0 -24px;
}
.graph-star-rating-header .star-rating {
    font-size: 17px;
}
.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}
.rating-list {
    display: inline-flex;
    margin-bottom: 15px;
    width: 100%;
}
.rating-list-left {
    height: 16px;
    line-height: 29px;
    width: 10%;
}
.rating-list-center {
    width: 80%;
}
.rating-list-right {
    line-height: 29px;
    text-align: right;
    width: 10%;
}
.restaurant-slider-pics {
    bottom: 0;
    font-size: 12px;
    left: 0;
    z-index: 999;
    padding: 0 10px;
}
.restaurant-slider-view-all {
    bottom: 15px;
    right: 15px;
    z-index: 999;
}

.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}
</style>
	<form action="../item/order">
	<input type="hidden" name="itemId" value="${item.itemId}">
	<!-- order type (주문타입) D: 단건주문, C: 카트 주문  -->
	<input type="hidden" name="orderType" value="D">
	<div class="container">
	    <div class="card">
	        <div class="card-body">
	            <h3 class="card-title">[${item.itemCatId}] ${item.itemName }</h3>
	            <div class="row">
	                <div class="col-lg-5 col-md-5 col-sm-6">
	                    <div class="white-box text-center">
	                    	<c:choose>
	                    		<c:when test="${empty item.pictureUrl }">
	                    			<img src="https://via.placeholder.com/430x600/00CED1/000000" class="img-responsive">
	                    		</c:when>
	                    		<c:otherwise>
									<img class="card-img-top" src="../img/${item.pictureUrl}" alt="${item.itemName }" >
	                    		</c:otherwise>
	                    	</c:choose>
	                    </div>
	                </div>
	                <div class="col-lg-7 col-md-7 col-sm-6">
	                    <h4 class="box-title mt-5">상세 설명</h4>
	                    <p>${item.description }</p>
	                    <h2 class="mt-5 mb-5">
	                        가격 :  <fmt:formatNumber value="${item.price}"/>원<!-- <small class="text-success">(36%off)</small> -->
	                    </h2>
	                    <button class="btn btn-primary btn-rounded mr-1" onclick="fnAddCart('${item.itemId}','${item.itemName }')">
	                        <i class="fa fa-shopping-cart"></i>
	                    </button>
	                    <button type="submit" class="btn btn-warning btn-rounded" ><i class="fa fa-truck"></i> 주문하기</button>
	                    <button class="btn btn-dark btn-rounded" onclick="fnMoveList()">목록</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	</form>
	
	
<link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">
<div class="container">
<div class="card" style="margin-top:10px;">
    <div class="offer-dedicated-body-left">
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade active show" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
                <div class="bg-white rounded shadow-sm p-4 mb-4 clearfix graph-star-rating">
                    <h5 class="mb-0 mb-4">리뷰 및 평점</h5>
                    <div class="graph-star-rating-header">
                        <div class="star-rating">
                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                            <a href="#"><i class="icofont-ui-rating"></i></a> <b class="text-black ml-2">${count } 개의 리뷰</b>
                        </div>
                        <p class="text-black mb-4 mt-2">Rated ${score.avgScore} out of ${score.cnt }</p>
                    </div>
                    <div class="graph-star-rating-body">
                        <div class="rating-list">
                            <div class="rating-list-left text-black">
                                5 Star
                            </div>
                            <div class="rating-list-center">
                                <div class="progress">
                                    <div style="width: ${score.score5Rate}%" aria-valuemax="5" aria-valuemin="0" aria-valuenow="5" role="progressbar" class="progress-bar bg-primary">
                                    </div>
                                </div>
                            </div>
                            <div class="rating-list-right text-black">${score.score5Rate}%</div>
                        </div>
                        <div class="rating-list">
                            <div class="rating-list-left text-black">
                                4 Star
                            </div>
                            <div class="rating-list-center">
                                <div class="progress">
                                    <div style="width: ${score.score4Rate}%" aria-valuemax="5" aria-valuemin="0" aria-valuenow="5" role="progressbar" class="progress-bar bg-primary">
                                    </div>
                                </div>
                            </div>
                            <div class="rating-list-right text-black">${score.score4Rate}%</div>
                        </div>
                        <div class="rating-list">
                            <div class="rating-list-left text-black">
                                3 Star
                            </div>
                            <div class="rating-list-center">
                                <div class="progress">
                                    <div style="width: ${score.score3Rate}%" aria-valuemax="5" aria-valuemin="0" aria-valuenow="5" role="progressbar" class="progress-bar bg-primary">
                                    </div>
                                </div>
                            </div>
                            <div class="rating-list-right text-black">${score.score3Rate}%</div>
                        </div>
                        <div class="rating-list">
                            <div class="rating-list-left text-black">
                                2 Star
                            </div>
                            <div class="rating-list-center">
                                <div class="progress">
                                    <div style="width: ${score.score2Rate}%" aria-valuemax="5" aria-valuemin="0" aria-valuenow="5" role="progressbar" class="progress-bar bg-primary">
                                    </div>
                                </div>
                            </div>
                            <div class="rating-list-right text-black">${score.score2Rate}%</div>
                        </div>
                    </div>
                </div>
                <div class="bg-white rounded shadow-sm p-4 mb-4 mt-6 restaurant-detailed-ratings-and-reviews">
                    <h5 class="mb-1">All Ratings and Reviews</h5>
                    
                    <!-- review 반복 -->
                    <c:forEach var="rv" items="${reviews }">
	                    <div class="reviews-members pt-4 pb-4">
	                        <div class="media">
	                            <a href="#"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-pill"></a>
	                            <div class="media-body">
	                                <div class="reviews-members-header">
	                                    <span class="star-rating float-right">
	                                    	<c:if test="${rv.score >= 1 }"><i class="fa fa-star"></i></c:if>
	                                    	<c:if test="${rv.score >= 2 }"><i class="fa fa-star"></i></c:if>
	                                    	<c:if test="${rv.score >= 3 }"><i class="fa fa-star"></i></c:if>
	                                    	<c:if test="${rv.score >= 4 }"><i class="fa fa-star"></i></c:if>
	                                    	<c:if test="${rv.score >= 5 }"><i class="fa fa-star"></i></c:if>
	                                    </span>
	                                    <h6 class="mb-1"><a class="text-black" href="#">${rv.userId }</a></h6>
	                                    <p class="text-gray">${rv.rvRegDate }</p>
	                                </div>
	                                <div class="reviews-members-body">
	                                	<p>${rv.rvSubject }</p>
	                                    <p>${rv.rvContent }</p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>  
	                    <hr>                  
                    </c:forEach>

                    <hr>
                    <a class="text-center w-100 d-block mt-4 font-weight-bold" href="#">See All Reviews</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>	
	
<script>

function fnMoveList(){
	window.location.href='${path}/item/menu';
	event.preventDefault();
}
/**
 * 장바구니 담기
 */
function fnAddCart(itemId, itemName){
	$.ajax({
		url : "${path}/cart/add",
		data: {
			'itemId': itemId,
			'quantity': 1,
		},
		success : function(data) {
			alert(itemName + '가(이) 추가되었습니다.');
		},
	    error:function(request,status,error){
	    	 alert('로그인한 사용자만 장바구니 추가가 가능합니다.');
	    }
	});	
}

</script>	
</body>

</html>