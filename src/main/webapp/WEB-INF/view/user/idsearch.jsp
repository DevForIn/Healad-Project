<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/user/idsearch.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>

<div class="container">

	<input type="hidden" name="userName" value="검증용"> 
	<input type="hidden" name="userId" value="아이디검증용">
	<input type="hidden" name="pwd" value="아이디검증용">
	<input type="hidden" name="postCode" value="000-000">
	<input type="hidden" name="addr" value="한국">
	<input type="hidden" name="addrDetail" value="어딘가">		
	<input type="hidden" name="birthDate" value="1500-01-01">	
	<form:form modelAttribute="user" action="idsearch" method="post"> 
		<spring:hasBindErrors name="user">
			<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach></font>
		</spring:hasBindErrors> 
		<div class="row">
			<div class="col-md-12 col-md-offset-4">
	            <div class="panel panel-default">
	              <div class="panel-body">
	                <div class="text-center">
	                  <h3><i class="fa fa-lock fa-4x"></i></h3>
	                  <h2 class="text-center">아이디를 잊으셨나요?</h2>
	                  <p>이메일 주소와 전화번호를 입력해주세요</p>
	                  <div class="panel-body">
	                      <div class="form-group">
	                        <div class="input-group">
			                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
	                        	<input id="email" name="email" placeholder="이메일" class="form-control"  type="email">
			                    <font color="red"><form:errors path="email" /></font>                        
	                        </div>
	                        <div class="input-group mt-3">
		                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
		                        <input id="phoneNo" name="phoneNo" placeholder="전화번호" class="form-control"  type="phoneNo">
	                        	<font color="red"><form:errors path="phoneNo" /></font>
	                        </div>
	                      </div>
	                      <div class="form-group">
	                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="아이디 찾기" type="submit">
	                        <button class="btn btn-dark btn-lg btn-block" type="button" onclick="history.back()">돌아가기</button>
	                      </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
		</div>		
	</form:form>
</div>






 <%-- <div>
		<input type="hidden" name="userName" value="검증용"> 
		<input type="hidden" name="userId" value="아이디검증용">
		<input type="hidden" name="pwd" value="아이디검증용">
		<input type="hidden" name="postCode" value="000-000">
		<input type="hidden" name="addr" value="한국">
		<input type="hidden" name="addrDetail" value="어딘가">		
		<input type="hidden" name="birthDate" value="1500-01-01">
	<form:form modelAttribute="user" action="idsearch" method="post">
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
		
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">아이디 찾기</h5>
		
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
		                    <button class="btn btn-dark btn-lg btn-block" type="submit">아이디찾기</button>
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
</div>   --%>
</body>
</html>