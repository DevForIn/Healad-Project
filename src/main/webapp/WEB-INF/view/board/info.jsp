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
		<h2 id="center">게시판 상세보기</h2>
		<table  class="table table-hover">
		<tr><th style="width:10%;">작성자:</th>
			<td style="width:40%; text-align:left;">${b.writer}</td>
			<th style="width:10%;">등록일:</th>
			<td style="width:40%; text-align:left;">
			<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td></tr>
		<tr><th>제목:</th><td colspan="3">${b.subject}</td></tr>
		<tr height="250px"><th>내용:</th><td colspan="3">${b.content}</td></tr>
		<tr><th>파일:</th><td colspan="3">${b.file1}<br>
		<img src="${path}/upload/${b.file1}" width="50%"></td></tr>
		</table>
		<div id="center" style="padding: 3px;">
			<button  class="btn btn-dark" 
			onclick="location.href='replyForm?num=${b.num}'">답 변</button>
			<button  class="btn btn-dark"
			onclick="location.href='updateForm?num=${b.num}'">수 정</button>
			<button  class="btn btn-dark"
			onclick="location.href='deleteForm?num=${b.num}'">삭 제</button>
			<button  class="btn btn-dark"
			onclick="location.href='list'">목록보기</button>
		</div>
	</div>
</body>
</html>




</body>
</html>