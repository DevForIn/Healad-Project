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
<title>비밀번호찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<h3 align="center">비밀번호찾기</h3>
			<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="pwd" value="PWD검증용">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">		
		<input type="hidden" name="birthDate" value="1500-01-01">
	<form:form modelAttribute="user" action="pwsearch" method="post">
		<spring:hasBindErrors name="user">
			<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach></font>
		</spring:hasBindErrors>
		<table>
			<tr>
				<th>아이디</th>
				<td><form:input path="userId"/><font color="red">
				<form:errors path="userId" /></font></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><form:input path="email" /><font color="red">
				<form:errors path="email" /></font></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><form:input path="phoneNo" /><font color="red">
				<form:errors path="phoneNo" /></font></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="비밀번호찾기"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>