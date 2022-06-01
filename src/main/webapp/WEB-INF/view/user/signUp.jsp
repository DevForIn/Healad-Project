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
	if(day1=="" || day2=="" || day3 == ""){
		return false;
	}else{
	document.getElementById("birthDate").value=day1+"-"+day2+"-"+day3;
	}
}
</script>
	<form:form modelAttribute="user" method="post" action="signUp">
		<spring:hasBindErrors name="user">
			<font color="red">
			 <c:forEach items="${errors.globalErrors }"	var="error">
					<h6 align="center"><spring:message code="${error.code }" /></h6>
			 </c:forEach></font>
		</spring:hasBindErrors>	
				<section class="vh-100"">
		  <div class="container py-5 h-100">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col col-xl-10">
		        <div class="card" style="border-radius: 1rem;">
		          <div class="row g-0">
		            <div class="col-md-6 col-lg-7 d-flex align-items-center">
		              <div class="card-body p-4 p-lg-5 text-black">
		                <form>
		                  <div class="d-flex align-items-center mb-3 pb-1">
		                    <i class="fa fa-user-circle-o fa-2x me-3" style="color: #ff6219;"></i>
		                    <span class="h1 fw-bold ml-2 mb-0">HEALAD</span>
		                  </div>		
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">회원 가입</h5>

		                  <div class="form-outline mb-4">
		                  	<label class="form-label" for="form2Example17">아이디</label>
		                    <form:input path="userId" class="form-control form-control-lg" /> 
							<input type="button" value="ID Check" onclick="idchk()">
							<span id="result"></span>		                    
		                  </div>
		
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">비밀번호</label>
		                  	<form:password path="pwd" class="form-control form-control-lg"/>
		                   	<font color="red"><form:errors	path="pwd" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  <label class="form-label" for="form2Example27">닉네임</label>
		                  	<form:input path="userName" class="form-control form-control-lg"/>
		                    <font color="red"><form:errors	path="userName" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">전화번호</label>
		                  	<form:input path="phoneNo" class="form-control form-control-lg"/>
		                    <font color="red"><form:errors	path="phoneNo" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">우편번호</label>
		                  	<form:input path="postCode" class="form-control form-control-lg"/>
		                    <font color="red"><form:errors	path="postCode" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">주소</label>
		                  	<form:input path="addr" class="form-control form-control-lg"/>
		                    <font color="red"><form:errors	path="addr" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">상세 주소</label>
		                  	<form:input path="addrDetail" class="form-control form-control-lg"/>
		                  	<font color="red"><form:errors	path="addrDetail" /></font>		                   
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">이메일</label>
		                  	<form:input path="email" class="form-control form-control-lg"/>
		                  	<font color="red"><form:errors	path="email" /></font>		                    
		                  </div>
		                  
		                  <div class="form-outline mb-4" >
		                  	<label class="form-label" for="form2Example27">생년월일</label>		                  	
							<fmt:formatDate var="date" value="${now}" pattern="yyyy" />
							<form:input type="hidden" path="birthDate" name="birthDate"/>
			                    <select name="year">
			                    	<option value="">-Year-</option>                    	
			                    	<c:forEach var="i" begin="${date-120}" end="${date}">  
			                        	<option value="${date - i + (date-120)}"> ${date - i + (date-120)}</option>
			                    	</c:forEach>
			                    </select>
			                    <select name="month">
			                    	<option value="">-Month-</option>
			                  		<c:forEach var="i" begin="1" end="12">        
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
		                    <font color="red"><form:errors	path="birthDate" /></font>
		                  </div>		                  
		
		                  <div class="pt-1 mb-4">
		                    <button class="btn btn-dark btn-lg btn-block" type="submit" onclick="BirthDate()">가입하기</button>
		                    <button class="btn btn-dark btn-lg btn-block" type="button" onclick="history.back()">돌아가기</button>
		                  </div>
		                </form>		
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>			
	</form:form>	
</body>
</html>
