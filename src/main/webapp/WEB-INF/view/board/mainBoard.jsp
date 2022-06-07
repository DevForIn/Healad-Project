<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice board</title>
</head>
<body>
<style>
	.left {
	        text-align : left;
		}
	.table thead th {	
			border: 3px solid silver;
			border-collapse: collapse;  }	
	th {    					
 			border-bottom: 2px solid #000000;
			background-color:#c9c9c9;
	        color : #000000;
	        font-weight:bold;
	        text-align:center;}
	
	.table td {
		border:1px solid silver;;
	}
	td { 
			background-color: #FFFFFF;  }
</style>
	<div class="container">
		<h2 align="center">H E A L A D _ 공지사항</h2><br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 10%;">No</th>
					<th style="width: 50%;">제목</th>
					<th style="width: 25%;">작성일</th>
					<th style="width: 15%;">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="NoNum" value="${(pageNum-1)*10+1}"/>
				<c:forEach var="N" items="${Noticelist}">
					<tr>
						<td>							
							${NoNum}
							<c:set var="NoNum" value="${NoNum+1}"/>
						</td>
						<td class="left"><a href="noticeInfo?num=${N.noticeId}">${N.noSubject}</a>
						</td>
						<td><fmt:formatDate value="${N.noRegDate}" pattern="yyyy-MM-dd" var="rday" />
						    <fmt:formatDate	value="${today}" pattern="yyyy-MM-dd" var="nday" /> 
						    <c:if test="${rday==nday}">
								<fmt:formatDate value="${N.noRegDate}" pattern="HH:mm:ss" />
							</c:if> 
							<c:if test="${rday!=nday}">
								<fmt:formatDate value="${N.noRegDate}" pattern="yy-MM-dd HH:mm:ss" />
							</c:if>
						</td>
						<td>${N.noReadCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="container">			
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${!empty param.column and !empty param.find}">
						<li class='page-item'>
						<a class="page-link" href="mainBoard">다시 전체보기</a></li>
					</c:when>
				<c:otherwise>
					<c:if test="${pageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="mainBoard?pageNum=${pageNum-1}">Previous</a></li>
					</c:if>
					<c:if test="${pageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link"	href="mainBoard?pageNum=${pageNum-1}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == pageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != pageNum}">
							<a class="page-link" href="mainBoard?pageNum=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageNum < maxPage}">
						<li class='page-item'>
						<a class="page-link" href="mainBoard?pageNum=${pageNum+1}">Next</a></li>
					</c:if>
					<c:if test="${pageNum >= maxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="mainBoard?pageNum=${pageNum+1}">Next</a></li>
					</c:if>
					<c:if test="${param.column != ''}"></c:if>			
					</c:otherwise>	
				</c:choose>			
			</ul>
		</div>
		<br><br>
		<form class="form-inline" action="mainBoard" method="post" name="sf" onsubmit="return ifNull()">
			<div class="container justify-content-end text-center">
				<input type="hidden" name="pageNum" value="1"> 
				<select name="column" id="sel1" class="form-control">
					<option value="">Option</option>
					<option value="NO_SUBJECT">제목</option>
					<option value="NO_CONTENT">내용</option>
				</select>
				<script>

				document.sf.column.value = "${param.column}";
					function ifNull(){
						if($("select[name=column]").val() == "" && $("input[type=text]").val() == ""){	
							return true;
						}
						else if($("select[name=column]").val() == "" || $("input[type=text]").val() == ""){
							alert("검색항목을 선택해주세요.")							
							return false;
						}					 
					}
				</script>
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					name="find" value="${param.find}">
				<button class="btn btn-success" type="submit">검색</button>
			</div>
		</form>
	</div>
</body>
</html>