<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />  
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
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard"  class="current">Notice set</a></li>
			<li><a href="masterOrder">Order Status</a></li>
		</ul><br><br><br><br><br>
		<ul>
			<li><a href="${path}/board/mainBoard"><h3>Board Page</h3></a></li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
		</ul>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
		<table style="width: 600px;">
		<tr>
			<th colspan="7">HEALAD_공지 목록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noCount} 개</th>
		</tr>
		<tr>
			<th>공지 ID</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
			<th>첨부파일</th>
			<th>등록일자</th>
			<th>Modify</th>
		</tr>
		<c:forEach items="${notice}" var="notice">
			<tr>
				<td>${notice.noticeId}</td>
				<td>${notice.noSubject}</td>
				<td><a href="../board/noticeInfo?num=${notice.noticeId}"><strong>[내용확인]</strong></a></td>
				<td>${notice.noReadCnt}</td>
				<td><a href="${path}/board/file/${notice.noFileUrl}">${notice.noFileUrl}</a></td>
				<td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd" /></td>
				<td><a href="modifyNotice?num=${notice.noticeId}"><strong>수정</strong></a><br>
			</tr>
		</c:forEach>	
		<tr><th colspan="7"><a href="${path}/board/writeNotice">공지 작성</a></th></tr>
	</table>
	<div class="container">			
			<ul class="pagination justify-content-center">
					<c:if test="${pageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum-1}">Previous</a></li>
					</c:if>
					<c:if test="${pageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link"	href="masterBoard?pageNum=${pageNum-1}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == pageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != pageNum}">
							<a class="page-link" href="masterBoard?pageNum=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageNum < maxPage}">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum+1}">Next</a></li>
					</c:if>
					<c:if test="${pageNum >= maxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum+1}">Next</a></li>
					</c:if>	
			</ul>
		</div>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
	<table style="width: 400px;">
		<tr>
			<th colspan="12">HEALAD_FAQ 목록</th>
		</tr>
		<c:forEach items="">

		</c:forEach>		
	</table>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
	<table style="width: 200px;">
		<tr>
			<th colspan="12">HEALAD_Review 목록</th>
		</tr>
		<tr>

		</tr>
		<c:forEach items="${userList}" var="user">

		</c:forEach>		
	</table>
	</div>
</body>
</html>
