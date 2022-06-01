<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<head>
</head>
<body>
<div class="a" style="background-color:#ffff80; height:100%; width:15%; float:left;">
<ul>
	<li><a href="mypage?id=${loginUser.userId}" class="current">My Profile</a></li>
	<li><a href="">Order List</a></li>
	<li><a href="">My Review</a></li>
</ul>
</div>
<div style="width:60%; float:right;" >
	<table style="width:500px;">
		<tr>
			<th colspan="2"><h3>[ ${user.userId} ]님의 프로필</h3></th>
		</tr>
		<tr>
			<td>아이디</td><td>${user.userId}</td>
		</tr>
		<tr>
			<td>닉네임</td><td>${user.userName}</td>
		</tr>
		<tr>
			<td>연락처</td><td>${user.phoneNo}</td>
		</tr>
		<tr>
			<td>이메일</td><td>${user.email}</td>
		</tr>
		<tr>
			<td>우편번호</td><td>${user.postCode}</td>
		</tr>
		<tr>
			<td>주소</td><td>${user.addr} ${user.addrDetail}</td>
		</tr>
		<tr>
			<td>생년월일</td><td><fmt:formatDate value="${user.birthDate}"	pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td>마일리지</td>
			<td>
				<c:choose>
					<c:when test="${user.mileage == 0 or empty user.mileage}">0 포인트</c:when>
					<c:otherwise>${user.mileage} 포인트</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<br>
	<a href="modifyUser?id=${user.userId}">[회원정보수정]</a>&nbsp;
	<a href="modifyPW?id=${user.userId}">[비밀번호수정]</a>&nbsp;
	<a href="deleteUser?id=${user.userId}">[회원탈퇴]</a>&nbsp;
</div>
</body>
</html>