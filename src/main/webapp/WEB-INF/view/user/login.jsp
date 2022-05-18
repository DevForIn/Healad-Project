<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/user/login.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
</head>
<body>
	<h2 align="center">사용자 로그인</h2>
	<form:form modelAttribute="user" method="post" action="login"
		name="loginform">
		<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="phoneNo" value="000-0000-0000">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">
		<input type="hidden" name="email" value="valid@aaa.bbb">
		<input type="hidden" name="birthDate" value="1500-01-01">
		<spring:hasBindErrors name="user">
			<font color="red"><c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach></font>
		</spring:hasBindErrors>
		<table border="1" style="border-collapse: collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td><form:input path="userId" /> <font color="red">
				<form:errors path="userId" /></font></td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><form:password path="pwd" /> <font color="red">
				<form:errors path="pwd" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='signUp'"> 
					<input type="button" value="아이디찾기" onclick="location.href='idsearch'">
					<input type="button" value="비밀번호찾기" onclick="location.href='pwsearch'">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>