<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/user/login.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
</head>
<body>
	<form:form modelAttribute="user" method="post" action="login" name="loginform">
		<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="phoneNo" value="000-0000-0000">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">
		<input type="hidden" name="email" value="valid@aaa.bbb">
		<input type="hidden" name="birthDate" value="1500-01-01">
		<spring:hasBindErrors name="user">
			<font color="red"><c:forEach items="${errors.globalErrors}"
					var="error">
						<h6 align="right"><spring:message code="${error.code }" /></h6>
				</c:forEach></font>
		</spring:hasBindErrors>		
		<section class="vh-100">
		  <div class="container py-5 h-100">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col col-xl-10">
		        <div class="card" style="border-radius: 1rem;">
		          <div class="row g-0">
		            <div class="col-md-6 col-lg-5 d-none d-md-block">
		              <img src="../img/sal3-1.png"
		                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
		            </div>
		            <div class="col-md-6 col-lg-7 d-flex align-items-center">
		              <div class="card-body p-4 p-lg-5 text-black">
		                <form>
		                  <div class="d-flex align-items-center mb-3 pb-1">
		                    <i class="fa fa-user-circle-o fa-2x me-3" style="color: #ff6219;"></i>
		                    <span class="h1 fw-bold ml-2 mb-0">HEALAD</span>
		                  </div>
		
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">로그인이 필요합니다.</h5>
		
		                  <div class="form-outline mb-4">
		                    <form:input path="userId" class="form-control form-control-lg" /> 
		                    <label class="form-label" for="form2Example17">아이디</label>
		                  </div>
		
		                  <div class="form-outline mb-4" >
		                  	<form:password path="pwd" class="form-control form-control-lg"/>
		                    <label class="form-label" for="form2Example27">비밀번호</label>
		                  </div>
		
		                  <div class="pt-1 mb-4">
		                    <button class="btn btn-dark btn-lg btn-block" type="submit" onclick="weComeH()">로그인</button>
		                  </div>
		
		                  <a class="small text-muted" href="idsearch">아이디를 잊으셨나요?</a>
		                  <a class="small text-muted" href="pwsearch">비밀번호를 잊으셨나요?</a>
		                  <p class="mb-5 pb-lg-2" style="color: #393f81;">계정이 없으신가요? <a href="signUp"
		                      style="color: #393f81;">회원가입 바로가기</a></p>
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
	
	






<%-- <div class="loginF">
	<h2 align="center">사용자 로그인</h2>
	<form:form modelAttribute="user" method="post" action="login"
		name="loginform">
		<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="phoneNo" value="000-0000-0000">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">
		<input type="hidden" name="email" value="valid@aaa.bbb">
		<input type="hidden" name="birthDate" value="1500-01-01">
		<spring:hasBindErrors name="user">
			<font color="red"><c:forEach items="${errors.globalErrors}"
					var="error">
						<h6 align="right"><spring:message code="${error.code }" /></h6>
				</c:forEach></font>
		</spring:hasBindErrors>
		<table border="1" style="border-collapse: collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td><form:input path="userId" /> 
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><form:password path="pwd" />
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="로그인" onclick="weComeH()">
					<input type="button" value="회원가입" onclick="location.href='signUp'"> 
					<input type="button" value="아이디찾기" onclick="location.href='idsearch'">
					<input type="button" value="비밀번호찾기" onclick="location.href='pwsearch'">
				</td>
			</tr>
		</table>
	</form:form>
	</div> --%>
</body>
</html>