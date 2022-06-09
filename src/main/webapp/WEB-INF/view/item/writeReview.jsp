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
<title>Review 작성</title>
</head>
<body>
<link rel="stylesheet" href="${path}/css/style.css">
<style>
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('../img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: #7dffb0;
	}
</style>
<script type="text/javascript">
function chkSum(num)

}
</script>
	<form:form modelAttribute="review" action="writeReview" enctype="multipart/form-data" name="f">
	    <div class="main" style="padding: 0px 0;">
	        <section class="signup" style="margin-bottom : 0px;">
	            <div class="container">
	                <div class="signup-content">
	                    <div class="signup-form">
	                        <h2 class="form-title">Review 남기기</h2>	                    
	                            <div class="form-group">
	                                <label>주문자 ID</label><br><br>
	                                <form:input type="text" path="userId" placeholder="아이디" value="${loginUser.userId}" readonly="true"/>
	                            </div>
	                            <div class="form-group">
	                                <label>제목</label><br><br>
	                                <form:input path="rvSubject" placeholder="입력"/>
	                            </div>	
	                            <div class="form-group">
	                                <label>내용</label><br><br>
	                                <form:input path="rvContent" placeholder="입력"/>
	                            </div>	
	                            <div class="form-group">
	                                <label>이미지 첨부</label><br><br>
	                                <input type="file" name="rvFileUrl">
	                            </div>	
	                           	<div class="wrap">
							   		<input type="hidden" name="rvCheck" id="rate" value="0"/>
							        <p class="title_star">별을 클릭하여 평점을 선택 해주세요.</p>							 
							       	<div class="review_rating">
										<div class="rating">								    	 
											<input type="checkbox" name="rvCheck" id="rating1" value="1" class="rate_radio" onclick="chkSum('this');" title="1점">
											<label for="rating1"></label>
											<input type="checkbox" name="rvCheck" id="rating2" value="2" class="rate_radio" onclick="chkSum('this');" title="2점">
											<label for="rating2"></label>
											<input type="checkbox" name="rvCheck" id="rating3" value="3" class="rate_radio" onclick="chkSum('this');" title="3점" >
											<label for="rating3"></label>
											<input type="checkbox" name="rvCheck" id="rating4" value="4" class="rate_radio" onclick="chkSum('this');" title="4점">
											<label for="rating4"></label>
											<input type="checkbox" name="rvCheck" id="rating5" value="5" class="rate_radio" onclick="chkSum('this');" title="5점">
											<label for="rating5"></label>
										</div>
	                            	</div>
	                            </div>                    
	                            <input type="submit" name="signup" id="signup" class="form-submit" value="작성하기"/>	                                        
	                    	</div>
	                    <div class="signup-image">
	                    	<img class="card-img-top" src="../img/${item.pictureUrl}" alt="Review Item image">  
	                        <figure><h2>[ ${item.itemName} ]</h2></figure>
	                    </div>
	                </div>
	            </div>
	        </section>
	     </div>
    </form:form>
	
</body>
</html>
