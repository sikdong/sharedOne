<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.lang.Deprecated" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품목록</title>

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

/* 		border : solid; color:red; */

		width : 100%;
		height: 30%;
	}
	.listHover:hover {
		background-color: #D3D3D3;
		cursor: pointer;
	}

	.scrollBox {
		width: 100%;
		height: 1000px;
		box-sizing: border-box;
		overflow: scroll;
	}

	th, td {
 		padding: 10px;
 		text-align: auto;
 	}
	
	.table .trtr:hover {
 		font-weight: bold;
 		background-color: #c7c9c2;
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
 
 	
	.table{border-collapse:collapse; width:100%}
	.table thead{float:left; width:1300px;}
	.table thead th{display:auto; width:1300px;}
	.table tbody{overflow-y:auto; overflow-x:hidden; float:left; width:1300px; height:550px;}
	.table tbody tr{display:table; width:1300px;}
	.table td{width:1300px; text-align: left;}
 	
</style>


</head>
<body>

<my:side_bar active=""></my:side_bar>

<div class="container-sm mt-4" style="width: 77vw; margin-left: 20%;">
	<h4>제품 관리</h4>
	<div class="row d-flex">
		
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2">
			<div class="mb-5">
				<p class="filterText ">전체 검색</p>
			</div>
			<div class="mb-5">
				<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			</div>
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10 mt-1">
			<form action="" method=""><!-- form get? post?  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex">
					<div class="col-sm-6 mb-4">
						<div class="input-group">
							<input name="keyword" value="" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="제품코드">
							<datalist id="datalistOptions1">
								<c:forEach items="${product }" var="product">
									<option value="${product.productCode }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="제품명">
							<datalist id="datalistOptions2">
								<c:forEach items="${product }" var="product">
									<option value="${product.productName }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="제품타입">
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
							<input name="" value="" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="제품규격 Inch">
							<datalist id="datalistOptions4">
								<c:forEach items="${sizes }" var="size">
									<option value="${size }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 2nd row 끝 -->

				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button class="btn btn-outline-primary primaryBtn" type="submit">선택 조건 검색</button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
	<hr>
	<div class="d-flex">
		<h4>제품목록</h4>
		<div class="col-sm-10"></div>
		<c:url value="/master/productRegister" var="registerLink"></c:url>
		<button id="registerBtn" class="btn btn-outline-primary primaryBtn" onclick="window.open('${registerLink}','제품등록','width=500,height=500,left=400,top=300,location=no,status=no,scrollbars=yes');">제품등록</button>
	</div>
	<!-- 리스트 -->

	<div class="listBox">
			<table class="table">
			   	 <thead>
					 <tr>

						<th style="max-width: 800px;">제품코드</th>

						<th>제품명</th>
						<th>타입</th>
						<th>무게(g)</th>
						<th>규격(Inch)</th>
						<th>단위(EA)</th>
						<th>원가</th>
						<th>원가기간</th>
					 </tr>
				 </thead>
				<tbody class = "scorllBox">			
					<c:forEach items="${productList }" var="product" varStatus="st">
						<c:url value="/master/productModify" var="getLink">
							<c:param name="code" value="${product.productCode }"></c:param>
						</c:url>
					<tr onclick="window.open('${getLink}','제품정보','width=500,height=500,left=400,top=300,location=no,status=no,scrollbars=yes');" class="trtr">

							<td style="max-width: 500px;">${product.productCode }</td>
							<td>${product.productName }</td>

							<td>${product.productType }</td>
							<td>${product.weight }</td>
							<td>${product.size }</td>
							<td>${product.unit }</td>
							<td>${product.price }</td>
							<td>${product.fromDate } ~ ${product.endDate }</td>
						</tr>
					</c:forEach>
				</tbody>
		    </table>
		</div>
	</div>
	



<script type="text/javascript">

</script>
	
</body>
</html>