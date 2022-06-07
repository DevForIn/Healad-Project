<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }" />  

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>사용자 정보 수정</title></head>
<body>
<div class="a" style="background-color:#ffff80; height:100%; width:15%; float:left;">
<ul>
	<li><a href="mypage?id=${loginUser.userId}" class="current">My Profile</a></li>
	<li><a href="">Order List</a></li>
	<li><a href="">My Review</a></li>
</ul>
</div>
<div style="width:60%; float:right;" >
<form:form modelAttribute="user" method="post" action="modifyUser">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors }"	var="error">
				<spring:message code="${error.code }" />
			</c:forEach></font>
	</spring:hasBindErrors>	
	<input type="hidden" name="userId" value="${user.userId}">
 <table style="width:500px;">
		<tr>
			<th colspan="2"><h3>[ ${user.userId} ]님의 정보 수정</h3></th></tr>
			<c:if test="${loginUser.userId == 'admin'}"><tr><th colspan="2">관리자일경우 System 계정의 Password 입력.</th></tr></c:if>
    <tr><td>비밀번호확인</td><td><form:password path="pwd"  />
      <font color="red"><form:errors path="pwd" /></font></td></tr>
    <tr><td>닉네임</td><td><form:input path="userName" />
      <font color="red"><form:errors path="userName" /></font></td></tr>
    <tr><td>전화번호</td><td><form:input path="phoneNo" />
      <font color="red"><form:errors path="phoneNo" /></font></td></tr>
    <tr><td>우편번호</td><td><form:input path="postCode" />
      <font color="red"><form:errors path="postCode" /></font></td></tr>
    <tr><td>주소</td><td><form:input path="addr" />
      <font color="red"><form:errors path="addr" /></font></td></tr>
    <tr><td>상세주소</td><td><form:input path="addrDetail" />
      <font color="red"><form:errors path="addrDetail" /></font></td></tr>
    <tr><td>이메일</td><td><form:input path="email" />
      <font color="red"><form:errors path="email" /></font></td></tr>
    <tr><td>생년월일</td><td><form:input path="birthDate" />
      <font color="red"><form:errors path="birthDate" /></font></td></tr>
    <tr><td colspan="2" align="center">
       <input type="submit" value="회원 정보 수정"> 
       	<a href="#" onclick="history.back()"><input type="button" value="돌아가기"></a>
       </td></tr>
       
  </table></form:form>
 </div>
</body></html>