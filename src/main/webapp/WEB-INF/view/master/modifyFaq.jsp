<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정 화면</title>
</head>
<body>
<script type="text/javascript">
</script>
	<form:form modelAttribute="faq" action="modifyFaq?num=${faq.faqId }" name="updateform">
		<table>
			<tr>
				<td>제목</td>
				<td><form:input path="QUESTION" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><form:textarea path="ANSWER" cols="67" rows="15" /> 
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:document.updateform.submit()">[수정]</a>&nbsp; <a
					href="masterBoard">[목록]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>