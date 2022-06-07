<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <c:set var="path" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활성화/비활성화</title>
</head>
<body>
<script type="text/javascript">
function changeYN(){
	document.getElementById('deleteBoardForm').submit();
}
function fin(){
	opener.parent.location.reload();
	window.close();
}
</script>
	<form method="post" action="deleteBoard" id="deleteBoardForm">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<input type="hidden" name="faqId" value="${faq.faqId}">
		<input type="hidden" name="reviewSeq" value="${review.reviewSeq}">
	<table style="width: 450px;">
		<tr>
			<th colspan="2"><h3>ID : ${review.reviewSeq}${notice.noticeId}${faq.faqId}번<br>
			 제목 : ${notice.noSubject} ${faq.QUESTION} ${review.rvSubject} <br> 해당 항목을 삭제 하시겠습니까 ?</h3><br></th>
		</tr>
		<tr>
			<td colspan="2" align="center"><br>
				<input type="button" name="2" value="확인" onclick="changeYN();">
				<input type="button" name="3" value="닫기" onclick="javascript:self.close();">
			</td>
		</tr>
	</table>
	<c:if test="${chk == 'ok'}">
		<script type="text/javascript">
			fin();
		</script>
	</c:if>
	</form>	
</body>
</html>