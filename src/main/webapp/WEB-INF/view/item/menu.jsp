<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="path" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab" href="#qwe">Salad</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#asd">Topping</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#zxc">Drink</a>
	  </li>
	</ul>
	
	<div class="tab-content">
	  <div class="tab-pane fade show active" id="qwe">
		<c:forEach var="item" items="${list}">
			<div class="card-group">
			  <div class="card">
			    <img class="card-img-top" src="file/${item.pictureUrl }" alt="Card image cap" style="width: 150px;">
			    <div class="card-body">
			      <h5 class="card-title">${item.itemName}</h5>
			      <p class="card-text">${item.price } 원</p>
			      <p class="card-text">${item.description }</p>
			      <p class="card-text"><a style="cursor: pointer;" onclick="fnAddCart('${item.itemId}', '${item.itemName}')"><i class="fa fa-shopping-cart"></i></a></small></p>
			    </div>
			  </div>
			</div>
		</c:forEach>	  
	  </div>
	  <div class="tab-pane fade" id="asd">
	    <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
	  </div>
	  <div class="tab-pane fade" id="zxc">
	    <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
	  </div>
	</div>	
<script>

function fnAddCart(itemId, itemName){
	console.log('카트 추가 전', $.cookie('cart'));
	
	if($.cookie('cart') != 'undefined') {
		let carts = [];
		carts.push($.cookie('cart'));
		carts.push(itemId);
		console.log('cart exists', carts);
		$.cookie('cart', carts);
	}
	else {
		console.log('NEW CART')
		$.cookie('cart', itemId);
	}
	
	console.log('카트 추가 후', $.cookie('cart'));
	console.log('카트 추가 후', $.cookie());
	
	$.ajax({
		url : "${path}/cart/add",
		data: {
			'itemId': itemId,
			'quantity': 1,
		},
		success : function(data) {
			console.log('data', data)
			alert(itemName + '이 추가되었습니다.');
		},
	     error:function(request,status,error){
	    	 alert('로그인한 사용자만 장바구니 추가가 가능합니다.');
	     }
	});	
	// ajax 로 카트에 추가하는걸 만들어야해. (로그인체크) 로그인 해주셔야 가능합니다.
}

function openCategory(evt, category) {
  var i, x, tablinks;
  x = document.getElementsByClassName("category");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(category).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}
</script>	
</body>

</html>