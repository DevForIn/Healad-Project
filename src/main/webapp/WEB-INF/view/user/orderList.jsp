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
<div class="a" style="background-color:#ffff80; height:100%; width:15%; float:left;">
	<ul>
		<li><a href="mypage?id=${loginUser.userId}" >My Profile</a></li>
		<li><a href="orderList?id=${loginUser.userId}" class="current">Order List</a></li>
		<li><a href="">My Review</a></li>
	</ul>
</div>
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
			<tr>
				<th colspan="5"><h3>[ ${user.userId} ]님의 주문 목록</h3></th>
			</tr>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>총주문금액</th>
				<th>주소</th>
				<th>Review</th>
			</tr>
			<c:forEach items="${salelist}" var="sale" varStatus="stat">
			<tr>
				<td><a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a></td>
				<td><fmt:formatDate value="${sale.saleDate}" pattern="yy-MM-dd (E) H시 m분" /></td>
				<td><fmt:formatNumber pattern="###,###,###,###" value="${sale.total}"/>원</td>
				<td>${sale.saleAddr}+${sale.saleAddrDetail}+</td>
				<td>
				<c:choose>
					<c:when test="${sale.remark eq null}">( X )</c:when>
					<c:otherwise>${sale.remark}</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr id="saleLine${stat.index}" class="saleLine" style="display: none;">
					<td colspan="5" align="center">
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
</body>
</html>