<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <c:set var="path" value="${pageContext.request.contextPath }" />  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰목록</title>
<script type="text/javascript">
	function allchkbox(allchk) {
		$(".idchks").prop("checked", allchk.checked)
	}
</script>
</head>
<body>
	<input type="hidden" name="pageNum" value="1"> 
	<div class="row">
		<div class="col-3">
			<div class="list-group" >
				<a href="userList" class="list-group-item list-group-item-action">회원 목록</a>
				<a href="outUserList" class="list-group-item list-group-item-action">탈퇴 회원 목록</a>
				<a href="masterOrder" class="list-group-item list-group-item-action">주문 내역</a>
				<a href="reviewList"  class="list-group-item list-group-item-action active">리뷰 목록</a>
				<a href="itemList"  class="list-group-item list-group-item-action">메뉴 관리</a>
				<a href="masterBoard"  class="list-group-item list-group-item-action">공자사항 관리</a>
			</div>		
		</div>
		<div class="col-9">
			<table class="table" style="width: 100%;">
				<thead>
				<tr>
					<th colspan="13">HEALAD_리뷰목록&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${count} 개</th>
				</tr>
				<tr>
					<th scope="col">Review No</th>
					<th scope="col">ID</th>
					<th scope="col">ITEM ID</th>
					<th scope="col">제목</th>
					<th scope="col" style="width: 25%;">내용</th>
					<th scope="col">사진 리뷰</th>
					<th scope="col">평점</th>
					<th scope="col">등록일자</th>
					<th scope="col">수정일자</th>
					<th scope="col">매니저답변</th>
					<th scope="col">Modify</th>
				</tr>
				</thead>
				<c:forEach items="${reviewList}" var="view">	
					<tr>
						<td>${view.reviewSeq}</td>
						<td>${view.userId}</td>
						<td><a href="${path}/item/detail?itemId=${view.itemId}"><strong>[ ${view.itemId} ] </strong></a></td>
						<td>${view.rvSubject}</td>
						<td>${view.rvContent}</td>
						<td><c:if test="${view.rvFileUrl == null}"> - </c:if>
							<c:if test="${view.rvFileUrl != null}"> oK </c:if></td>
						<td>${view.score}</td>
						<td>
						<c:choose>
							<c:when test="${view.rvRegDate == null}"> - </c:when>
							<c:otherwise>
								<fmt:formatDate value="${view.rvRegDate}" pattern="yyyy-MM-dd" />
							</c:otherwise>
						</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${view.rvUpdtDate == null}"> - </c:when>
							<c:otherwise>
								<fmt:formatDate value="${view.rvUpdtDate}" pattern="yyyy-MM-dd" />
							</c:otherwise>
						</c:choose>
						</td>
						<td><c:if test="${view.rvCheck == 0}">N</c:if>
							<c:if test="${view.rvCheck == 1}">Y</c:if></td>
						<td><a href="deleteBoard?reviewSeq=${view.reviewSeq}" 
								onclick="window.open(this.href, '_blank', 'top=280, left=700, width=480, height=200'); return false;">
						<strong>삭제</strong></a></td>
					</tr>
				</c:forEach>		
			</table>	
			
			<div class="container" style="margin-top: 10px;">			
					<ul class="pagination justify-content-center">
							<c:if test="${pageNum > 1 }">
								<li class='page-item'>
								<a class="page-link" href="reviewList?pageNum=${pageNum-1}">Previous</a></li>
							</c:if>
							<c:if test="${pageNum <= 1}">
								<li class='page-item disabled'>
								<a class="page-link"	href="reviewList?pageNum=${pageNum-1}">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == pageNum}">
									<li class='page-item active'>
									<a class="page-link" href="#">${i}</a></li>
								</c:if>
								<c:if test="${i != pageNum}">
									<a class="page-link" href="reviewList?pageNum=${i}">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageNum < maxPage}">
								<li class='page-item'>
								<a class="page-link" href="reviewList?pageNum=${pageNum+1}">Next</a></li>
							</c:if>
							<c:if test="${pageNum >= maxPage}">
								<li class='page-item disabled'>
								<a class="page-link" href="reviewList?pageNum=${pageNum+1}">Next</a></li>
							</c:if>	
					</ul>
				</div>				
		</div>
	</div>

	<!-- <div style="width: 82%; float: right;"> -->
</body>
</html>
