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
	<input type="hidden" name="outpageNum" value="1"> 
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList" class="current">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard">Notice set</a></li>
			<li><a href="masterOrder">Order Status</a></li>

		</ul>
	</div>
	<div style="width: auto; float: left; padding:0px 500px;">
		<table style="width: 500px;">
			<tr>
				<th colspan="13">HEALAD_탈퇴회원목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${outCount} 회원</th>
			</tr>
			<tr>
				<th>ID </th>
				<th>탈퇴날짜</th>
			</tr>
			<c:forEach items="${outuserList}" var="user">
				<tr>
					<td>${user.userId}</td>
					<td><fmt:formatDate value="${user.withdrawDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>		
		</table>
		<div class="container" style="width: 110%; float: right;">			
			<ul class="pagination justify-content-center">
					<c:if test="${outpageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="outUserList?outpageNum=${outpageNum-1}">Previous</a></li>
					</c:if>
					<c:if test="${outpageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link" href="outUserList?outpageNum=${outpageNum-1}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${outStartPage}" end="${outEndPage}">
						<c:if test="${i == outpageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != outpageNum}">
							<a class="page-link" href="outUserList?outpageNum=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${outpageNum < outMaxPage}">
						<li class='page-item'>
						<a class="page-link" href="outUserList?outpageNum=${outpageNum+1}">Next</a></li>
					</c:if>
					<c:if test="${outpageNum >= outMaxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="outUserList?outpageNum=${outpageNum+1}">Next</a></li>
					</c:if>	
			</ul>
		</div>
	</div>
</body>
</html>
