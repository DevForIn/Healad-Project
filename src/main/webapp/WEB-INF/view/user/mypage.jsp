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

<div class="row">
	<div class="col-3">
		<a href="mypage?id=${loginUser.userId}" class="list-group-item list-group-item-action active">나의 프로필</a>
		<a href="orderList?id=${loginUser.userId}"  class="list-group-item list-group-item-action">주문 목록</a>
		<a href="review?id=${loginUser.userId}"  class="list-group-item list-group-item-action">나의 리뷰</a>	
	</div>
	<div class="col-9">
		<table style="width:100%;">
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
				<td><fmt:formatNumber value="${user.mileage}" pattern="###,###,###,###" /> Point				
				</td>
			</tr>
			<tr>
				<th colspan="2">총 주문 금액 <br><br><h4><strong>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${user.mileage*20}" pattern="###,###,###,###" /> 원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;] </strong></h4><br>이용해주셔서 감사합니다.</th>
			</tr>
		</table>
		<br>
		<a href="modifyUser?id=${user.userId}">[회원정보수정]</a>&nbsp;
		<a href="modifyPW?id=${user.userId}">[비밀번호수정]</a>&nbsp;
		<a href="deleteUser?id=${user.userId}">[회원탈퇴]</a>&nbsp;	
	</div>
</div>
</body>
</html>