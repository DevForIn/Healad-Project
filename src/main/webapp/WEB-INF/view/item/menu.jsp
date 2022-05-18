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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<c:forEach var="item" items="${list}">
		<div class="card-group">
		  <div class="card">
		    <img class="card-img-top" src="..." alt="Card image cap">
		    <div class="card-body">
		      <h5 class="card-title">${item.itemName}</h5>
		      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
		    </div>
		  </div>
		</div>
	</c:forEach>
	
<%-- 	<div class="w3-row-padding">
	  <div class="w3-col s3 w3-container">
	    <a href="javascript:void(0)" onclick="openCategory(event, 'Salad');">
	      <div class="w3-fourth tablink w3-bottombar w3-hover-light-grey w3-padding">Salad</div>
	    </a>
	  </div>
	  <div class="w3-col s3 w3-container">
	    <a href="javascript:void(0)" onclick="openCategory(event, 'Topping');">
	      <div class="w3-fourth tablink w3-bottombar w3-hover-light-grey w3-padding">Topping</div>
	    </a>
	  </div>
	  <div class="w3-col s3 w3-container">
	    <a href="javascript:void(0)" onclick="openCategory(event, 'Source');">
	      <div class="w3-fourth tablink w3-bottombar w3-hover-light-grey w3-padding">Source</div>
	    </a>
	  </div>
	  <div class="w3-col s3 w3-container">
	    <a href="javascript:void(0)" onclick="openCategory(event, 'Drink');">
	      <div class="w3-fourth tablink w3-bottombar w3-hover-light-grey w3-padding">Drink</div>
	    </a>
	  </div>
	</div>
	
	<div id=Salad class="w3-container category" style="display:none">
	  <h2>Salad</h2>
	  <p>Salad</p>
	</div>
	
	<div id="Topping" class="w3-container category" style="display:none">
	  <h2>Topping</h2>
	  <p>Topping</p> 
	</div>
	
	<div id="Source" class="w3-container category" style="display:none">
	  <h2>Source</h2>
	  <p>Source</p> 
	</div>
	
	<div id="Drink" class="w3-container category" style="display:none">
	   <h2>Drink</h2>
	   <p>Drink</p>
	</div>
 
	<c:forEach var="item" items="${list}">
		<div class="w3-card-2">
		  <img src="data:image/jpeg;base64,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" alt="Alps" width="100%">
		  <div class="w3-container w3-center">
		    <p>${item.itemName }</p>
			<button class="w3-button w3-green">장바구니</button>
		  </div>
		</div>	
	</c:forEach> --%>
	
<script>
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