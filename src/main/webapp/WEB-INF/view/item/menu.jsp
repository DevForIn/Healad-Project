<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
.active{
	background-color: red;
}
</style>
</head>
<body>
	<form id="frm" action="../item/order" method="post">
		
		<input type="hidden" id="itemId" name="itemId" value="">
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#salad" onclick="fnSearchMenu('1')">Salad</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#salad" onclick="fnSearchMenu('2')">Topping</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#salad" onclick="fnSearchMenu('3')">Dressing</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#salad" onclick="fnSearchMenu('4')">Drink</a>
		  </li>
		</ul>
		
		<div class="tab-content">
		  <div class="tab-pane fade show active" id="salad">
		  </div>
		</div>	
	</form>
<script>

// 최초 메뉴 조회 (1: 샐러드, 2: 토핑, 3: 드레싱, 4: 드링크)
fnSearchMenu('1');

function fnOrder(itemId, itemName){
	$('#itemId').val(itemId);
	document.getElementById('frm').submit();
	return false;
}

function fnAddCart(itemId, itemName){
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
}

function fnSearchMenu(itemCatId){
	// 데이터 조회하러 가기
	$.ajax({
		url : "${path}/item/list",
		data: {
			'itemCatId': itemCatId
		},
		success : function(datas) {
			var contents  = '';
			
			//contents += '<div class="card-group">';
			for(var i=0; i < datas.length; i++) {
				if(datas[i].useYn == 'Y'){
					if(i == 0 || i%3 == 0) {console.log('i%3=0이다'); contents += '<div class="card-group">';}
				    contents += 	'<div class="card">';
					if(datas[i].pictureUrl == null) {
						contents +='<a href="${path}/item/detail?itemId='+datas[i].itemId +'"><img class="card-img-top" src="../img/sal1.png" alt="Card image cap" style="width: 300px; cursor: pointer;"></a>';
					}
					else {
						contents +='<a href="${path}/item/detail?itemId='+datas[i].itemId +'"><img class="card-img-top" src="../img/' + datas[i].pictureUrl + '" alt="Card image cap" style="width: 300px; cursor: pointer;"></a>';
					}
					
					var price = datas[i].price;
					contents += 		'<div class="card-body">';
					contents += 			'<h5 class="card-title"><a href="${path}/item/detail?itemId='+datas[i].itemId +'"> '+datas[i].itemName +' </a></h5>';
					contents += 			'<p class="card-text">'+price.toLocaleString()+'원</p>';
					contents += 			'<p class="card-text">'+datas[i].description+'</p>';
					contents += 			'<button type="button" class="btn btn-warning" onclick="fnOrder(\''+ datas[i].itemId +'\', \''+ datas[i].itemName +'\')"><i class="fa fa-truck"> 주문하기</i></button> ';
					contents += 			'<button type="button" class="btn btn-primary" onclick="fnAddCart(\''+ datas[i].itemId +'\', \''+ datas[i].itemName +'\')"><i class="fa fa-shopping-cart"></i> 장바구니</button>';
					contents += 		'</div>';
					contents += 	'</div>';
					if( (i !=0 && i%3 == 2) || i == datas.length) {console.log('종료 i=',i); contents += '</div>';}
				}
			}
			$('#salad').html(contents);
		},
	    error:function(request,status,error){
	    }
	});	
	
}

</script>	
</body>

</html>