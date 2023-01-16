<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>


<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.lang.Deprecated" %>
<%
	//오늘 날짜 구하기
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	//한달 후 날짜 구하기
	Date addMonth = new Date();
    
    int getNowMM = nowDate.getMonth();
    
    addMonth.setMonth(getNowMM + 1);
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문관리</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
	.filterText {
		text-align: center;
		
	}
	.leftFilterDiv {
		border-right-style: groove;
	}
	
	.listHover:hover {
		background-color: #D3D3D3;
		cursor: pointer;
	}
	.selectedRow{
		background-color: #D3D3D3;
	}
	.btn-p {
		background-color: #345E87;
		color: white;
	}
	.btn-p:hover {
		background-color: #2A4B6C;
		color: white;
	}
	.btn-oneline-s {
		background: #8E8C85;
		color: white;
	}
	.btn-s:hover {
		background-color: #797771;
		color: white;
	}
	.btn-l {
		background: #f4eed9cb;
		color: black;
	}
	.scrollBoxHeader1 {
		width: auto;
		height: 500px;
		overflow: scroll;
	}
	.scrollBoxHeader2 {
		width: auto;
		height: auto;
		overflow: scroll;
	}
	.scrollBoxItem {
		width: auto;
		height : auto;
		overflow: scroll;
	}
	 	
 	.primaryBtn {
 		background-color: white !important;
 		border-color: #1d5c83 !important;
 		color: #1d5c83 !important;
 	}
 	
 	.primaryBtn:hover {
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
</style>


</head>
<body>

<!-- 현재 날짜 설정  -->
<c:set value="<%=sf.format(nowDate)%>" var="nowDate"/>
<!-- ${nowDate}  -->

<!-- 한달후 날짜 설정 -->
<c:set value='<%=sf.format(addMonth)%>' var="addMonth" /> 
<!-- ${addMonth}  -->
<my:side_bar></my:side_bar>

<div class="container-sm mt-4 mb-4" style=" width: 77vw; margin-left: auto; ">
	<h4>주문 관리</h4>
	<div class="row d-flex">
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2" >
			<div class="mb-5">
				<p class="filterText ">전체 검색</p>
			</div>
			<div class="mb-5">
				<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			</div>
			<div class="mb-5">
				<p class="filterText ">납기요청일 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
			</div>
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10 mt-1">
			<form action="" method=""><!-- form get? post?  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex">
					<div class="col-sm-6 mb-4">
						<div class="input-group">
							<input name="q" value="${param.q }" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >
							<input name="orderCode" value="${param.orderCode }" type="text" id="" class="form-control" list="datalistOptions1" placeholder="주문코드">
							<datalist id="datalistOptions1">
								<c:forEach items="${headerList }" var="h">
									<option value="${h.orderCode }">
								</c:forEach>
							</datalist>
							
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="buyerCode" value="${param.buyerCode }" type="text" id="" class="form-control" list="datalistOptions2" placeholder="바이어코드">
							<datalist id="datalistOptions2">
								<c:forEach items="${buyerCodeList }" var="buyerCode">
									<option value="${buyerCode }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="writer" value="${param.writer }" type="text" id="" class="form-control" list="datalistOptions3" placeholder="작성자">
							<datalist id="datalistOptions3">
								<c:forEach items="${writerList }" var="writer">
									<option value="${writer }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="status" value="${param.status }" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="처리상태">
							<datalist id="datalistOptions4">
								<c:forEach items="${statusList }" var="status">
									<option value="${status }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 2nd row 끝 -->			
				<!-- 검색필터 5th row : 기간 선택 : 납기요청일 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="checkedAllDate" ${empty param.d1 && empty param.d2 ? 'checked' : '' }>
							<label class="form-check-label" for="flexCheckDefault">전체기간</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d1" value="${param.d1 }" type="date" id="d1" class="form-control" ${empty param.d1 && empty param.d2 ? 'disabled' : '' }>
							<span class="input-group-text">~</span>
			        		<input name="d2" value="${param.d2 }" type="date" id="d2" class="form-control" ${empty param.d1 && empty param.d2 ? 'disabled' : '' }>
						</div>
					</div>
				</div><!-- 5th row 끝 -->
				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button class="btn btn-oneline-primary primaryBtn" type="submit">선택 조건 검색</button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
	<hr>
	
	<div class="d-flex">
		<h4>주문 목록</h4>
		<div class="col-sm-10"></div>
		<form action="${pageContext.request.contextPath }/order/register" method="get">
			<button id="" class="btn btn-oneline-primary primaryBtn" >주문등록</button>
		</form>
	</div>		
	<!-- Order_header -->
	<div id="sbh1" class="scrollBoxHeader1">
		<table class="table">
			<thead>
				<tr>
	                <th style="text-align: center; border-right: ridge;" scope="col" colspan="2">번호</th>
	                <th style="text-align: center; " scope="col" colspan="9">주문정보</th>	                 
                </tr> 
                <tr>
					<th>선택</th>
                	<th>#</th>
					<th>주문코드</th>
					<th>바이어코드</th>
					<th>바이어명</th>
					<th>납기요청일</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>처리일</th>
					<th>처리상태</th>				
					<th>주문선택</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${headerList }" var="h" varStatus="st">
					<tr class="listHover" id="tr${h.orderCode }" >
						
						<td><input type="checkbox" name="checkbox" id="checkbox${h.orderCode }"></td>
						<td>${st.count }</td>
						<td><input type="hidden" name="id" value="">${h.orderCode }</td>	
						<td>${h.buyerCode }</td>					
						<td>${h.buyerName }</td>
						<td>${h.deliveryDate }</td>
						<td>${h.writer }</td>
						<td>${h.inserted }</td>
						<td>${h.modified }</td>
						<td>
							<c:choose>
								<c:when test="${h.status == '임시저장'}">
									<form action="${pageContext.request.contextPath }/order/modify">
										<input type="hidden" name="orderId"  value="${h.orderId }">
										<button type="submit" class="btn btn-warning" style="color: white;">
											${h.status }
										</button>
									</form>
								</c:when>
								<c:when test="${h.status == '승인요청'}">
									<c:url value="/order/confirmOrderSheet" var="confirmOrderSheetLink">
										<c:param name="orderId" value="${h.orderId }"/>
										<c:param name="id" value="${h.writer }"/>
									</c:url>
										<button type="submit" class="btn btn-primary" 
										onclick="window.open('${confirmOrderSheetLink}','주문서','width=800,height=1000,left=500,top=100,location=no,status=no,scrollbars=yes');"
										>
											${h.status }
										</button>
								</c:when>
								<c:when test="${h.status == '승인완료'}">
									<c:url value="/order/orderSheet" var="orderSheetLink">
										<c:param name="orderId" value="${h.orderId }"/>
										<c:param name="id" value="${h.writer }"/>
									</c:url>							
									<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-success" 
									onclick="window.open('${orderSheetLink}','주문서','width=800,height=1000,left=500,top=100,location=no,status=no,scrollbars=yes');"
									>
										${h.status }
									</button>
								</c:when>
								<c:when test="${h.status == '요청반려'}">									
									<c:url value="/order/companionSheet" var="companionSheetLink">
										<c:param name="orderId" value="${h.orderId }"/>
										<c:param name="id" value="${h.writer }"/>
									</c:url>
									<button type="submit" class="btn btn-danger" 
									onclick="window.open('${companionSheetLink}','주문서','width=800,height=1000,left=500,top=100,location=no,status=no,scrollbars=yes');"
									>
										${h.status }
									</button>
								</c:when>
								<c:when test="${h.status == '승인취소'}">
									<c:url value="/order/orderSheet" var="orderSheetLink">
										<c:param name="orderId" value="${h.orderId }"/>
										<c:param name="id" value="${h.writer }"/>
									</c:url>			
									<button type="submit" class="btn btn-secondary"
									onclick="window.open('${orderSheetLink}','주문서','width=800,height=1000,left=500,top=100,location=no,status=no,scrollbars=yes');" 
									>
										${h.status }
									</button>			
								</c:when>
								<c:when test="${h.status == '거래종결'}">
									<c:url value="/order/orderSheet" var="orderSheetLink">
										<c:param name="orderId" value="${h.orderId }"/>
										<c:param name="id" value="${h.writer }"/>
									</c:url>	
									<button type="submit" class="btn btn-secondary" 
									onclick="window.open('${orderSheetLink}','주문서','width=800,height=1000,left=500,top=100,location=no,status=no,scrollbars=yes');" 
									>
										${h.status }
									</button>
									
								</c:when>
							</c:choose>	
						</td>
						<td>
							<button id="detailBtn${h.orderCode }" type="button" class="btn btn-outline-secondary">주문상세</button>
						</td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>  
	</div>
	
	<hr>
	
	<div class="">
		<h4>주문 상세</h4>
		<p id="codeConfirm"></p>
	</div>	
	<div class="scrollBoxItem">
		<table class="table">
			<thead>
				<tr>
	                <th style="text-align: center; border-right: ridge;" scope="col">번호</th>
	                <th style="text-align: center; border-right: ridge;" scope="col" colspan="4">제품정보</th>
	                <th style="text-align: center;" scope="col" colspan="4">금액정보</th>     
                </tr>        
				<tr>
					<th>#</th>
					<th>제품코드</th>
	                <th>제품그룹</th>
					<th>제품명</th>	
					<th>단가</th>
					<th>판매가</th>
					<th>할인율</th>
					<th>수량</th>
					<th>합계</th>	
				</tr>
			</thead>
			<tbody id="itemBody">			
				
			</tbody>
		</table>
	</div><!-- scrollBox 끝 -->
</div><!-- container 끝  -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

list();
checkDate();
	
function list(){
	/* btn 변수 담기 */
	<c:forEach items="${headerList}" var="h">
		let detailBtn${h.orderCode} = '${h.orderCode}';
		/* console.log(detailBtn${h.orderCode}); */
				
		$(function (){			
			$('#detailBtn${h.orderCode}').click(function(){
				
				$('tr').removeClass();
				$('[name=checkbox]').prop('checked', false);
				
				/* row 백그라운드 ,체크하기, */
				$('#checkbox${h.orderCode}').prop('checked', true);
				$('#tr${h.orderCode}').addClass("selectedRow");
				
				$.ajax({
					url: "/order/itemList/${h.orderCode}",
					data: {orderCode : "${h.orderCode}"},
					type: "get",
					dataType: "json"
				})
				.done(function(itemList){
					
					$('#codeConfirm').empty();
					$('#itemBody').empty();
					
					$('#codeConfirm').append('주문코드 : ${h.orderCode}');
					
					$.each(itemList, function(idx, item){
						
						/* ajax 자동할인율  price / finalPrice  */
						let pr = item.price;
						let fp = item.finalPrice;
						let dc = (1 - ( fp / pr )) * 100; 	
						dc = parseFloat(dc).toFixed(0);
						dc = Math.round(dc);
						/* console.log(dc); */
						
						/* row 체크 풀기 */
						$('#checkbox'+item.orderCode).removeAttr("checked"); 
						/* console.log(item); */
						idx= idx+1;
						
						$('#itemBody')
						.append(		
						'<tr class="listHover">'+	
							'<td>'+idx+'</td>'+
							'<td>'+item.productCode+'</td>'+
							'<td>'+item.productType+'</td>'+
							'<td>'+item.productName+'</td>'+
							'<td>'+item.price+'</td>'+
							'<td>'+item.finalPrice+'</td>'+
							'<td>'+dc+'%</td>'+
							'<td>'+item.quantity+item.unit+'</td>'+
							'<td>'+item.sum+'</td>'+
						'</tr>'
						);
					});
				})	
			})
		})
	</c:forEach>
};	

/* 해더리스트가 적을때, 스크롤 사이즈 줄이기 height:auto;  */
if (${size} < 7) {
	$('#sbh1').removeClass();
}

/* 필터 전체기간 체크 */
function checkDate(){	
	$('#checkedAllDate').click(function(){
		if($('#checkedAllDate').is(':checked') ){	
			$('input[name=d1]').attr('value', '');
			$('input[name=d2]').attr('value', '');		
			$('input[name=d1]').prop("disabled", true);
			$('input[name=d2]').prop("disabled", true);
			
		}else{
			$('#checkedAllDate').prop('checked', false);
			$('input[name=d1]').removeAttr("disabled");
			$('input[name=d2]').removeAttr("disabled");
			$('input[name=d1]').attr('value', '${nowDate }')
			$('input[name=d2]').attr('value', '${addMonth }')
		}
	})
}


	
</script>
	
</body>
</html>