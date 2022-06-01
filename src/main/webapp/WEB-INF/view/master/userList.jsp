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
</head>
<body>
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList" class="current">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard">Notice set</a></li>
			<li><a href="masterOrder">Order Status</a></li>
		</ul>
	</div>
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
		<tr>
			<th colspan="12">HEALAD_회원목록</th>
		</tr>
		<tr>
			<th>ID <a href="userList?sort=0" class="noline">▲</a>
				<a href="userList?sort=1" class="noline">▼</a></th>
			<th>닉네임</th>
			<th>PASS</th>
			<th>전화</th>
			<th>E-mail</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>총 주문 금액</th>
			<th>마일리지</th>
			<th>가입날짜</th>
			<th>탈퇴여부</th>
			<th>정보관리</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<c:if test="${user.withdrawYn == 'N'}">
			<c:if test="${user.userId != 'admin'}">
			<tr>
				<td>${user.userId}</td>
				<td>${user.userName}</td>
				<td><a href="../user/modifyPW?id=${user.userId}"><strong>${user.pwd}</strong></a></td>
				<td>${user.phoneNo}</td>
				<td>${user.email}</td>
				<td><fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd" /></td>
				<td>${user.addr} ${user.addrDetail}</td>
				<td>				
					<fmt:formatNumber value="${user.total}" pattern="###,###,###"/> 원</td>				
				<td><c:choose>
					<c:when test="${user.pwd == null}"></c:when>
					<c:otherwise>${user.mileage} Point</c:otherwise>
				</c:choose></td>				
				<td><fmt:formatDate value="${user.joinDate}" pattern="yyyy-MM-dd" /></td>
				<td>${user.withdrawYn}</td>
				<td><a href="../user/modifyUser?id=${user.userId}"><strong>정보수정</strong></a><br>
				 <a	href="../user/deleteUser?id=${user.userId}"><strong>강제탈퇴</strong></a>
			</tr></c:if>
			</c:if>
		</c:forEach>		
	</table>
	</div>
</body>
</html>
