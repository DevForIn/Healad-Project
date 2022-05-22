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
									<img class="card-img-top" src="${item.pictureUrl }" alt="${item.itemName }" >
	                    		</c:otherwise>
	                    	</c:choose>
	                    </div>
	                </div>
	                <div class="col-lg-7 col-md-7 col-sm-6">
	                    <h4 class="box-title mt-5">상세 설명</h4>
	                    <p>${item.description }</p>
	                    <h2 class="mt-5 mb-5">
	                        가격: ${item.price }<!-- <small class="text-success">(36%off)</small> -->
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
			alert(itemName + '이 추가되었습니다.');
		},
	    error:function(request,status,error){
	    	 alert('로그인한 사용자만 장바구니 추가가 가능합니다.');
	    }
	});	
}

</script>	
</body>

</html>