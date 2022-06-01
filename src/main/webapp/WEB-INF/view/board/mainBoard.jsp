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
	<div class="container">
		<h2 align="center">H E A L A D _ 공지사항</h2>
		<p align="right">
			<c:if test="${count > 0 }"> ${count}건</c:if>
		</p>
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
		

		<table class="table table-hover">
			<thead>
				<tr>
					<th>공지 번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="N" items="${Noticelist}">
					<tr>
						<td>${N.noticeId}</td>
						<td><a href="noticeInfo?num=${N.noticeId}">${N.noSubject}</a>
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
						<td><a href="${path}/board/file/${N.noFileUrl}">${N.noFileUrl}</a></td>
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
	</div>
</body>
</html>