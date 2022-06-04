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
	function file_delete() {
		document.updateform.file2.value = "";
		document.getElementById("file_desc").style.display = "none";
	}
</script>
	<form:form modelAttribute="notice" action="modifyNotice?num=${notice.noticeId }" enctype="multipart/form-data" name="updateform">
		<input type="hidden" name="file2" value="${notice.noFileUrl}">
		<table>
			<tr>
				<td>제목</td>
				<td><form:input path="noSubject" /> 
				<form:errors path="noSubject"	class="errortext" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><form:textarea path="noContent" cols="67" rows="15" /> 
			</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${!empty notice.noFileUrl}">
						<div id="file_desc">
						<a href="file/${notice.noFileUrl}">${notice.noFileUrl}</a>&nbsp;
						<a href="javascript:file_delete()">[첨부파일삭제]</a>
	    				</div>
					</c:if> 
					<input type="file" name="noFile" id="file1">
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