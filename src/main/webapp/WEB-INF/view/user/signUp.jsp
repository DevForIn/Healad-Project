<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }" />   
<c:set var="now" value="<%= new java.util.Date() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
<script type="text/javascript">

function idchk(){
	let result = document.querySelector("#result")
	let id = document.getElementById("userId").value;
	if((id.length < 5) || (id.length > 12)){
		result.style.color='red'
		result.innerHTML=" -> 아이디는 5~12자리로 입력하세요."
	} else { 
		$.ajax({			
			url : "${path}/ajax/idchk",
			data : "userId="+id,
			success : function(chk){
				if(chk.trim()=='false'){
					result.style.color='blue';
					result.innerHTML=" -> 사용 가능합니다.";
				} else{
					result.style.color='red';
					result.innerHTML=" -> 중복된 아이디입니다.";
				} 
			}
		})
	}	
}
function BirthDate(){
	let day1=""
	let day2=""
	let day3=""
	day1=$("select[name=year]").val();
	day2=$("select[name=month]").val();
	day3=$("select[name=day]").val();	
	document.getElementById("birthDate").value=day1+day2+day3;	
}

</script>
	<h2 align="center">! - 회원 가입 - !</h2>
	<form:form modelAttribute="user" method="post" action="signUp">

		<spring:hasBindErrors name="user">
			<font color="red">
			 <c:forEach items="${errors.globalErrors }"	var="error">
					<h6 align="center"><spring:message code="${error.code }" /></h6>
			 </c:forEach></font>
		</spring:hasBindErrors>
		
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>아이디</th>
				<td>			
					<form:input path="userId"/>
					<input type="button" value="ID Check" onclick="idchk()">
					<span id="result"></span>
				</td>				
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><form:password path="pwd" />
				 <font color="red"><form:errors	path="pwd" /></font></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><form:input path="userName" />
				 <font color="red"><form:errors	path="userName" /></font></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><form:input path="phoneNo" />
				 <font color="red"><form:errors	path="phoneNo" /></font></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><form:input path="postCode" />
				 <font color="red"><form:errors	path="postCode" /></font></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><form:input path="addr" />
				 <font color="red"><form:errors	path="addr" /></font></td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td><form:input path="addrDetail" />
				 <font color="red"><form:errors	path="addrDetail" /></font></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><form:input path="email" />
				 <font color="red"><form:errors	path="email" /></font></td>
			</tr>
			<tr>
                <th>생년월일</th>
                <td>
                <fmt:formatDate var="date" value="${now}" pattern="yyyy" />
				<form:input type="hidden" path="birthDate" name="birthDate"/>
                    <select name="year">
                    	<option value="">-Year-</option>                    	
                    	<c:forEach var="i" begin="${date-120}" end="${date}">  
                        	<option value="${date - i + (date-120)}-"> ${date - i + (date-120)}</option>
                    	</c:forEach>
                    </select>
                    <select name="month">
                    	<option value="">-Month-</option>
                  		<c:forEach var="i" begin="1" end="12">        
							<c:choose>
	                        	<c:when test="${i<10}">
	                        		<option value="0${i}-">0${i}</option>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<option value="${i}-">${i}</option>
	                        	</c:otherwise>
	                        </c:choose>
                   		</c:forEach>
                    </select>
                    <select name="day">
	                    <option value="">-Day-</option>
	                    <c:forEach var="i" begin="1" end="31">
							<c:choose>
	                        	<c:when test="${i<10}">
	                        		<option value="0${i}">0${i}</option>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<option value="${i}">${i}</option>
	                        	</c:otherwise>
	                        </c:choose>
	                    </c:forEach>
                    </select>
                    <br><font color="red"><form:errors	path="birthDate" /></font>
                </td>
            </tr>
			<tr>
				<td colspan="2" align="center">
				  <input type="submit" value="가입하기" onclick="BirthDate()">
				  <input type="button" value="메인으로" onclick="location.href='${path}'">
				</td>
			</tr>
		</table>
	</form:form>
</body>

</html>
