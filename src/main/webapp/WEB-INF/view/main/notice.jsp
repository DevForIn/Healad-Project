<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>  
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align:center;">
		<img src="${path}/img/sal3-1.png" width="600">
	</div>
  	 
  	<!-- Start feature Area -->
	<section class="feature-area section_gap_bottom_custom">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-4 col-md-6">
	          <div class="single-feature">
	            <a href="#" class="title">
	              <h3><i class="fa fa-bar-chart"></i>샐러드 순위</h3>
	            </a>
	            <p>Shall open divide a one</p>
	          </div>
	        </div>
	
	        <div class="col-lg-4 col-md-6">
	          <div class="single-feature">
	            <a href="#" class="title">
	              <h3><i class="fa fa-comments-o"></i> 리뷰</h3>
	            </a>
	            <p>Shall open divide a one</p>
	          </div>
	        </div>
	
	        <div class="col-lg-4 col-md-6">
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

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32" style="position:a">
  <p>개발자 E-mail - <a href="mailto:devforin@gmail.com" title="문의 메일보내기" target="_blank" class="w3-hover-text-green">Healad Manager</a></p>
</footer>
</body>
</html>