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
	<div class="row">
		<div class="col-3">
			<div class="list-group" >
				<a href="userList" class="list-group-item list-group-item-action">회원 목록</a>
				<a href="outUserList" class="list-group-item list-group-item-action active">탈퇴 회원 목록</a>
				<a href="masterOrder" class="list-group-item list-group-item-action">주문 내역</a>
				<a href="reviewList"  class="list-group-item list-group-item-action">리뷰 목록</a>
				<a href="itemList"  class="list-group-item list-group-item-action">메뉴 관리</a>
				<a href="masterBoard"  class="list-group-item list-group-item-action">공자사항 관리</a>
			</div>			
		</div>	
		<div class="col-9">
			<table style="width: 100%;">
				<tr>
					<th colspan="13">HEALAD_탈퇴회원목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${outCount} 회원</th>
				</tr>
				<tr>
					<th>ID </th>
					<th>탈퇴날짜</th>
				</tr>
				<c:if test="${empty outuserList }">
					<tr>
						<td colspan="2"> 조회된 데이터가 없습니다. </td>
					</tr>
				</c:if>
				<c:forEach items="${outuserList}" var="user">
					<tr>
						<td>${user.userId}</td>
						<td><fmt:formatDate value="${user.withdrawDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>		
			</table>	
			
			<div class="container" style="margin-top:10px;">			
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
	</div>
</body>
</html>
