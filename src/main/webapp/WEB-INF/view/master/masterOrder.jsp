<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 주문 내역</title>
</head>
<body>
	<input type="hidden" name="pageNum" value="1"> 
	<div class="row">
		<div class="col-3">
			<div class="list-group">
				<a href="userList" class="list-group-item list-group-item-action">회원 목록</a>
				<a href="outUserList" class="list-group-item list-group-item-action">탈퇴 회원 목록</a>
				<a href="masterOrder" class="list-group-item list-group-item-action active">주문 내역</a>
				<a href="reviewList"  class="list-group-item list-group-item-action">리뷰 목록</a>
				<a href="itemList"  class="list-group-item list-group-item-action">메뉴 관리</a>
				<a href="masterBoard"  class="list-group-item list-group-item-action">공자사항 관리</a>
			</div>		
		</div>
		<div class="col-9">
			<table style="width: 100%;">
				<tr>
					<th colspan="12">HEALAD_총 주문 현황&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${count} 건</th>
				</tr>
				<tr>
					<th style="width: 16%;">주문일자</th>
					<th style="width: 6%;">주문번호</th>
					<th style="width: 6%;">사용자 ID</th>
					<th style="width: 11%;">사용자 닉네임</th>
					<th style="width: 11%;">주문 금액</th>
					<th style="width: 32%;">주소지</th>
					<th style="width: 18%;">주문시 요청사항</th>
				</tr>
				<c:forEach items="${saleList}" var="sale">
					<tr>
						<td><fmt:formatDate value="${sale.saleDate}" pattern="yy-MM-dd (E) H시 m분" /></td>
						<td>${sale.saleId}</td>
						<td>${sale.userId}</td>
						<td>${sale.saleUserName}</td>
						<td><fmt:formatNumber value="${sale.sum}" pattern="###,###,###,###" />원</td>
						<td class="left">${sale.salePostCode}&nbsp;${sale.saleAddr}&nbsp;${sale.saleAddrDetail}</td>
						
						<c:choose>
							<c:when test="${sale.remark eq null}"><td>( 없음 )</td></c:when>
							<c:otherwise><td class="left">${sale.remark}</td></c:otherwise>
						</c:choose>
						
				</c:forEach>		
			</table>	
			
			<div class="container" style="margin-top: 10px;">			
				<ul class="pagination justify-content-center">
						<c:if test="${pageNum > 1 }">
							<li class='page-item'>
							<a class="page-link" href="masterOrder?pageNum=${pageNum-1}">Previous</a></li>
						</c:if>
						<c:if test="${pageNum <= 1}">
							<li class='page-item disabled'>
							<a class="page-link"	href="masterOrder?pageNum=${pageNum-1}">Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == pageNum}">
								<li class='page-item active'>
								<a class="page-link" href="#">${i}</a></li>
							</c:if>
							<c:if test="${i != pageNum}">
								<a class="page-link" href="masterOrder?pageNum=${i}">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageNum < maxPage}">
							<li class='page-item'>
							<a class="page-link" href="masterOrder?pageNum=${pageNum_1}">Next</a></li>
						</c:if>
						<c:if test="${pageNum >= maxPage}">
							<li class='page-item disabled'>
							<a class="page-link" href="masterOrder?pageNum=${pageNum+1}">Next</a></li>
						</c:if>	
				</ul>
			</div>				
		</div>
	</div>


</body>
</html>
