<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script type="text/javascript">
	function allchkbox(allchk) {
		$(".idchks").prop("checked", allchk.checked)
	}
</script>
<style>
.noline {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="a"
		style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList=${loginUser.userId == 'admin'}" class="current">User List</a></li>
			<li><a href="">Order List</a></li>
			<li><a href="">My Review</a></li>
		</ul>
	</div>
	<table>
		<tr>
			<td colspan="7">회원목록</td>
		</tr>
		<tr>
			<th>아이디<a href="userList?sort=0" class="noline">▲</a>
				<a href="userList?sort=1" class="noline">▼</a></th>
			<th>이름<a href="userList?sort=2" class="noline">▲</a>
				<a href="userList?sort=3" class="noline">▼</a></th>
			<th>전화</th>
			<th>생일</th>
			<th>이메일</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${list}" var="user">
			<tr>
				<td>${user.userid}</td>
				<td>${user.username}</td>
				<td>${user.phoneno}</td>
				<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
				<td>${user.email}</td>
				<td><a href="../user/update?id=${user.userid}">수정</a>
				 <a	href="../user/delete?id=${user.userid}">강제탈퇴</a>
				 <a href="../user/mypage?id=${user.userid}">회원정보</a></td>
		</c:forEach>
	</table>
</body>
</html>
