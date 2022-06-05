<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 주문 내역</title>
</head>
<body>
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard">Notice set</a></li>
			<li><a href="masterOrder" class="current">Order Status</a></li>
		</ul>
	</div>
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
		<tr>
			<th colspan="12">HEALAD_총 주문 내역</th>
		</tr>
		<tr>
			<th>주문번호
				<a href="masterOrder?sort=1" class="noline">▲</a>
				<a href="masterOrder?sort=2" class="noline">▼</a></th>
			<th>사용자 ID</th>
			<th>사용자 닉네임</th>
			<th>주문일자</th>
			<th>주소지</th>
			<th>Review</th>
		</tr>
		<c:forEach items="${saleList}" var="sale">
			<tr>
				<td>${sale.saleId}</td>
				<td>${sale.userId}</td>
				<td>${sale.saleUserName}</td>
				<td><fmt:formatDate value="${sale.saleDate}" pattern="yy-MM-dd (E) H시 m분" /></td>
				<td>${sale.salePostCode}&nbsp;${sale.saleAddr}&nbsp;${sale.saleAddrDetail}</td>
				<td>
				<c:choose>
					<c:when test="${sale.remark eq null}">( X )</c:when>
					<c:otherwise>${sale.remark}</c:otherwise>
				</c:choose>
				</td>
		</c:forEach>		
	</table>
	</div>
</body>
</html>
