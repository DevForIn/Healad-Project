<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<div class="row">
	<div class="col-3">
		<a href="mypage?id=${loginUser.userId}" class="list-group-item list-group-item-action">나의 프로필</a>
		<a href="orderList?id=${loginUser.userId}"  class="list-group-item list-group-item-action active">주문 목록</a>
		<a href="review?id=${loginUser.userId}"  class="list-group-item list-group-item-action">나의 리뷰</a>	
	</div>
	<div class="col-9">
		<table style="width: 100%;">
				<tr>
					<th colspan="6"><h3>[ ${user.userId} ]님의 주문 목록</h3></th>
				</tr>
				<tr>
					<th>No</th>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>총주문금액</th>
					<th>주소</th>
					<th>주문시 요청사항</th>
				</tr>
				<c:set var="NoNum" value="1"/>
				<c:forEach items="${salelist}" var="sale" varStatus="stat">
				<tr>
					<td>${NoNum}
						<c:set var="NoNum" value="${NoNum+1}"/></td>
					<td><strong>[<a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a>]</strong></td>
					<td><fmt:formatDate value="${sale.saleDate}" pattern="yy-MM-dd (E) H시 m분" /></td>
					<td><fmt:formatNumber pattern="###,###,###,###" value="${sale.total}"/>원</td>
					<td>${sale.salePostCode}&nbsp;${sale.saleAddr}&nbsp;${sale.saleAddrDetail}</td>
					<td>
					<c:choose>
						<c:when test="${sale.remark eq null}">( 없음 )</c:when>
						<c:otherwise>${sale.remark}</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr id="saleLine${stat.index}" class="saleLine" style="display: none;">
						<td colspan="6" align="center">
							<table>
								<tr>
									<th width="25%">상품명</th>
									<th width="25%">상품가격</th>
									<th width="25%">구매수량</th>
								</tr>
								<c:forEach items="${sale.itemList}" var="saleItem">
								<tr>
									<td class="title">${saleItem.item.itemName}</td>
									<td><fmt:formatNumber value="${saleItem.item.price}" pattern="###,###,###" />원</td>
									<td>${saleItem.quantity}개</td>
								</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					
				</c:forEach>
		</table>	
	</div>
</div>
</body>
</html>