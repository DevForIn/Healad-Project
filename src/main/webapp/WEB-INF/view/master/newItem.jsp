<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList" class="current">Item set</a></li>
			<li><a href="masterBoard">Notice set</a></li>
			<li><a href="#">Order Status</a></li>
		</ul><br><br><br><br><br>
		<ul>
			<li><a href="${path}/item/menu"><h3>Menu Page</h3></a></li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
		</ul>
	</div>
<form:form modelAttribute="item" method="post" enctype="multipart/form-data">
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
		<tr><th colspan="2"><h3>ITEM 등록</h3></th></tr>
		<tr>
			<th>상품명</th>
			<td><form:input path="itemName" maxlength="20"/></td>

		</tr>
		<tr>
			<th>상품가격</th>
			<td><form:input path="price" maxlength="20"/></td>

		<tr>
			<th>상품이미지</th>
			<td colspan="2"><input type="file" name="picture"></td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td><form:textarea path="description" cols="20" rows="5" /></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td style="width: 85%;">
				<input type="radio" name="itemCatId" value="1">Salad&nbsp;&nbsp;
				<input type="radio" name="itemCatId" value="2">Topping&nbsp;&nbsp;
				<input type="radio" name="itemCatId" value="3">Dressing&nbsp;&nbsp;
				<input type="radio" name="itemCatId" value="4">Drink</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="상품등록">&nbsp;
			<input type="button" value="돌아가기" onclick="location.href='itemList'"></td>
		</tr>
	</table>
</div>
</form:form>	

</body>
</html>