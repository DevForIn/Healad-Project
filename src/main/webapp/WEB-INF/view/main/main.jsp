<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>  
<html>
<head>
<link rel="stylesheet" href="${path}/css/main_style.css" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
td {
	background-color: #fffff !important;
}
</style>
<body>
	<div style="text-align:center;">
		<img src="${path}/img/sal3-1.png" width="600">
	</div>
  	
  	<div style="margin-top: 10px;"></div> 
  	<!-- Start feature Area -->
	<section class="feature-area section_gap_bottom_custom" style="margin-top: 20px; margin-bottom: 20px;">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-6 col-md-6">
	          <div class="single-feature">
	            <a href="#" class="title">
	              <h3><i class="fa fa-comments-o"></i> 리뷰</h3>
	            </a>
	            <p>Shall open divide a one</p>
	          </div>
	        </div>
	
	        <div class="col-lg-6 col-md-6">
	          <div class="single-feature">
	            <a href="${path }/board/mainBoard" class="title">
	              <h3><i class="fa fa-info-circle"></i> 공지사항</h3>
	            </a>
	            <c:forEach var="data" items="${notice }">
	            	<p><a href="${path }/board/noticeInfo?num=${data.noticeId}">${data.noSubject } (<fmt:formatDate value="${data.noRegDate}" pattern="yyyy-MM-dd" />)</a></p>
	            </c:forEach>
	            
	          </div>
	        </div>
	      </div>
	    </div>
	</section>
  	<!-- End feature Area -->
  	
  <!--================ Feature Product Area =================-->
  <section class="feature_product_area section_gap_bottom_custom" style="margin-bottom: 50px;">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h2><span><i class="fa fa-bar-chart"></i> 샐러드 순위 TOP3</span></h2>
            <p>최근 한달 간 샐러드 인기 순위</p>
          </div>
        </div>
      </div>

      <div class="row">
      	<!--  샐러드 순위  -->
      	<c:forEach var="item" items="${items }"> 
	        <div class="col-lg-4 col-md-6">
	          <div class="single-product">
	            <div class="product-img">
	              <c:choose>
	              	<c:when test="${!empty item.pictureUrl }">
	              		<img class="img-fluid w-100" src="/healad/img/${item.pictureUrl }" alt="" style="height: 350px;" />
	              	</c:when>
	              	<c:otherwise>
	              		<img class="img-fluid w-100" src="../img/sal1.png" alt="" />
	              	</c:otherwise>
	              </c:choose>
	              <div class="p_icon">
	                <a href="${path}/item/detail?itemId=${item.itemId }">
	                  <i class="fa fa-eye"></i>
	                </a>
	                <a style="cursor: pointer;" onclick="fnAddCart('${item.itemId}','${item.itemName }')">
	                  <i class="fa fa-shopping-cart"></i>
	                </a>
	              </div>
	            </div>
	            <div class="product-btm">
	              <a href="#" class="d-block">
	                <h4>${item.itemName }</h4>
	              </a>
	              <div class="mt-3">
	                <span class="mr-4">
	                	<fmt:formatNumber type="number" var="price" pattern="###,###,###,###,###,###" value="${item.price}" />
						${price } 원
					</span>
	              </div>
	            </div>
	          </div>
	        </div>      	
      	</c:forEach>

      </div>
    </div>
  </section>
  <!--================ End Feature Product Area =================-->

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32" style="position:a">
  <p>개발자 E-mail - <a href="mailto:devforin@gmail.com" title="문의 메일보내기" target="_blank" class="w3-hover-text-green">Healad Manager</a></p>
</footer>
<script>
function fnAddCart(itemId, itemName){
	$.ajax({
		url : "${path}/cart/add",
		data: {
			'itemId': itemId,
			'quantity': 1,
		},
		success : function(data) {
			console.log('data', data)
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