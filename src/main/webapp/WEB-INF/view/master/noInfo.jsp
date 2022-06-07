<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세보기</title>
</head>
<body>
<style>
	table {
	    width: 100%;
	  }
	th {
		text-align: center;
		border: 1px solid #bcbcbc;
		width:200px;
	}
	td {
		border: 1px solid #bcbcbc;
	}
</style>
	<hr>
	<div class="container">
		<h2 align="center">Notice_No.${notice.noticeId} 상세</h2>
		<hr>
		<table class="table table-hover">
			<tr>
				<th>제목:</th>
				<td>${notice.noSubject}</td>
			</tr>
			<tr>
				<th>등록일:</th>
				<td><fmt:formatDate	value="${notice.noRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</table>
		<hr>
		<table>
			<tr height="250px">
				<th>내용:</th>
				<td>${notice.noContent}</td>
			</tr>
			<tr height="250px">
				<th>첨부파일:</th>
				<c:choose>
					<c:when test="${notice.noFileUrl == null or notice.noFileUrl == ''}">
						<td colspan="3"> - </td> 
					</c:when>
					<c:otherwise>
						<td colspan="3"> ${notice.noFileUrl}<br><br> 
						<img src="${path}/board/file/${notice.noFileUrl}" width="50%"></td>
					</c:otherwise>
				</c:choose>
			</tr>			
		</table>
		<div id="center" align="center" style="padding: 3px;">
			<button class="btn btn-dark" onclick="self.close();">닫기</button>
		</div>
	</div>
</body>
</html>