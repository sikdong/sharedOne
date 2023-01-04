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
		border : solid; color:red;
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
</style>


</head>
<body>

<!-- 현재 날짜 설정  -->
<c:set value="<%=sf.format(nowDate)%>" var="nowDate"/>
<!-- ${nowDate}  -->

<!-- 한달후 날짜 설정 -->
<c:set value='<%=sf.format(addMonth)%>' var="addMonth" /> 
<!-- ${addMonth}  -->
<div class="container-sm mt-4">
	<div class="row d-flex">
		
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2">
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
							<input name="" value="" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="주문번호">
							<datalist id="datalistOptions1">
								<c:forEach items="${productList }" var="product">
									<option value="${product.productCode }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="바이어명">
							<datalist id="datalistOptions2">
								<c:forEach items="${productList }" var="product">
									<option value="${product.productName }">
								</c:forEach>
							</datalist>
							<button class="btn btn-s btn-s:hover" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="담당자">
							<datalist id="datalistOptions3">
								<c:forEach items="${types }" var="type">
									<option value="${type }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="처리상태">
							<datalist id="datalistOptions4">
								<c:forEach items="${sizes }" var="size">
									<option value="${size }">
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
							<input name="inserted1" value="${nowDate }" type="date" id="insertedId1" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="inserted2" value="${nowDate }" type="date" id="insertedId2" class="form-control">
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
							<input name="modified1" value="" type="date" id="modifiedId1" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="modified2" value="" type="date" id="modifiedId2" class="form-control">
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
							<input name="deliveryDate1" value="" type="date" id="deliveryDateId1" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="deliveryDate2" value="" type="date" id="deliveryDateId2" class="form-control">
						</div>
					</div>
				</div><!-- 5th row 끝 -->
				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button class="btn btn-p btn-p:hover" type="submit">선택 조건 검색</button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
	<hr>
	
	<div class="d-flex">
		<h4>주문관리</h4>
		<div class="col-sm-10"></div>
		<button id="" class="btn btn-p btn-p:hover" >주문등록</button>
	</div>
	<!-- Order_header -->
	<div class="scrollBox">
		<nav id="navbar-example1" class="navbar bg-body-tertiary px-3 mb-3">
		
		</nav>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example1" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
			<table class="table">
				<thead>
					<tr>
						<th>선택</th>
						<th>주문번호</th>
						<th>바이어명</th>
						<th>납기요청일</th>
						<th>담당자</th>
						<th>등록일</th>
						<th>수정일</th>
						<th>처리상태</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				<!-- Order_header -->
					<c:forEach items="${headerList }" var="header">
						<tr class="listHover">
							<td><input type="checkbox" name=""></td>
							<td>${header.orderCode }</td>
							<td>${header.buyerName }</td>
							<td>${header.deliveryDate }</td>
							<td>${header.name }</td>
							<td>${header.inserted }</td>
							<td>${header.modified }</td>
							<td>${header.status }</td>
							<td>수정/ 삭제</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>  
		</div>
	</div>
	
	<hr>
	
	<h4>주문상세</h4>
	<p>주문번호 : "$[ header.orderCode } " </p>	
	<div class="scrollBox">	
		<nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
		  <table class="table">
			<thead>
				<tr class="listHover">
					<th>No.</th>
					<th>제품명</th>
					<th>단위</th>
					<th>단가</th>
					<th>공급가액</th>
					<th>부가세</th>
					<th>수량</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
		  </table>
		</nav>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
		  <table>
			 <tbody>
				<c:forEach items="${itemList }" var="item">
					<tr>
						<td>${item.productName }</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		  </table>
		</div>
	</div><!-- scrollBox 끝 -->
</div><!-- container 끝  -->



<script type="text/javascript">

</script>
	
</body>
</html>