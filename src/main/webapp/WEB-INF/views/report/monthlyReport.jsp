<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레포트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<!--한국어 달력 쓰려면 추가 로드-->
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
<!-- 구글 열차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});

var paramList = new Array(); 
var paramList = ["${param.orderQ}", "${param.orderCode}", "${param.productCode}", "${param.writer}", "${param.status}", "${param.fromDate}", "${param.endDate}"];

//검색 조건 없으면 올해 매출 그래프, 있으면 바이어 별 & 직원 별 매출 그래프
if (paramList == ",,,,,,") {
	google.charts.setOnLoadCallback(drawChart);
}else {
	
google.charts.setOnLoadCallback(drawBuyerChart);
google.charts.setOnLoadCallback(drawWriterChart);
}


function drawChart() {
	
  var data = new google.visualization.DataTable();
  data.addColumn('string', '월');
  data.addColumn('number', '매출');
  <c:forEach items="${thisYearSales}" var="sales">
	  data.addRows([
	    [${sales.month }+'월', ${sales.thisSales}]
	  <c:if test="${not empty thisYearSales.size() }">
		,
	</c:if>
		]);
  </c:forEach>
  var linechart_options = {title:'올 해 매출 현황'};
  var linechart = new google.visualization.LineChart(document.getElementById('columnchart_material1'));
  linechart.draw(data, linechart_options);

  var barchart_options = {title:'올 해 매출 현황',
                 legend: 'none'};
  var barchart = new google.visualization.BarChart(document.getElementById('columnchart_material2'));
  barchart.draw(data, barchart_options);
}

function drawBuyerChart() {
	
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', '바이어');
	  data.addColumn('number', '매출');
	  <c:forEach items="${buyerSales}" var="buyerSales">
		  data.addRows([
		    ['${buyerSales.key }', ${buyerSales.value}]
			]);
	  </c:forEach>
	  var piechart_options = {title:'바이어 별 매출 현황'};
	  var piechart = new google.visualization.PieChart(document.getElementById('columnchart_material1'));
	  piechart.draw(data, piechart_options);

	}

function drawWriterChart() {
	
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', '직원');
	  data.addColumn('number', '매출');
	  <c:forEach items="${writerSales}" var="writerSales">
		  data.addRows([
		    ['${writerSales.key }', ${writerSales.value}]
			]);
	  </c:forEach>
	  var options = {title:'담당 직원 별 매출 현황',
              legend: 'none'};
		var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material2'));
		chart.draw(data, options);

	}

</script>

<style type="text/css">
	.filterText {
		text-align: center;
		
	}
	.leftFilterDiv {
		border-right-style: groove;
	}
	
#searchBox {
/*  background-color: #f4eed9cb; */
}
	
div.mainBoard {

	margin-top: 20px;
	margin-bottom: 10px;
	width: 100%;
	height: 500px;
	
}

div.left {
	
	width: 50%;
	height: 500px;
	float: left;
	box-sizing: border-box;
	
/* 	overflow: scroll; */
}
div.right {

	width: 50%;
	height: 500px;
	float: right;
	box-sizing: border-box;
	
/* 	overflow: scroll; */
}

