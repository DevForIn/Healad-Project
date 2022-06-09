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
<div class="row">
	<div class="col-3">
		<a href="mypage?id=${loginUser.userId}" class="list-group-item list-group-item-action active">나의 프로필</a>
		<a href="orderList?id=${loginUser.userId}"  class="list-group-item list-group-item-action">주문 목록</a>
		<a href="review?id=${loginUser.userId}"  class="list-group-item list-group-item-action">나의 리뷰</a>	
	</div>
	<div class="col-9">
	<form method="post" action="deleteUser" name="deleteform">
		<table style="width: 100%;">
			<tr>
				<th colspan="2"><h3>[ ${user.userId}님 ] 탈퇴 확인</h3></th>
			</tr>
			<c:if test="${loginUser.userId == 'admin'}"><tr><th colspan="2">관리자일경우 System 계정의 Password 입력.</th></tr></c:if>
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
</div>
	
</body>
</html>