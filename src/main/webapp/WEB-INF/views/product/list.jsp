<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<div class="container">
	<!-- 검색 필터 -->
	<div class="form-control mt-5 mb-3 ">
		<div class="row d-flex mb-2">
			<div class="col-sm-2" >
				<label for="exampleDataList1" class="form-label">제품코드</label>
				<input name="" value="" class="form-control" list="datalistOptions1" id="exampleDataList1" placeholder="제품코드">
				<datalist id="datalistOptions1">
					<c:forEach items="${productList }" var="product">
						<option value="${product.productCode }">
					</c:forEach>
				</datalist>
			</div>
			<div class="col-sm-2">
				<label for="exampleDataList2" class="form-label">제품명</label>
				<input name="" value="" class="form-control" list="datalistOptions2" id="exampleDataList2" placeholder="제품명">
				<datalist id="datalistOptions2">
					<c:forEach items="${productList }" var="product">
						<option value="${product.productName }">
					</c:forEach>
				</datalist>
			</div>
			<div class="col-sm-2">
				<label for="exampleDataList3" class="form-label">제품타입</label>
				<input name="" value="" class="form-control" list="datalistOptions3" id="exampleDataList3" placeholder="제품타입">
				<datalist id="datalistOptions3">
					<c:forEach items="${types }" var="type">
						<option value="${type }">
					</c:forEach>
				</datalist>
			</div>
			<div class="col-sm-2">
				<label for="exampleDataList4" class="form-label">제품규격</label>
				<input name="" value="" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="제품규격 Inch">
				<datalist id="datalistOptions4">
					<c:forEach items="${sizes }" var="size">
						<option value="${size }">
					</c:forEach>
				</datalist>
			</div>
			<div class="col-sm-4">
				<label for="exampleDataList5" class="form-label">검색어</label>
			 	<input class="form-control" id="exampleDataList5" placeholder="검색어 ?">
			</div>
		</div>
		<div class="row d-flex">
			<div class="col-sm-4">
				<input class="form-control" placeholder="날짜 ?">
				
				
			</div>
			<div class="col-sm-4">
				
			 	<input class="form-control" placeholder="제품원가 ?">
			</div>
		</div>
	</div>
	
	<hr>
	<h4>제품목록</h4>
	<!-- 리스트 -->
	<table class="table">
		<thead>
			<!-- productCode, productName, productType, weight, size, price, unit, content -->
			<tr>
				<th>제품코드</th>
				<th>제품명</th>
				<th>타입</th>
				<th>무게(g)</th>
				<th>규격(Inch)</th>
				<th>단위(EA)</th>
				<th>원가</th>
			</tr>
		</thead>
		<tbody>
		<!-- //productCode, productName, productType, weight, size, price, unit, content, inserted -->
			<c:forEach items="${productList }" var="product">
				<tr>
					<td>${product.productCode }</td>
					<td>${product.productName }</td>
					<td>${product.productType }</td>
					<td>${product.weight }</td>
					<td>${product.size }</td>
					<td>${product.unit }</td>
					<td>${product.price }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<my:sidebar active=""></my:sidebar>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>