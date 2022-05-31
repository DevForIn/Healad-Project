<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />   
<c:set var="today" value="<%= new java.util.Date()%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice board</title>
<script type="text/javascript">

</script>
</head>
<body>

	<div class="container">
		<h2 id="center"> 
			공 지 사 항 
		</h2>
		<form class="form-inline" action="noticeDetail?id=${noticeId}" 
			   method="post" name="sf">
		<div class="container justify-content-end text-center">
                <input type="hidden" name="pageNum" value="1">
                <select name="column" id="sel1" class="form-control">
                  <option value="">-선택-</option>
                  <option value="subject">제목</option>
                  <option value="content">내용</option>
                </select>    
                <script>document.sf.column.value = "${param.column}";</script>                
				<input class="form-control mr-sm-2" type="text" 
				placeholder="Search" name="find" value="${param.find}">
				<button class="btn btn-success" type="submit">검색</button>
		   </div>
		</form>

		
		<p align="right">
		<c:if test="${count > 0 }">글개수:${count}</c:if>
		<c:if test="${count == 0 }">등록된 글이 없습니다</c:if>
	
		</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach   var="N"  items="${Noticelist}">
				<tr>
					<td>${N.noticeId}</td>
					<td>		
					<a href="#">${N.noSubject}</a>
					</td>
					<td>
					<fmt:formatDate value="${N.noRegDate}" pattern="yyyy-MM-dd" var="rday"/>
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="nday"/>					
					<c:if test="${rday==nday}">
						<fmt:formatDate value="${N.noRegDate}" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${rday!=nday}">
						<fmt:formatDate value="${N.noRegDate}" pattern="yy-MM-dd HH:mm:ss"/>
					</c:if>					
					<td><a href="${path}/board/file/${N.noFileUrl}">${N.noFileUrl}</a></td>
					<td>${N.noReadCount}</td>

				</tr>
				</c:forEach>	
				
			</tbody>
		</table>
		<p align="right">
			<c:if test="${loginUser.userId=='admin'}">
				<p align="right">
					<a href="${path}/board/writeNotice">공지 작성</a>
				</p>
			 </c:if>
		</p>
		<div class="container">
			<ul class="pagination justify-content-center">
				
				<c:if test="${pageNum > 1 }">						
					<li	 class='page-item'>
					<a class="page-link" href="mainBoard?pageNum=${pageNum-1}">Previous</a></li>
				</c:if>
				<c:if test="${pageNum <= 1}">
					<li class='page-item disabled'>
					<a class="page-link" href="mainBoard?pageNum=${pageNum-1}">Previous</a></li>
				</c:if>	
						
			<c:forEach  var="i" begin="${startPage}"  end="${endPage}">
					<c:if test="${i == pageNum}">
						<li class='page-item active'>
						<a class="page-link" href="#">${i}</a></li>
					</c:if>
					<c:if test="${i != pageNum}">
						<a class="page-link" href="mainBoard?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxPage}">
					<li  class='page-item'>
					<a class="page-link" href="mainBoard?pageNum=${pageNum+1}">Next</a></li>
				</c:if>
				<c:if test="${pageNum >= maxPage}">
					<li  class='page-item disabled'>
					<a class="page-link" href="mainBoard?pageNum=${pageNum+1}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>