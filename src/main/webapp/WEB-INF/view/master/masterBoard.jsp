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
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard"  class="current">Notice set</a></li>
			<li><a href="#">Order Status</a></li>
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
			<th colspan="12">HEALAD_FAQ 목록</th>
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
				<td>${notice.noFile}</td>
				<td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd" /></td>
				<td><a href="../user/modifyUser?id=${user.userId}"><strong>수정</strong></a><br>
				 <a	href="../user/deleteUser?id=${user.userId}"><strong>삭제</strong></a>
			</tr>
		</c:forEach>		
	</table>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
	<table style="width: 400px;">
		<tr>
			<th colspan="12">HEALAD_FAQ 목록</th>
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
				<td><c:choose>
					<c:when test="${user.pwd == null}"></c:when>
					<c:otherwise>total 구현필요</c:otherwise>
				</c:choose></td>
				<td><c:choose>
					<c:when test="${user.pwd == null}"></c:when>
					<c:otherwise>${user.mileage} 포인트</c:otherwise>
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
