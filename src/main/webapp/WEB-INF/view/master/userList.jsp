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
	<input type="hidden" name="pageNum" value="1"> 
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList" class="current">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard">Notice set</a></li>
			<li><a href="masterOrder">Order Status</a></li>
		</ul>
	</div>
	<div style="width: 82%; float: right;">
	<table style="width: 1450px;">
		<tr>
			<th colspan="13">HEALAD_회원목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${count-1} 회원</th>
		</tr>
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>닉네임</th>
			<th>PASS</th>
			<th>전화</th>
			<th>E-mail</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>총 주문 금액<a href="userList?pageNum=${pageNum}&sort=1" class="noline">▲</a>
				<a href="userList?pageNum=${pageNum}&sort=2" class="noline">▼</a></th>
			<th>마일리지</th>
			<th>가입날짜</th>
			<th>정보관리</th>
		</tr>
		<c:set var="NoNum" value="${(pageNum-1)*20+1}"/>
		<c:forEach items="${userList}" var="user">	
			<tr>
				<td>
					${NoNum}
					<c:set var="NoNum" value="${NoNum+1}"/></td>
				<td>${user.userId}</td>
				<td>${user.userName}</td>
				<td><a href="../user/modifyPW?id=${user.userId}"><strong>${user.pwd}</strong></a></td>
				<td>${user.phoneNo}</td>
				<td>${user.email}</td>
				<td>
				<c:choose>
					<c:when test="${user.birthDate == null}"> - </c:when>
					<c:otherwise>
						<fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd" />
					</c:otherwise>
				</c:choose>
				</td>
				<td>${user.addr} ${user.addrDetail}</td>
				<td><fmt:formatNumber value="${user.mileage*20}" pattern="###,###,###"/> 원</td>				
				<td><fmt:formatNumber value="${user.mileage}" pattern="###,###,###"/> Point</td>				
				<td><fmt:formatDate value="${user.joinDate}" pattern="yyyy-MM-dd" /></td>
				<td><a href="../user/modifyUser?id=${user.userId}"><strong>정보수정</strong></a><br>
				 <a	href="../user/deleteUser?id=${user.userId}"><strong>강제탈퇴</strong></a>
			</tr>
		</c:forEach>		
	</table>
	<div class="container">			
			<ul class="pagination justify-content-center">
					<c:if test="${pageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="userList?pageNum=${pageNum-1}&sort=${sortnum}">Previous</a></li>
					</c:if>
					<c:if test="${pageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link"	href="userList?pageNum=${pageNum-1}&sort=${sortnum}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == pageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != pageNum}">
							<a class="page-link" href="userList?pageNum=${i}&sort=${sortnum}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageNum < maxPage}">
						<li class='page-item'>
						<a class="page-link" href="userList?pageNum=${pageNum+1}&sort=${sortnum}">Next</a></li>
					</c:if>
					<c:if test="${pageNum >= maxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="userList?pageNum=${pageNum+1}&sort=${sortnum}">Next</a></li>
					</c:if>	
			</ul>
		</div>
	</div>
</body>
</html>
