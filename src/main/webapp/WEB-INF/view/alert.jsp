<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
  alert("${message}");
  if("${url}"==="close"){
	  window.close();
  }
  location.href="${url}"  

</script>