<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
<title>제품목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<!--한국어 달력 쓰려면 추가 로드-->
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<style type="text/css">
	.filterText {
		text-align: center;
		
	}
	.leftFilterDiv {
		border-right-style: groove;
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
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="제품코드">
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
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="제품명">
							<datalist id="datalistOptions2">
								<c:forEach items="${productList }" var="product">
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
				<!-- 검색필터 3rd row : 기간 선택 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
							<label class="form-check-label" for="flexCheckDefault">전체기간</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d1" value="${nowDate }" type="date" id="d1Id" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="d2" value="${nowDate }" type="date" id="d2Id" class="form-control">
						</div>
					</div>
					<div class="col-sm-5 d-flex">
						
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">오늘</button>		
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">1주 </button>	
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">15일</button>		
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">1개월</button>
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">3개월</button>
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">6개월</button>
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">1년</button>	
						
					</div>
				</div><!-- 3rd row 끝 -->
				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button class="btn btn-outline-success" type="submit">선택 조건 검색</i></button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
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
<script type="text/javascript">



</script>
	
</body>
</html>