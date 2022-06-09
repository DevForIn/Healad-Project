<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<script type="text/javascript">
   function inchk(f) {
	   if(f.pwd.value == "") {
		   alert("정보를 입력해주세요.");
		   f.pwd.focus();
		   return false; 
	   }
	   let passlen = f.newpwd1.value.length
	   if(passlen < 5 || passlen > 14) {
		   alert("변경 비밀번호는 5자 이상 14자 미만 이어야 합니다.");
		   f.newpwd1.focus();
		   return false; 
	   }
	   if(f.newpwd1.value != f.newpwd2.value) {
		   alert("변경 비밀번호 와 변경 비밀번호 재입력이 다릅니다.");
		   f.newpwd2.value="";
		   f.newpwd2.focus();
		   return false; 
	   }
	   if(f.newpwd1.value == f.pwd.value) {
		   alert("현재 비밀번호와 다른 비밀번호를 입력해주세요.");
		   f.newpwd1.value="";
		   f.newpwd2.value="";
		   f.newpwd1.focus();
		   return false; 
	   }
	   return true;
   }
</script>

<div class="row">
	<div class="col-3">
		<a href="mypage?id=${loginUser.userId}" class="list-group-item list-group-item-action active">나의 프로필</a>
		<a href="orderList?id=${loginUser.userId}"  class="list-group-item list-group-item-action">주문 목록</a>
		<a href="review?id=${loginUser.userId}"  class="list-group-item list-group-item-action">나의 리뷰</a>	
	</div>
	<div class="col-9">
		<div style="width: 100%;">
			<form action="modifyPW" method="post" name="f" onsubmit="return inchk(this)">
			<input type="hidden" name="userId" value="${user.userId}">
				<table style="width: 100%;">
					<tr>
						<th colspan="2"><h3>[ ${user.userId} ]님의 비밀번호 수정</h3></th>
					</tr>
					<c:if test="${loginUser.userId == 'admin'}"><tr><th colspan="2">관리자일경우 System 계정의 Password 입력.</th></tr></c:if>
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>변경 비밀번호</td>
						<td><input type="password" name="newpwd1"></td>
					</tr>
					<tr>
						<td>변경 비밀번호 재입력</td>
						<td><input type="password" name="newpwd2"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="비밀번호 변경">
						<a href="#" onclick="history.back()"><input type="button" value="돌아가기"></a>
						</td>
					</tr>
				</table>
			</form>
		</div>	
	</div>
</div>
</body>
</html>