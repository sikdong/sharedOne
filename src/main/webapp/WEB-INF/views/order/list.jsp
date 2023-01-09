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
	.scrollBox {
		width : 100%;
		height: 30%;
	}
	.listHover:hover {
		background-color: #D3D3D3;
		cursor: pointer;
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
	.scrollBox {
		width: 100%;
		height: 400px;
		box-sizing: border-box;
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

<div class="container-sm mt-4" style=" width: 77vw; margin-left: auto; ">
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
				<p class="filterText ">기간 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
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
				<!-- 검색필터 3rd row : 기간 선택 : 등록일 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
							<label class="form-check-label" for="flexCheckDefault">등록일</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d1" value="${nowDate }" type="date" id="d1" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="d2" value="${nowDate }" type="date" id="d2" class="form-control">
						</div>
					</div>
				</div><!-- 3rd row 끝 -->
				<!-- 검색필터 4th row : 기간 선택 : 수정일 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
							<label class="form-check-label" for="flexCheckDefault">수정일</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d3" value="" type="date" id="d3" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="d4" value="" type="date" id="d4" class="form-control">
						</div>
					</div>
				</div><!-- 4th row 끝 -->
				<!-- 검색필터 5th row : 기간 선택 : 납기요청일 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
							<label class="form-check-label" for="flexCheckDefault">납기요청일</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d5" value="" type="date" id="d5" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="d6" value="" type="date" id="d6" class="form-control">
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
	<div class="scrollBox">
		<table class="table">
			<thead>
				<tr>
					<th>선택</th>
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
				<c:forEach items="${headerList }" var="h">
					<tr class="listHover" id="header${h.orderCode }" >
						<td><input type="checkbox" id="checkbox${h.orderCode }"></td>
						<td>${h.orderCode }</td>	
						<td>${h.buyerCode }</td>					
						<td>${h.buyerName }</td>
						<td>${h.deliveryDate }</td>
						<td>${h.name }</td>
						<td>${h.inserted }</td>
						<td>${h.modified }</td>
						<td>
							<c:choose>
								<c:when test="${h.status == '임시저장'}">
									<form action="">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-secondary" >${h.status }</button>
									</form>
								</c:when>
								<c:when test="${h.status == '승인요청'}">
									<form action="${pageContext.request.contextPath }/order/orderSheet">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-primary" >${h.status }</button>
									</form>
								</c:when>
								<c:when test="${h.status == '승인완료'}">
									<form action="${pageContext.request.contextPath }/order/companionSheet">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-success" >${h.status }</button>
									</form>
								</c:when>
								<c:when test="${h.status == '요청반려'}">									
									<form action="${pageContext.request.contextPath }/order/companionSheet">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-danger" >${h.status }</button>
									</form>
								</c:when>
								<c:when test="${h.status == '승인취소'}">
									<form action="${pageContext.request.contextPath }/order/companionSheet">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-secondary" >${h.status }</button>
									</form>
								</c:when>
								<c:when test="${h.status == '거래종결'}">
									<form action="${pageContext.request.contextPath }/order/companionSheet">
										<button type="submit" name="orderId" value="${h.orderId }" class="btn btn-secondary" >${h.status }</button>
									</form>
								</c:when>
							</c:choose>
							
							
						</td>
						<c:if test="${empty param.orderCode }">
							<td>
							<!-- ?q=&orderCode=&buyerCode=&writer=&status=&d1=2023-01-09&d2=2023-01-09&d3=&d4=&d5=&d6= -->
								<form action="" method="get">
									
									<button id="detailBtn${h.orderCode }" name="orderCode" value="${h.orderCode }" type="submit" class="btn btn-outline-secondary">주문상세</button>
									
								</form>
							</td>
						</c:if>
						<c:if test="${not empty param.orderCode }">
							<td>
								<input type="hidden" name="" id="" value="${h.orderCode}">
								<button id="backBtn${h.orderCode }" type="button" class="btn btn-outline-secondary">돌아가기</button>
								
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>  
	</div>
	
	<hr>
	<c:if test="${not empty param.orderCode }">
		<div class="d-flex">
			<div class="col-sm-4">
				<h4>주문 상세</h4>
				<span style="font-size: 15pt;">주문코드 : ${param.orderCode }</span>
				
			</div>
			<div class="col-sm-7"></div>
			
			<div class="col-sm-1">
			<!-- 	<button id="" class="btn btn-oneline-primary primaryBtn"><span style="font-size: 12pt">주문서확인</span></button> -->
			</div>
		</div>	
		
		<div class="scrollBox">
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>제품명</th>	
						<th>단가</th>
						<th>공급가액</th>
						<th>할인율</th>
						<th>수량</th>
						<th>합계</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList }" var="item" varStatus="st">
					<tr class="listHover">
						<td>${st.count }</td>
						<td>${item.productName }</td>			
						<td>${item.price }</td>
						<td>${item.salePrice }</td>
						<td>${item.discountRate } %</td>
						<td>
							${item.quantity } ${item.unit }
							<!-- <span><i class="fa-solid fa-pen-to-square"></i></span>  -->
						</td>
						<td>${item.sum }</td>
					
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- scrollBox 끝 -->
		<!-- <div id="detailContainerDiv"></div> -->
	</c:if>
</div><!-- container 끝  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		const ctx = ${pageComtext.request.contextPath}
		
		console.log('backBtn${param.orderCode}');
		
		
		$(function(){ 
			$('#detailBtn${param.orderCode}').click(function(){
				$('#checkbox${param.orderCode}').checked();
			})
		})
		
		$(function(){ 
			$('#backBtn${param.orderCode}').click(function(){
				history.go(-1);
			})
		})
		
	</script>
	
	
</body>
</html>