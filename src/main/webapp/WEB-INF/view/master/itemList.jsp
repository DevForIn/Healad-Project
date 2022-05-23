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
	<div class="a" style="background-color: #ffff80; height: 100%; width: 15%; float: left;">
		<ul>
			<li><a href="userList">User List</a></li>
			<li><a href="outUserList">OutUser List</a></li>
			<li><a href="itemList" class="current">Item set</a></li>
			<li><a href="noticeList">Notice set</a></li>
		</ul>
	</div>
	<div style="width: 80%; float: right;">
	<table style="width: 1400px;">
		<tr>
			<th colspan="7">HEALAD_상품</th>
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
				<a href="itemList?ctn=${ctn}&sort=1">▲</a>
				<a href="itemList?ctn=${ctn}&sort=2">▼</a>
			</th>
			<th>ITEM NAME</th>
			<th>가격
				<a href="itemList?ctn=${ctn}&sort=3">▲</a>
				<a href="itemList?ctn=${ctn}&sort=4">▼</a>
			</th>
			<th>설명</th>
			<th>IMAGE</th>
			<th>사용여부(Y/N)</th>

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
				<td>${item.description}</td>				
				<td>
				<a href="${path}/img/${item.pictureUrl}">${item.pictureUrl}</a></td>
				<td>${item.useYn}</td>			
			</tr>
		</c:forEach>		
	</table>
	</div>
</body>
</html>
