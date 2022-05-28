<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />             
<!DOCTYPE html>
<html>
<head>
<title>H E A L A D</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${path}/css/main.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
body { padding-top:40px;
		}
</style>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
	<div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
		<a href="${path}" class="w3-bar-item w3-button"><h3>Healad</h3></a>
<!-- Right-sided navbar links. Hide them on small screens -->
		<div class="w3-right w3-hide-small">
		<c:choose>
			<c:when test="${loginUser.userId == 'admin'}">			
				<a href="${path}/master/userList" class="w3-bar-item w3-button"><h3>Setting</h3></a>
				<a href="${path}/user/logout" class="w3-bar-item w3-button"><h3>Logout</h3></a>
			</c:when>
			<c:otherwise>
				<a href="${path}/user/mainInfo" class="w3-bar-item w3-button"><h3>Info</h3></a>
				<a href="${path}/item/menu" class="w3-bar-item w3-button"><h3>Menu</h3></a>
				<a href="${path}/board/notice" class="w3-bar-item w3-button"><h3>Service</h3></a>
				<c:if test="${empty sessionScope.loginUser}">
					<a href="${path}/user/login" class="w3-bar-item w3-button"><h3>Login</h3></a>
					<a href="${path}/user/signUp" class="w3-bar-item w3-button"><h3>Sign Up</h3></a>
				</c:if>  
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="${path}/item/cart" class="w3-bar-item w3-button"><h3>Cart</h3></a>
					<a href="${path}/user/mypage?id=${loginUser.userId}" class="w3-bar-item w3-button"><h3>MyPage</h3></a>
				</c:if> 		
				<c:if test="${!empty sessionScope.loginUser}"> 
					<a href="${path}/user/logout" class="w3-bar-item w3-button"><h3>Logout</h3></a>
				</c:if>
			</c:otherwise> 
		</c:choose>
		</div>
	</div>
</div>


<!-- !PAGE CONTENT! -->
<div class="w3-main" 
  style="margin:43px auto 0;">
  <div class="w3-row-padding w3-margin-bottom">
  <div class="w3-container w3-light-white w3-padding-32">
    <div class="w3-row">
      <div class="w3-container w3-col">
        <sitemesh:write property='body'/>
      </div>

    </div>
  </div>
  </div>
  <!-- End page content -->
</div>

</body>
</html>
