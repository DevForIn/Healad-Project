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
td {
	width : 200px;
	border: 1px solid #bcbcbc;
}
</style>
	<hr>
	<div class="container">
		<h2 align="center">FAQ_No.${faq.faqId} 상세</h2>
		<hr>
		<table class="table table-hover">
			<tr>
				<td>제목:</td>
				<td colspan="3">${faq.QUESTION}</td>
			</tr>
		</table>
		<hr>
		<table>
			<tr height="250px">
				<td>질의응답:</td>
				<td colspan="3">${faq.ANSWER}</td>
			</tr>			
		</table>
		<div id="center" align="center" style="padding: 3px;">
			<button class="btn btn-dark" onclick="self.close();">닫기</button>
		</div>
	</div>
</body>
</html>