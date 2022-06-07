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

	.left {
	        text-align : left;
		}
	.table thead th {	
			border: 3px solid silver;
			border-collapse: collapse;  }
	body {
			font-size:14px;}	
	th {    					
 			border: 2px solid silver;
			background-color:#c9c9c9;
	        color : #000000;
	        font-weight:bold;
	        text-align:center;}
	
	.table td {
		border:1px solid silver;;
	}
	td { 
			background-color: #FFFFFF;  }
</style>
	<hr>
	<div class="container">
		<h2 align="center">공지 상세</h2>
		<table class="table table-hover">
			<tr>
				<th style="width: 10%;">작성자</th>
				<td style="width: 40%; text-align: left;">Healad-Manager</td>
				<th style="width: 10%;">등록일</th>
				<td style="width: 40%; text-align: left;">
				<fmt:formatDate	value="${notice.noRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="left" colspan="3">${notice.noSubject}</td>
			</tr>
			<tr height="250px">
				<th>내용</th>
				<td class="left" colspan="3">${notice.noContent}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:choose>
					<c:when test="${notice.noFileUrl == null or notice.noFileUrl == ''}">
						<td colspan="3"> - </td> 
					</c:when>
					<c:otherwise>
						<td colspan="3"><a href="${path}/board/file/${notice.noFileUrl}" download="${notice.noFileUrl}">다운로드 : ${notice.noFileUrl}</a></td>
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