<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	            <a href="#" class="title">
	              <h3><i class="fa fa-info-circle"></i> 공지사항</h3>
	            </a>
	            <p>Shall open divide a one</p>
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
            <h2><span>샐러드 순위</span></h2>
            <p>최근 한달 간 샐러드 인기 순위</p>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="single-product">
            <div class="product-img">
              <img class="img-fluid w-100" src="img/product/feature-product/f-p-1.jpg" alt="" />
              <div class="p_icon">
                <a href="#">
                  <i class="ti-eye"></i>
                </a>
                <a href="#">
                  <i class="ti-heart"></i>
                </a>
                <a href="#">
                  <i class="ti-shopping-cart"></i>
                </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>Latest men’s sneaker</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4">$25.00</span>
                <del>$35.00</del>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6">
          <div class="single-product">
            <div class="product-img">
              <img class="img-fluid w-100" src="img/product/feature-product/f-p-2.jpg" alt="" />
              <div class="p_icon">
                <a href="#">
                  <i class="ti-eye"></i>
                </a>
                <a href="#">
                  <i class="ti-heart"></i>
                </a>
                <a href="#">
                  <i class="ti-shopping-cart"></i>
                </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>Red women purses</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4">$25.00</span>
                <del>$35.00</del>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-md-6">
          <div class="single-product">
            <div class="product-img">
              <img class="img-fluid w-100" src="img/product/feature-product/f-p-3.jpg" alt="" />
              <div class="p_icon">
                <a href="#">
                  <i class="ti-eye"></i>
                </a>
                <a href="#">
                  <i class="ti-heart"></i>
                </a>
                <a href="#">
                  <i class="ti-shopping-cart"></i>
                </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>Men stylist Smart Watch</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4">$25.00</span>
                <del>$35.00</del>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================ End Feature Product Area =================-->

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32" style="position:a">
  <p>개발자 E-mail - <a href="mailto:devforin@gmail.com" title="문의 메일보내기" target="_blank" class="w3-hover-text-green">Healad Manager</a></p>
</footer>
</body>
</html>