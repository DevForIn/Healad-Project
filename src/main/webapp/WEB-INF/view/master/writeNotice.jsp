<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성</title>
</head>
<body>
	<form:form modelAttribute="notice" action="writeNotice" enctype="multipart/form-data" name="f">
		<caption>공지 작성</caption>
		<table>			
			<tr>
				<td>제목</td>
				<td><form:input path="noSubject" /> <font color="red"><form:errors path="noSubject" /></font></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><form:textarea path="noContent" rows="15" cols="80" /> 
				  <script type="text/javascript">
   					  CKEDITOR.replace("noContent",{ filebrowserImageUploadUrl : "imgupload"});
 				  </script>
				<font color="red"><form:errors path="noContent" /></font></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="noFile"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[공지 등록]</a>
					<a href="masterBoard">[목록]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>