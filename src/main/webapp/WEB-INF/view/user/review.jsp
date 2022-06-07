<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order List</title>
</head>
<body>
<style>
.saleLine th{
	background : #64e18f;
	color: white;
}
.saleLine td{
	background : #c9f4da;
	color: black;
}
</style>
<script type="text/javascript">
	function list_disp(id){
		$("#"+id).toggle()
	}
</script>
<div class="a" style="background-color:#ffff80; height:100%; width:15%; float:left;">
	<ul>
		<li><a href="mypage?id=${loginUser.userId}" >My Profile</a></li>
		<li><a href="orderList?id=${loginUser.userId}">Order List</a></li>
		<li><a href="review?id=${loginUser.userId}" class="current">My Review</a></li>
	</ul>
</div>
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
			<tr>
				<th colspan="11"><h3>[ ${user.userId} ]님의 리뷰 목록</h3></th>
			</tr>
			<tr>
				<th>No</th>
				<th>리뷰번호</th>
				<th>ITEM ID</th>
				<th>제목</th>
				<th style="width: 25%;">내용</th>
				<th>사진 리뷰</th>
				<th>평점</th>
				<th>등록일자</th>
				<th>수정일자</th>
				<th>매니저답변</th>
			</tr>
			<c:set var="NoNum" value="1"/>
			<c:forEach items="${reviewList}" var="view">
			<tr>
				<td>${NoNum}
					<c:set var="NoNum" value="${NoNum+1}"/></td>
				<td>${view.reviewSeq}</td>
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
				</tr>
				
			</c:forEach>
		</table>
	</div>	
</body>
</html>