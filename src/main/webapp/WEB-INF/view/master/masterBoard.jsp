<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script type="text/javascript">
	function allchkbox(allchk) {
		$(".idchks").prop("checked", allchk.checked)
	}
</script>
</head>
<body>
<input type="hidden" name="pageNum" value="1"> 
<input type="hidden" name="faqPageNum" value="1"> 
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="masterOrder">Order Status</a></li>
			<li><a href="reviewList">Review List</a></li>
			<li><a href="itemList">Item set</a></li>
			<li><a href="masterBoard" class="current">Notice set</a></li>
		</ul><br><br><br><br><br>
		<ul>
			<li><a href="${path}/board/mainBoard"><h3>Board Page</h3></a></li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
			<li>&nbsp;</li>
		</ul>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
		<table style="width: 820px;">
		<tr>
			<th colspan="7">HEALAD_공지 목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;${noCount} 개</th>
		</tr>
		<tr>
			<th style="width: 10%;">공지 ID</th>
			<th style="width: 45%;">제목</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 10%;">첨부</th>
			<th style="width: 15%;">등록일자</th>
			<th style="width: 10%;">Modify</th>
		</tr>
		<c:forEach items="${notice}" var="notice">
			<tr>
				<td>${notice.noticeId}</td>
				<td class="left">
					<a href="noInfo?id=${notice.noticeId}" onclick="window.open(this.href, '_blank', 'top=100, left=500, width=900, height=750'); return false;"><strong>${notice.noSubject}</strong></a>
				</td>
				<td>${notice.noReadCnt}</td>
				<td><c:if test="${notice.noFileUrl== null }"> - </c:if><c:if test="${notice.noFileUrl!= null }"> O </c:if></td>
				<td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd" /></td>
				<td><a href="modifyNotice?num=${notice.noticeId}"><strong>수정</strong></a><br>
				<a href="deleteBoard?noticeId=${notice.noticeId}" 
						onclick="window.open(this.href, '_blank', 'top=280, left=700, width=480, height=200'); return false;">
				<strong>삭제</strong></a><br>
			</tr>
		</c:forEach>
		<tr><th colspan="7"><a href="writeNotice">공지 작성</a></th></tr>
	</table>
	<div class="container">			
			<ul class="pagination justify-content-center">
					<c:if test="${pageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum-1}&faqPageNum=${faqPageNum}">Previous</a></li>
					</c:if>
					<c:if test="${pageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link"	href="masterBoard?pageNum=${pageNum-1}&faqPageNum=${faqPageNum}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == pageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != pageNum}">
							<a class="page-link" href="masterBoard?pageNum=${i}&faqPageNum=${faqPageNum}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageNum < maxPage}">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum+1}&faqPageNum=${faqPageNum}">Next</a></li>
					</c:if>
					<c:if test="${pageNum >= maxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum+1}&faqPageNum=${faqPageNum}">Next</a></li>
					</c:if>	
			</ul>
		</div>
	</div>
	<div style="width: auto; float: left; padding:0px 5px;">
	<table style="width: 700px;">
		<tr>
			<th colspan="12">HEALAD_FAQ 목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;${faqCount} 개</th>
		</tr>
		<tr>
			<th style="width: 10%;">FAQ ID</th>
			<th style="width: 80%;">제목</th>
			<th style="width: 10%;">Modify</th>
		</tr>
		<c:forEach items="${faqList}" var="faq">
			<tr>
				<td>${faq.faqId}</td>				
				<td class="left">
<a href="faqInfo?id=${faq.faqId}" onclick="window.open(this.href, '_blank', 'top=100, left=500, width=900, height=750'); return false;"><strong>${faq.QUESTION}</strong></a>			
				</td>
				<td><a href="modifyFaq?num=${faq.faqId}"><strong>수정</strong></a><br>
								<a href="deleteBoard?faqId=${faq.faqId}" 
						onclick="window.open(this.href, '_blank', 'top=280, left=700, width=480, height=200'); return false;">
				<strong>삭제</strong></a><br>
				</td>
			</tr>
		</c:forEach>
		<tr><th colspan="3"><a href="writeFaq">FAQ 작성</a></th></tr>	
	</table>
		<div class="container">			
			<ul class="pagination justify-content-center">
					<c:if test="${faqPageNum > 1 }">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum}&faqPageNum=${faqPageNum-1}">Previous</a></li>
					</c:if>
					<c:if test="${faqPageNum <= 1}">
						<li class='page-item disabled'>
						<a class="page-link"	href="masterBoard?pageNum=${pageNum}&faqPageNum=${faqPageNum-1}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${faqStartPage}" end="${faqEndPage}">
						<c:if test="${i == faqPageNum}">
							<li class='page-item active'>
							<a class="page-link" href="#">${i}</a></li>
						</c:if>
						<c:if test="${i != faqPageNum}">
							<a class="page-link" href="masterBoard?pageNum=${pageNum}&faqPageNum=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${faqPageNum < faqMaxPage}">
						<li class='page-item'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum}&faqPageNum=${faqPageNum+1}">Next</a></li>
					</c:if>
					<c:if test="${faqPageNum >= faqMaxPage}">
						<li class='page-item disabled'>
						<a class="page-link" href="masterBoard?pageNum=${pageNum}&faqPageNum=${faqPageNum+1}">Next</a></li>
					</c:if>	
			</ul>
		</div>
	</div>
</body>
</html>
