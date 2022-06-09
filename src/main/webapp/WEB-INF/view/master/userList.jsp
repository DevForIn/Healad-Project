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
	<div class="row">
		<div class="col-3">
			<div class="list-group" >
				<a href="userList" class="list-group-item list-group-item-action active">회원 목록</a>
				<a href="outUserList" class="list-group-item list-group-item-action">탈퇴 회원 목록</a>
				<a href="masterOrder" class="list-group-item list-group-item-action">주문 내역</a>
				<a href="reviewList"  class="list-group-item list-group-item-action">리뷰 목록</a>
				<a href="itemList"  class="list-group-item list-group-item-action">메뉴 관리</a>
				<a href="masterBoard"  class="list-group-item list-group-item-action">공자사항 관리</a>
			</div>			
		</div>	
		<div class="col-9">
			<table style="width: 100%;">
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
					<th style="width: 25%;">주소</th>
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
						<td class="left">${user.addr} ${user.addrDetail}</td>
						<td><fmt:formatNumber value="${user.mileage*20}" pattern="###,###,###"/> 원</td>				
						<td><fmt:formatNumber value="${user.mileage}" pattern="###,###,###"/> Point</td>				
						<td><fmt:formatDate value="${user.joinDate}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-warning" onclick="location.href='../user/modifyUser?id=${user.userId}'">정보수정</button><br>
							<button type="button" class="btn btn-danger" onclick="location.href='../user/deleteUser?id=${user.userId}'">강제탈퇴</button>
						 </td>
					</tr>
				</c:forEach>		
			</table>
			<div class="container"  class="container" style="margin-top:10px;">			
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
	</div>

</body>
</html>
