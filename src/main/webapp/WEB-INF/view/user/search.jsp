<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/user/pwsearch.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 정보 조회</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<h3 align="center">${title} 정보 확인</h3>
		<table>
			<tr>
				<th>${title}</th>				
				<td>${result}</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인하기" onclick="location.href='login'">
					<c:if test="${title =='아이디'}">
					<input type="button" value="비밀번호 찾기" onclick="location.href='pwsearch'">
					</c:if>
				</td>
			</tr>
	</table>
</body>
</html>