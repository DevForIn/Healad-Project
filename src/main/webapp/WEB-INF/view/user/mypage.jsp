<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /springmvc1/src/main/webapp/WEB-INF/view/user/mypage.jsp --%>

<%-- 			수정중 			--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
	<table>
		<tr>
			<td><h4>나의 정보</h4></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>아이디</td><td>${user.userId}</td>
		</tr>
		<tr>
			<td>이름</td><td>${user.userName}</td>
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
			<td><c:if test="${user.mileage == 0 or user.mileage eq 'null'}">0 포인트</c:if>
				<c:if test="${user.mileage != 0}">${user.mileage} 포인트</c:if></td>
		</tr>
	</table>
	<br>
	<a href="update?id=${user.userId}">[회원정보수정]</a>&nbsp;
	<a href="password">[비밀번호수정]</a>&nbsp;
	<c:if test="${loginUser.userId != 'admin'}">
		<a href="delete?id=${user.userId}">[회원탈퇴]</a>&nbsp;
			</c:if>
	<c:if test="${loginUser.userId == 'admin'}">
		<a href="../admin/list">[회원목록]</a>&nbsp;
			</c:if>
</body>
</html>