.tableContainer {

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
 	
 	.table{border-collapse:collapse; width:100%; table-layout:fixed}
	.table thead{float:left; width:1300px;}
	.table thead th{display:auto; width:1300px; text-align: center;}
	.table tbody{overflow-y:auto; overflow-x:auto; float:left; width:1300px; height:550px;}
	.table tbody tr{display:table; width:1300px;}
	.table td{word-wrap:break-word; width:1300px; text-align: center;}

</style>


</head>
<body>
<my:side_bar active=""></my:side_bar>
<div class="container-sm mt-4" style="width: 77vw; margin-left: 20%;">
	<div class="row d-flex" id ="searchBox">
		
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2">
			<div class="mb-5">
				<p class="filterText ">전체 검색</p>
			</div>
			<div class="mb-5">
				<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			</div>
			<div class="mb-5">
				<p class="filterText ">납기 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
			</div>
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10 mt-1">
			<form action="" method=""><!-- form get? post?  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex">
					<div class="col-sm-6 mb-4">
						<div class="input-group">
							<input name="orderQ" value="${param.orderQ }" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>	
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >
							<input name="orderCode" value="${param.orderCode }"  type="text" id="" class="form-control" list="datalistOptions1" placeholder="주문서 ID">
							<datalist id="datalistOptions1">
								<c:forEach items="${orderList }" var="order">
									<option value="${order.orderCode}">${order.orderCode}</option>
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="productCode" value="${param.productCode }" type="text" id="" class="form-control" list="datalistOptions2" placeholder="제품코드">
							<datalist id="datalistOptions2">
								<c:forEach items="${productList }" var="product">
									<option value="${product.productCode}">${product.productCode }</option>
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="writer" value="${param.writer }" type="text" id="" class="form-control" list="datalistOptions3" placeholder="담당자">
							<datalist id="datalistOptions3">
								<c:forEach items="${writers }" var="writer">
									<option value="${writer }">${writer }</option>
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="status" value="${param.status }" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="상태">
							<datalist id="datalistOptions4">
								<c:forEach items="${status }" var="status">
									<option value="${status }">${status }</option>
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
						    <input class="form-check-input" type="checkbox" value="" id="checkedAllDate" checked>
							<label class="form-check-label" for="flexCheckDefault">전체기간</label>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="input-group">
							<input name="fromDate" value="${param.fromDate }" type="date" id="d1" class="form-control">
							<span class="input-group-text" style="padding-left: 20px; padding-right: 20px;">~</span>
			        		<input name="endDate" value="${param.endDate }" type="date" id="d2" class="form-control">
						</div>
					</div>
					<div class="col-sm-2">
							<a class="btn btn-outline-primary primaryBtn" type="submit" href="/report/monthlyReport">검색 조건 초기화</a>
					</div>

				</div><!-- 3rd row 끝 -->
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
	
	<div class="mainBoard">
		<!-- 그래프 -->
        <div class="left p-2">
        	<div id="columnchart_material1" style="width: 500px; height: 450px; margin-left: 80px;"></div>
        </div>
		<div class="right p-2">
			<div id="columnchart_material2" style="width: 500px; height: 450px; margin-left: 50px;"></div>
		</div>
	</div>
	
	
<div class="tableContainer">

		<h4>주문목록</h4>

		<div style="float: right;">
			<c:set var="ctx" value="${pageContext.request.contextPath}" />
			<a href="${ctx }/report/excelDown?orderQ=${param.orderQ }"
				class="btn btn-primary primaryBtn" type="submit"
				style="margin-bottom: 10px;"> 엑셀 다운로드 </a>
		</div>
		<!-- 리스트 -->
		<table class="table">
			<thead>
				<!-- productCode, productName, productType, weight, size, price, unit, content -->
				<tr>
					<th style="width: 150px;">주문서 ID</th>
					<th style="width: 130px;">바이어코드</th>
					<th style="width: 100px;">제품코드</th>
					<th style="width: 130px;">판매가</th>
					<th style="width: 100px;">수량</th>
					<th style="width: 200px;">합계</th>
					<th style="width: 200px;">등록일</th>
					<th style="width: 200px;">납기일</th>
					<th style="width: 150px;">담당자</th>
					<th style="width: 150px;">상태</th>
					<th style="width: 130px;">메세지</th>
				</tr>
			</thead>
			<tbody>
			<!-- 오더 아이템이 1개 이하 -->
				<c:forEach items="${orderList }" var="order">
					<c:if test="${fn:length(order.orderItem) < 2 }">
						<tr>
							<td style="width: 150px;">${order.orderCode }</td>
							<td style="width: 130px;">${order.buyerCode }</td>
							<td style="width: 100px;">${order.orderItem[0].productCode }</td>
							<td style="width: 130px;">${order.orderItem[0].finalPrice }</td>
							<td style="width: 100px;">${order.orderItem[0].quantity }</td>
							<td style="width: 200px;">${order.orderItem[0].sum }</td>
							<td style="width: 250px;">${order.inserted }</td>
							<td style="width: 250px;">${order.deliveryDate }</td>
							<td style="width: 150px;">${order.writer }</td>
							<td style="width: 200px;">${order.status }</td>
							<td style="width: 130px;">${order.message }</td>
						</tr>
					</c:if>
			<!-- 오더 아이템이 여러개 -->
					<c:if test="${fn:length(order.orderItem) >= 2 }">
						<c:forEach items="${order.orderItem }" var="item">
							<tr>
								<td style="width: 150px;">${order.orderCode }</td>
								<td style="width: 130px;">${order.buyerCode }</td>
								<td style="width: 100px;">${item.productCode }</td>
								<td style="width: 130px;">${item.finalPrice }</td>
								<td style="width: 100px;">${item.quantity }</td>
								<td style="width: 200px;">${item.sum }</td>
								<td style="width: 250px;">${order.inserted }</td>
								<td style="width: 250px;">${order.deliveryDate }</td>
								<td style="width: 150px;">${order.writer }</td>
								<td style="width: 200px;">${order.status }</td>
								<td style="width: 130px;">${order.message }</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
function myFunction() {

	var str = document.getElementById("demo").value; 


//전체 기간 선택
$('input[name=fromDate]').prop("disabled", true);
$('input[name=endDate]').prop("disabled", true);
$('#checkedAllDate').click(function(){
	if($('#checkedAllDate').is(':checked') ){
		
		$('input[name=fromDate]').prop("disabled", true);
		$('input[name=endDate]').prop("disabled", true);
	}else{
		$('input[name=fromDate]').removeAttr("disabled");
		$('input[name=endDate]').removeAttr("disabled");
	}
})


</script>
	
</body>
</html>