<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/user/pwsearch.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div>
		<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="pwd" value="PWD검증용">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">		
		<input type="hidden" name="birthDate" value="1500-01-01">
	<form:form modelAttribute="user" action="pwsearch" method="post">
		<spring:hasBindErrors name="user">
			<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
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
		
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">비밀번호 찾기</h5>
		
		                  <div class="form-outline mb-4" >
		                    <label class="form-label" for="form2Example27">ID</label>
		                  	<form:input path="userId" class="form-control form-control-lg"/>
		                   	<font color="red"><form:errors path="userId" /></font>
		                  </div>
		                  
		                  <div class="form-outline mb-4">
		                    <label class="form-label" for="form2Example17">이메일</label>
		                    <form:input path="email" class="form-control form-control-lg" /> 
		                 	<font color="red"><form:errors path="email" /></font>
		                  </div>
		
		                  <div class="form-outline mb-4" >
		                    <label class="form-label" for="form2Example27">전화번호</label>
		                  	<form:input path="phoneNo" class="form-control form-control-lg"/>
		                   	<font color="red"><form:errors path="phoneNo" /></font>
		                  </div>
		
		                  <div class="pt-1 mb-4">
		                    <button class="btn btn-dark btn-lg btn-block" type="submit">비밀번호찾기</button>
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
</div>
</body>
</html>