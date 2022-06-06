<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="container mt-5 d-flex justify-content-center">
       <div class="card p-4 mt-3">
	         <div class="first d-flex justify-content-between align-items-center mb-3">
	         	<div class="info">
	                <span class="d-block name">주문이 완료되었습니다.</span>
	                <span class="order">주문번호 - ${saleId}</span>
	            </div>
	            <img src="https://i.imgur.com/NiAVkEw.png" width="40"/>
	         </div>
             <div class="detail">
         		<span class="d-block summery">감사합니다.</span>
             </div>
          	<hr>
	        <div class="text">
	        	<span class="d-block new mb-1" >${sale.saleUserName }</span>
	        </div>
		    <span class="d-block address">${sale.salePostCode } ${sale.saleAddr }</span>
	        <span class="d-block address mb-3"> ${sale.saleAddrDetail }</span>
	        <span class="d-block address mb-3"> 비고사항: ${sale.remark }</span>
        </div>
	</div>
</body>

</html>