<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<div class="a"
		style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="mypage?id=${loginUser.userId}" class="current">My Profile</a></li>
			<li><a href="">Order List</a></li>
			<li><a href="">My Review</a></li>
		</ul>
</div>
<div style="width: 60%; float: right;">
	<table style="width: 500px;">
		<tr>
			<th colspan="2"><h3>[ ${user.userId}님 ] 탈퇴 확인</h3></th>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${user.userName}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${user.phoneNo}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><fmt:formatDate value="${user.birthDate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
	</table>
	<br><br><br>
	<form method="post" action="deleteUser" name="deleteform">
	<table style="width: 500px;">
		<tr>
			<th><input type="hidden" name="userId" value="${param.id}">비밀번호</th> 
			<td><input type="password" name="pwd"></td><tr>
		<tr>
			<td colspan="2">
			<a href="javascript:deleteform.submit()">[회원탈퇴확인]</a>
			<a href="#" onclick="history.back()">[돌아가기]</a></td>
		</tr>
	</table>
	</form>
	
</div>
</body>
</html>