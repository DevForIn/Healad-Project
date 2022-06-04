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
	<hr>
	<div class="container">
		<h2 align="center">공지 상세</h2>
		<table class="table table-hover">
			<tr>
				<th style="width: 10%;">작성자:</th>
				<td style="width: 40%; text-align: left;">Healad-Manager</td>
				<th style="width: 10%;">등록일:</th>
				<td style="width: 40%; text-align: left;">
				<fmt:formatDate	value="${notice.noRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th>제목:</th>
				<td colspan="3">${notice.noSubject}</td>
			</tr>
			<tr height="250px">
				<th>내용:</th>
				<td colspan="3">${notice.noContent}</td>
			</tr>
			<tr>
				<th>첨부파일:</th>
				<c:choose>
					<c:when test="${notice.noFileUrl == null or notice.noFileUrl == ''}">
						<td colspan="3"> - </td> 
					</c:when>
					<c:otherwise>
						<td colspan="3">${notice.noFile}<br> 
						<img src="${path}/board/file/${notice.noFileUrl}" width="50%"></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div id="center" align="center" style="padding: 3px;">
			<button class="btn btn-dark" onclick="location.href='mainBoard'">목록보기</button>
		</div>
	</div>
</body>
</html>