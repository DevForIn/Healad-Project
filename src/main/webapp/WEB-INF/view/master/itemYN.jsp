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
	document.getElementById('itemYNform').submit();
}
function fin(){
	opener.parent.location.reload();
	window.close();
}
</script>
	<c:if test="${item.useYn =='Y'}"><c:set var="N" value="비활성화" /></c:if>
	<c:if test="${item.useYn =='N'}"><c:set var="Y" value="활성화" /></c:if>
	<form method="post" action="itemYN" id="itemYNform">
	<input type="hidden" name="itemId" value="${item.itemId}">
	<input type="hidden" name="useYn" value="${item.useYn}">
	<table style="width: 450px;">
		<tr>
			<th colspan="2"><h3>${chk} [ ${item.itemName} ] 상품을 ${Y}${N} 하시겠습니까 ?</h3><br></th>
		</tr>
		<tr>
			<th colspan="2"><img src="${path}/img/${item.pictureUrl}" style="width: 300px; height: 200px;"></th>
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