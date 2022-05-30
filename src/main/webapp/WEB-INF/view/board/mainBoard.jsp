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
	function listsubmit(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
	<hr>
	<div class="container">
		<h2 id="center"> 
			공 지 사 항 
		</h2>
		<form class="form-inline" action="list?boardid=${boardid}" 
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
		<c:if test="${boardcount > 0 }">글개수:${boardcount}</c:if>
		<c:if test="${boardcount == 0 }">등록된 게시물이 없습니다</c:if>
	
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
			<c:forEach   var="b"  items="${list}">
				<tr>
					<td>${b.noticeId}</td>
					<c:set var="boardnum" value="${boardnum - 1}"/>
					<td>		
					<a href="${path }/board/info?num=${b.num}">${b.noSubject}</a>
					</td>
					<td>
					<fmt:formatDate value="${b.noRegDate}" pattern="yyyy-MM-dd" var="rday"/>
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="nday"/>					
					<c:if test="${rday==nday}">
						<fmt:formatDate value="${b.noRegDate}" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${rday!=nday}">
						<fmt:formatDate value="${b.noRegDate}" pattern="yy-MM-dd HH:mm:ss"/>
					</c:if>					
					<td><a href="${path}/upload/${b.noFile}">${b.noFile}</a></td>
					<td>${b.noReadCount}</td>

				</tr>
				</c:forEach>	
				
			</tbody>
		</table>
		<p align="right">
			<c:if test="${loginUser.userId=='admin'}">
				<p align="right">
					<a href="${path }/board/writeNotice">공지 작성</a>
				</p>
			 </c:if>
		</p>
		<div class="container">
			<ul class="pagination justify-content-center">

				<li	 class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
			<%-- 	<a class="page-link" href="<%=request.getContextPath()%>/board/list?pageNum=${startPage - bottomLine}">Previous</a></li>--%>
				<a class="page-link" href="javascript:listsubmit(${startPage -bottomLine})">
				Previous</a></li>
			<c:forEach  var="i" begin="${startPage}"  end="${endPage}">
				<li class='page-item  <c:if test ="${i == pageInt }" > active   </c:if>'>
				<%-- <a 	class="page-link" href="${path }/board/list?pageNum=${i}">${i}</a></li>--%>
				<a class="page-link" href="javascript:listsubmit(${i})">${i}</a></li>
				</c:forEach>
				<li  class='page-item <c:if test="${endPage >= maxPage}">  disabled </c:if>'>
					<%--<a class="page-link" href="${path }/board/list?pageNum=${startPage + bottomLine}">Next</a></li> --%>
					<a class="page-link" href="javascript:listsubmit(${startPage +bottomLine})">Next</a></li>
			</ul>
		</div>
	</div>
</body>
</html>