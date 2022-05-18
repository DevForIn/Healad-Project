<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
    <%-- /springmvc1/src/main/webapp/WEB-INF/view/exception.jsp 
    isErrorPage="true" : 현재 페이지는 예외 페이지다.
    	=> exception(LoginException) 내장 객체 전달 
    --%>
<script type="text/javascript">
	alert("${exception.message}")
	location.href="${exception.url}"
</script>