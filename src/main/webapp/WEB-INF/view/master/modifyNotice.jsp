<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/board/update.jsp --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정 화면</title>
<script type="text/javascript">
	function file_delete() {
		document.updateform.file2.value = "";
<%-- 수정 전 첨부파일 이름--%>
	document.getElementById("file_desc").style.display = "none";
	}
</script>
</head>
<body>
	<form:form modelAttribute="board" action="update"
		enctype="multipart/form-data" name="updateform">
		<input type="hidden" name="file2" value="${notice.fileurl}">
		<table>
			<tr>
				<td>제목</td>
				<td><form:input path="subject" />
					<form:errors path="subject" class="errortext" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><form:textarea path="content" cols="67" rows="15" /> <script
						type="text/javascript">
					CKEDITOR.replace("content", {
						filebrowserImageUploadUrl : "imgupload"
					});
				</script> <form:errors path="content" class="errortext" /></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>&nbsp; <c:if test="${!empty board.fileurl}">
						<div id="file_desc">
							<a href="file/${board.fileurl}">${board.fileurl}</a>&nbsp; <a
								href="javascript:file_delete()">[첨부파일삭제]</a>
						</div>
					</c:if> <input type="file" name="file1" id="file1">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><form:password path="pass" />
					<form:errors path="pass" class="errortext" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:document.updateform.submit()">[수정]</a>&nbsp; <a
					href="list?boardid=${boardid}">[목록]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>