<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글삭제</title>
</head>
<body>
<hr>
	<!-- login start -->
	<div class="container">
		<h2   id="center">게시물 삭제</h2>
		<form action="${path}/board/delete"  	method="post">
		<div class="form-group">
			<input type="hidden"  name="num" value="${num}">
			<label >Password:</label>
			<input type="password" class="form-control" name="pass">
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">게시물삭제</button>
		</div>
		</form>
	</div>
</body>
</html>