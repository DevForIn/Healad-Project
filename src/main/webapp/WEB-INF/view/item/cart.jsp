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
	<form id="frm" action="" method="post">
		<input type="hidden" name="orderType" value="C">
		<section class="h-100" style="background-color: #eee;">
		  <div class="container h-100 py-5">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col-10">
		
		        <div class="d-flex justify-content-between align-items-center mb-4">
		          <h3 class="fw-normal mb-0 text-black">장바구니</h3>
		        </div>
		        <c:choose>
		        	<c:when test="${!empty items }">
						<c:forEach var="item" items="${items}">
					        <div class="card rounded-3 mb-4">
					          <div class="card-body p-4">
					            <div class="row d-flex justify-content-between align-items-center">
					              <div class="col-md-2 col-lg-2 col-xl-2">
					                <img src="../img/sal1.png" class="img-fluid rounded-3" alt="Cotton T-shirt">
					              </div>
					              <div class="col-md-3 col-lg-3 col-xl-3">
					                <p class="lead fw-normal mb-2">${item.itemName }</p>
					              </div>
					              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
					                <a class="btn btn-link px-2" onclick="fnUpdateCartQuantity('${item.itemId}','down')">
					                  <i class="fa fa-minus"></i>
					                </a>
					
					                <input min="1" id="quantity_${item.itemId }" name="quantity" value="${item.quantity }" type="number"
					                  class="form-control form-control-sm" />
					
					                <a class="btn btn-link px-2" onclick="fnUpdateCartQuantity('${item.itemId}', 'plus')">
					                  <i class="fa fa-plus"></i>
					                </a>
					              </div>
					              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
					                <h5 class="mb-0">${item.price }</h5>
					              </div>
					              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
					                <a onclick="fnRemoveItem('${item.itemId }')" class="text-danger"><i class="fa fa-trash fa-lg"></i></a>
					              </div>
					            </div>
					          </div>
					        </div>	
						</c:forEach>						
		
				        <div class="card">
				          <div class="card-body">
				            <button type="button" class="btn btn-warning btn-block btn-lg" onclick="fnOrder()"><i class="fa fa-truck"></i> 주문하기</button>
				            <button type="button" class="btn btn-primary btn-block btn-lg" onclick="fnDeleteCart()"><i class="fa fa-shopping-cart"></i> 장바구니 비우기</button>
				          </div>
				        </div>		        	
		        	</c:when>
		        	<c:otherwise>
				        <div class="card rounded-3 mb-4">
				          <div class="card-body p-4">
				          	<h5>장바구니에 담긴 상품이 없습니다.</h5>
				          </div>
				        </div>		        	
		        	</c:otherwise>
		        </c:choose>
		      </div>
		    </div>
		  </div>
		</section>		
	
	
	</form>
	
<script>
	function fnRemoveItem(itemId){
		alert(itemId + ' 삭제 작업중');
	}

	
	function fnUpdateOrderQuantity(itemId, upDown){
		if(upDown == 'plus') {
			$('#quantity').val(Number($('#quantity').val()) + 1);	
		}
		else {
			// 0 불가능
			if($('#quantity').val() != 1) $('#quantity').val(Number($('#quantity').val()) - 1);
		}
	}
	
	function fnUpdateCartQuantity(itemId, upDown){
		
		if(upDown == 'plus') {
			$('#quantity_' + itemId).val(Number($('#quantity_' + itemId).val()) + 1);	
		}
		else {
			// 0 불가능
			if($('#quantity_' + itemId).val() != 1) $('#quantity_' + itemId).val(Number($('#quantity_' + itemId).val()) - 1);
		}
		
		console.log('itemId 수량 = ',$('#quantity_' + itemId).val());
		
		
 		$.ajax({
			url : "${path}/cart/quantity-update",
			data: {
				'itemId': itemId,
				'quantity': $('#quantity_' + itemId).val(),
			},
			success : function(data) {
				console.log('data', data)
			},
		    error:function(request,status,error){
		    	alert('에러가 발생했습니다.');
		    }
		});	 		
	}
	
	function fnOrder(){
		// 주문하기
		var form = document.getElementById('frm');
		form.action = "../item/order";
		form.submit();
		
	}
	
	function fnDeleteCart(){
		// 장바구니 전체 비우기
		var isDelete = confirm("장바구니를 비우시겠습니까?");
		if(isDelete){
			alert('삭제처리 작업중');
		}
	}
</script>	
</body>

</html>