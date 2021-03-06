<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <c:set var="path" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<script type="text/javascript">
function CI(){
	location.href="itemList?ctn="+$("select[name=Cat_ID]").val();
}
</script>
	<input type="hidden" name="pageNum" value="1"> 
	<div class="row">
		<div class="col-3">
			<div class="list-group" >
				<a href="userList" class="list-group-item list-group-item-action">회원 목록</a>
				<a href="outUserList" class="list-group-item list-group-item-action">탈퇴 회원 목록</a>
				<a href="masterOrder" class="list-group-item list-group-item-action">주문 내역</a>
				<a href="reviewList"  class="list-group-item list-group-item-action">리뷰 목록</a>
				<a href="itemList"  class="list-group-item list-group-item-action active">메뉴 관리</a>
				<a href="${path}/item/menu" class="list-group-item list-group-item-action">▶ 메뉴 바로가기</a>
				<a href="masterBoard"  class="list-group-item list-group-item-action">공자사항 관리</a>
			</div>			
		</div>	
		<div class="col-9">
			<table style="width: 100%;">
				<tr>
					<th colspan="7">HEALAD_상품&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;총 ${count} ITEM</th>
				</tr>
				<tr>
					<th>카테고리  <select name="Cat_ID" onchange="CI()">
			                    		<option value="">-선택-</option>
			                    		<option value="0">All Menu</option>                    	                        
			                        	<option value="1">Salad</option>
			                        	<option value="2">Topping</option>
			                        	<option value="3">Dressing</option>
			                        	<option value="4">Drink</option>
			                    </select></th>
					<th>ITEM ID
					</th>
					<th>ITEM NAME</th>
					<th>가격
						<a href="itemList?pageNum=1&ctn=${ctn}&sort=1">▲</a>
						<a href="itemList?pageNum=1&ctn=${ctn}&sort=2">▼</a>
					</th>
					<th>설명</th>
					<th>IMAGE</th>
					<th>사용여부(<a href="itemList?pageNum=1&ctn=${ctn}&useNum=1">Y</a>/
					<a href="itemList?pageNum=1&ctn=${ctn}&useNum=2">N</a>)</th>
		
				</tr>
				<c:forEach items="${itemList}" var="item">
					<tr>
						<td> 
							<c:if test="${item.itemCatId == 1}">Salad</c:if>
							<c:if test="${item.itemCatId == 2}">Topping</c:if>
							<c:if test="${item.itemCatId == 3}">Dressing</c:if>
							<c:if test="${item.itemCatId == 4}">Drink</c:if>
						</td>
						<td>${item.itemId}</td>
						<td>${item.itemName}</td>
						<td><fmt:formatNumber value="${item.price}" />원</td>
						<td class="left">${item.description}</td>				
						<td>
						<a href="${path}/img/${item.pictureUrl}">${item.pictureUrl}</a></td>
						<td><strong>${item.useYn}</strong>			
							<a href="itemYN?id=${item.itemId}" 
								onclick="window.open(this.href, '_blank', 'top=280, left=700, width=480, height=400'); return false;">
							<c:if test="${item.useYn == 'Y'}"><strong><font color="blue;">[활성화]</font></strong></c:if>
							<c:if test="${item.useYn == 'N'}"><strong><font color="blue;">[비활성화]</font></strong></c:if></a>
						</td>			
					</tr>
				</c:forEach>	
				<tr><th colspan="7"><a href="newItem">[ ITEM 추가 ]</a></th></tr>	
			</table>
			
			<div class="container" class="margin-top: 10px;">			
				<ul class="pagination justify-content-center">
						<c:if test="${pageNum > 1 }">
							<li class='page-item'>
							<a class="page-link" href="itemList?pageNum=${pageNum-1}&ctn=${ctn}&sort=${sortnum}&useNum=${useNum}">Previous</a></li>
						</c:if>
						<c:if test="${pageNum <= 1}">
							<li class='page-item disabled'>
							<a class="page-link"	href="itemList?pageNum=${pageNum-1}&ctn=${ctn}&sort=${sortnum}&useNum=${useNum}">Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == pageNum}">
								<li class='page-item active'>
								<a class="page-link" href="#">${i}</a></li>
							</c:if>
							<c:if test="${i != pageNum}">
								<a class="page-link" href="itemList?pageNum=${i}&ctn=${ctn}&sort=${sortnum}&useNum=${useNum}">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageNum < maxPage}">
							<li class='page-item'>
							<a class="page-link" href="itemList?pageNum=${pageNum+1}&ctn=${ctn}&sort=${sortnum}&useNum=${useNum}">Next</a></li>
						</c:if>
						<c:if test="${pageNum >= maxPage}">
							<li class='page-item disabled'>
							<a class="page-link" href="itemList?pageNum=${pageNum+1}&ctn=${ctn}&sort=${sortnum}&useNum=${useNum}">Next</a></li>
						</c:if>	
				</ul>
			</div>					
		</div>	
	</div>


</body>
</html>
