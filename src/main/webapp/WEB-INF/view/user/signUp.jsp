<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="path" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>

<body>
	<h2 align="center">! - 회원 가입 - !</h2>
	<form:form modelAttribute="user" method="post" action="signUp">
	<%-- global 오류 화면 출력 부분  --%>
		<spring:hasBindErrors name="user">
			<font color="red">
	<%-- errors.globalErrors : Controller에서 BindingResult.reject()함수로 설정한   --%>
			 <c:forEach items="${errors.globalErrors }"	var="error">
					<spring:message code="${error.code }" />
			 </c:forEach></font>
		</spring:hasBindErrors>
		
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>아이디</td>
				<td><form:input path="USER_ID" />
				   <font color="red"><form:errors path="USER_ID" /></font></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><form:password path="PWD" />
				 <font color="red"><form:errors	path="PWD" /></font></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><form:input path="USER_NAME" />
				 <font color="red"><form:errors	path="USER_NAME" /></font></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><form:input path="PHONE_NO" />
				 <font color="red"><form:errors	path="PHONE_NO" /></font></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><form:input path="POST_CODE" />
				 <font color="red"><form:errors	path="POST_CODE" /></font></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><form:input path="ADDR" />
				 <font color="red"><form:errors	path="ADDR" /></font></td>
			</tr>
			<tr>
				<td>상세 주소</td>
				<td><form:input path="ADDR_DETAIL" />
				 <font color="red"><form:errors	path="ADDR_DETAIL" /></font></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><form:input path="EMAIL" />
				 <font color="red"><form:errors	path="EMAIL" /></font></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><form:input path="BIRTH_DATE" />
				 <font color="red"><form:errors	path="BIRTH_DATE" /></font></td>
			</tr>			
			<tr>
				<td colspan="2" align="center">
				  <input type="submit" value="가입하기">
				  <input type="button" value="메인으로" onclick="location.href='${path}'">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>