<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
</style>
</head>
<body>
	<form action="../sale/purchase" method="post">
		<input type="hidden" name="orderType" value="${orderType}">
		<section class="h-100" style="background-color: #eee;">
		  <div class="container h-100 py-5">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col-10">
		
		        <div class="d-flex justify-content-between align-items-center mb-4">
		          <h3 class="fw-normal mb-0 text-black">주문서 작성</h3>
		        </div>
				<c:choose>
					<c:when test="${orderType =='C' }">
						<!-- 카트 주문의 경우 -->
						<c:forEach var="item" items="${items}">
					        <div id="row_${item.itemId }" class="card rounded-3 mb-4">
					          <div class="card-body p-4">
					            <div class="row d-flex justify-content-between align-items-center">
					              <div class="col-md-2 col-lg-2 col-xl-2">
					                <img src="../img/sal1.png" class="img-fluid rounded-3" alt="Cotton T-shirt">
					              </div>
					              <div class="col-md-3 col-lg-3 col-xl-3">
					                <p class="lead fw-normal mb-2">${item.itemName }</p>
					              </div>
					              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
					                <a class="btn btn-link px-2" onclick="fnUpdateCartQuantity('${item.itemId}','down', '${item.price }')">
					                  <i class="fa fa-minus"></i>
					                </a>
					
					                <input min="1" id="quantity_${item.itemId }" name="quantity" value="${item.quantity }" type="number"
					                  class="form-control form-control-sm" onblur="fnUpdateCartQuantity('${item.itemId}','change', '${item.price }')"/>
					
					                <a class="btn btn-link px-2" onclick="fnUpdateCartQuantity('${item.itemId}', 'plus', '${item.price }')">
					                  <i class="fa fa-plus"></i>
					                </a>
					              </div>
					              <div id="price_${item.itemId }" class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
					                <h5 class="mb-0">${item.quantityPrice }</h5>
					              </div>
					              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
					                <a onclick="fnCartRemoveItem('${item.itemId }')" class="text-danger"><i class="fa fa-trash fa-lg" style="cursor: pointer;"></i></a>
					              </div>
					            </div>
					          </div>
					        </div>	
						</c:forEach>
						</c:when>
					<c:otherwise>
						<!-- 바로 주문하기 클릭했을 경우,  -->
						<input type="hidden" name="itemId" value="${item.itemId}">
				        <div class="card rounded-3 mb-4">
				          <div class="card-body p-4">
				            <div class="row d-flex justify-content-between align-items-center">
				              <div class="col-md-2 col-lg-2 col-xl-2">
				                <img src="../img/sal1.png" class="img-fluid rounded-3" alt="Cotton T-shirt">
				              </div>
				              <div class="col-md-3 col-lg-3 col-xl-3">
				                <p class="lead fw-normal mb-2">${item.itemName }</p>
				              </div>
				              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
				                <a class="btn btn-link px-2" onclick="fnUpdateOrderQuantity('${item.itemId}', 'down', '${item.price}')">
				                  <i class="fa fa-minus"></i>
				                </a>
				
				                <input id="quantity" min="0" name="quantity" value="1" type="number" class="form-control form-control-sm" onblur="fnUpdateOrderQuantity('${item.itemId}', 'change', '${item.price}')" />
				
				                <a class="btn btn-link px-2" onclick="fnUpdateOrderQuantity('${item.itemId}', 'plus', '${item.price}')">
				                  <i class="fa fa-plus"></i>
				                </a>
				              </div>
				              <div id="price_${item.itemId }" class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
				                <h5 class="mb-0">${item.price }</h5>
				              </div>
				              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
				              </div>
				            </div>
				          </div>
				        </div>					
					</c:otherwise>
				</c:choose>

				<!-- total 영역 -->
				<input type="hidden" name="mileage" value="${mileage}">
				<fmt:formatNumber type="number" var="total" pattern="###,###,###,###,###,###" value="${total}" />
				<fmt:formatNumber type="number" var="mileage" pattern="###,###,###" value="${mileage}" />
				<div class="card rounded-3 mb-4">
					<div class="card-body p-4" style="text-align: right;">
						<div id="total"><h4>총 금액:  ${total} 원</h4></div>
						<div id="mileage">적립예정 마일리지: ${mileage} 원 </div>
					</div>
				</div>
				
				<!-- 주문서 작성 영역 -->
 		        <div class="card mb-4 px-5 py-5">
                    <div class="mb-3">
                        <label for="saleUserName">주문자명</label>
                        <input type="text" class="form-control" id="saleUserName" name="saleUserName" placeholder="" value="${user.userName }" required="">
                        <div class="invalid-feedback"> Valid first name is required. </div>
                    </div>
	                <div class="mb-3">
	                    <label for="username">연락처</label>
	                    <div class="input-group">
	                        <input type="text" class="form-control" id="salePhoneNo" name="salePhoneNo"  required="" value="${user.phoneNo }">
	                        <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-md-2 mb-3">
	                        <label for="salePostCode">주소</label>
	                        <input type="text" class="form-control" id="salePostCode" name="salePostCode"  value="${user.postCode }" onclick="findPostCode()">
	                        <div class="invalid-feedback"> 우편번호를 입력해주세요. </div>
	                    </div>
	                    <div class="col-md-10 mb-3">
	                        <label for="saleAddr">.</label>
	                        <input type="text" class="form-control" id="saleAddr"  name="saleAddr" placeholder="" value="${user.addr }" required="">
	                        <div class="invalid-feedback"> 주소를 입력해주세요 </div>
	                    </div>
	                </div>	                
	                <div class="mb-3">
	                    <input type="text" class="form-control" id="saleAddrDetail" name="saleAddrDetail" required="" value="${user.addrDetail }" class="mt-2">
	                    <div class="invalid-feedback"> Please enter your shipping address. </div>
	                </div>
	                <div class="mb-3">
	                    <label for="remark">비고사항 </label>
	                    <input type="text" class="form-control" id="remark" name="remark" placeholder="부재시 경비실에 맡겨주세요.">
	                </div>
	                <hr class="mb-4">
		        </div> 
		
		        <div class="card">
		          <div class="card-body">
		            <button type="submit" class="btn btn-warning btn-block btn-lg">결제하기</button>
		          </div>
		        </div>
		
		      </div>
		    </div>
		  </div>
		</section>		
	
	
	</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	/**
	* daum 주소 검색 팝업
	**/
	function findPostCode(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('salePostCode').value = data.zonecode;
                document.getElementById("saleAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("saleAddrDetail").focus();
            }
        }).open();		
	}
	
	function fnCartRemoveItem(itemId){
		
		if($("div[id*='row_']").length == 1) {
			alert('주문상품이 1개일 경우 삭제가 불가능합니다.');
			return;
		}
		
		if(confirm("삭제하시겠습니까?")){
			// ajax로 삭제처리
			$.ajax({
				url : "${path}/cart/delete",
				type : "POST",
				data: {
					'itemId': itemId
				},
				success : function(items) {
					alert('삭제되었습니다.');
					// html 변경하기
					console.log('length=' , $("div[id*='row_']").length);
					if($("div[id*='row_']").length > 1) {
						$('#row_' + itemId).html('');
					}
					else{
						var contents = '<div class="card rounded-3 mb-4">' + 
          				'<div class="card-body p-4">' +
          				'<h5>장바구니에 담긴 상품이 없습니다.</h5>' +
          				'</div>' +
        				'</div>';
						$('#cartContents').html(contents);						
					}
				},
			    error:function(request,status,error){
					alert('삭제 중 오류가 발생하였습니다.');
			    }
			});				
		}		
	}
	
	// 총 금액 및 마일리지 구하기
	function fnGetTotalAndMileage(){
		var total = 0;
		var mileage = 0;
		
		$.each($("div[id*='price_']"), function(index, item){
			total += Number(item.innerText);
		});
		
		var totalContents = '<h4>총 금액: '+ total.toLocaleString('ko-KR') +' 원</h4>';
		var mileageContents = '적립예정 마일리지: '+ (total * 0.05).toLocaleString('ko-KR') +' 원';
		$("#total").html(totalContents);
		$("#mileage").html(mileageContents);
	}
	
	
	
	function fnUpdateOrderQuantity(itemId, upDown, price){
		if(upDown == 'plus') {
			$('#quantity').val(Number($('#quantity').val()) + 1);	
		}
		else if(upDown == 'down') {
			// 0 불가능
			if($('#quantity').val() != 1) $('#quantity').val(Number($('#quantity').val()) - 1);
		}
		// 가격 변경
		$('#price_' + itemId).html('<h5 class="mb-0">'+ price * Number($('#quantity').val()) + '</h5>');
		fnGetTotalAndMileage();
	}
	
	function fnUpdateCartQuantity(itemId, upDown, price){
		
		if(upDown == 'plus') {
			$('#quantity_' + itemId).val(Number($('#quantity_' + itemId).val()) + 1);	
		}
		else if(upDown == 'down'){
			// 0 불가능
			if($('#quantity_' + itemId).val() != 1) $('#quantity_' + itemId).val(Number($('#quantity_' + itemId).val()) - 1);
		}
		
		// 가격 변경
		$('#price_' + itemId).html('<h5 class="mb-0">'+ price * $('#quantity_' + itemId).val() + '</h5>');
		
 		$.ajax({
			url : "${path}/cart/quantity-update",
			data: {
				'itemId': itemId,
				'quantity': $('#quantity_' + itemId).val(),
			},
			success : function(data) {
				console.log('data', data)
			},
		    error:function(request,status,error){
		    	alert('에러가 발생했습니다.');
		    }
		});	
 		
 		fnGetTotalAndMileage();
	}
</script>	
</body>
</html>