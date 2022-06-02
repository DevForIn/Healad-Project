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
<link rel="stylesheet" href="${path}/css/style.css">

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
	    <div class="main">
	        <!-- Sign up form -->
	        <section class="signup">
	            <div class="container">
	                <div class="signup-content">
	                    <div class="signup-form">
	                        <h2 class="form-title">회원가입</h2>
	                        <form method="POST" class="register-form" id="register-form">
	                            <div class="form-group">
	                                <label for="name"><i class="fa fa-id-card"></i></label>
	                                <form:input path="userId" placeholder="아이디" onkeyup="idchk()"/>
	                                <span id="result"></span>
	                            </div>
	                            <div class="form-group">
	                                <label for="pass"><i class="fa fa-lock"></i></label>
	                                <form:password path="pwd"  placeholder="비밀번호" onkeyup="pwchk()"/>
	                            	<font color="red"><form:errors	path="pwd" /></font>
	                            </div>
	                            <div class="form-group">
	                                <label for="userName"><i class="fa fa-user"></i></label>
	                                <form:input path="userName" placeholder="고객명"/>
	                            	<font color="red"><form:errors	path="userName" /></font>
	                            </div>	                            
	                            <div class="form-group">
	                                <label for="email"><i class="fa fa-envelope"></i></label>
	                                <form:input path="email" placeholder="Email"/>
	                            	<font color="red"><form:errors	path="email" /></font>
	                            </div>
	                             <div class="form-group">
	                                <label for="phoneNo"><i class="fa fa-phone"></i></label>
	                                <form:input path="phoneNo" placeholder="전화번호"/>
	                            	<font color="red"><form:errors	path="phoneNo" /></font>
	                            </div>
	                            <div class="form-group">
					             	<div class="row">
					                    <div class="col-md-12 mb-12">
					                        <form:input path="postCode" placeholder="우편번호" onclick="findPostCode()"/>
					                    	<font color="red"><form:errors	path="postCode" /></font>
					                    </div>
					                    <div class="col-md-12 mb-12">
					                        <form:input path="addr" placeholder="주소" value="" required=""/>
					                    </div>
					                    <div class="col-md-12 mb-12">
			                                <form:input path="addrDetail" placeholder="상세주소"/>
			                            	<font color="red"><form:errors	path="addrDetail" /></font>					                    
					                    </div>
					                </div>	               
	                            </div>
	                            <div class="form-group form-button">
	                                <input type="submit" name="signup" id="signup" class="form-submit" value="가입하기"/>
	                            </div>
	                        </form>
	                    </div>
	                    <div class="signup-image">
	                        <figure><img src="${path }/img/signup-image.jpg" alt="sing up image"></figure>
	                        <a href="login" class="signup-image-link">이미 회원입니다.</a>
	                    </div>
	                </div>
	            </div>
	        </section>
	     </div>
    </form:form>
 
      
    <!--  기존 디자인 --> 
	<%-- <form:form modelAttribute="user" method="post" action="signUp">
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
	</form:form> --%>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	/**
	* daum 주소 검색 팝업
	**/
	function findPostCode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrDetail").focus();
            }
        }).open();		
	}
</script>
	
</body>
</html>
