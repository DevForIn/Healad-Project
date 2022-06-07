<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 작성</title>
</head>
<body>
	<form:form modelAttribute="faq" action="writeFaq" name="f">
		<caption>FAQ 작성</caption>
		<table>			
			<tr>
				<td>제목</td>
				<td><form:input path="QUESTION" /></td>
			</tr>
			<tr>
				<td>질의응답</td>
				<td><form:textarea path="ANSWER" rows="15" cols="80" /> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[FAQ 등록]</a>
					<a href="masterBoard">[목록]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>