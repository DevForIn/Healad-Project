<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴회원목록</title>
<script type="text/javascript">
	function allchkbox(allchk) {
		$(".idchks").prop("checked", allchk.checked)
	}
</script>
</head>
<body>
	<div class="a"
		style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList" class="current">OutUser List</a></li>
		</ul>
	</div>
	<div style="width: 60%; float: right;">
	<table style="width: 500px;">
		<tr>
			<th colspan="3">HEALAD_탈퇴회원목록</th>
		</tr>
		<tr>
			<th>ID <a href="outUserList?sort=2" class="noline">▲</a>
				<a href="outUserList?sort=3" class="noline">▼</a></th>
			<th>탈퇴여부</th>
			<th>탈퇴날짜</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<c:if test="${user.withdrawYn == 'Y'}">
			<tr>
				<td>${user.userId}</td>
				<td>${user.withdrawYn}</td>
				<td><fmt:formatDate value="${user.withdrawDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			</c:if>
		</c:forEach>		
	</table>
	</div>
</body>
</html>
