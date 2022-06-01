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
<title>아이디 정보 조회</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div>
	<h3 align="center">${title} 정보 확인</h3>
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
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">${title} 정보 확인</h5>
		
		                  <div class="form-outline mb-4">
		                    <label class="form-label" for="form2Example17">${title} ->&nbsp;&nbsp;&nbsp;</label>
		                 	<label class="form-label" for="form2Example17">${result}</label>
		                  </div>
		                  <div class="pt-1 mb-4">
		                    <button class="btn btn-dark btn-lg btn-block" type="button" onclick="location.href='login'">로그인하기</button>
		                    <c:if test="${title =='아이디'}">
		                    <button class="btn btn-dark btn-lg btn-block" type="button" onclick="location.href='pwsearch'">비밀번호 찾기</button>
		                    </c:if>
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
</div>
</body>
</html>