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
<h4>제품목록</h4>
<p>카테고리별 필터링 검색과 페이지네이션 추가하기 </p>

<!-- productCode, productName, productType, weight, size, price, unit, content -->
<table>
	<thead>
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
		<c:forEach items="${productsList }" var="product">
			<tr>
				<td>${product.code }</td>
				<td>${product.name }</td>
				<td>${product.type }</td>
				<td>${product.weight }</td>
				<td>${product.size }</td>
				<td>${product.unit }</td>
				<td>${product.price }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<my:sidebar active=""></my:sidebar>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>