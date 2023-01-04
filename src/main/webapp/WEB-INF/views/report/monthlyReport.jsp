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
// Load Charts and the corechart and barchart packages.
google.charts.load('current', {'packages':['corechart']});

// Draw the line chart and bar chart when Charts is loaded.
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', '월');
  data.addColumn('number', '매출');
  data.addRows([
    ['6월', 600],
    ['7월', 1500],
    ['8월', 1200],
    ['9월', 1360],
    ['10월', 2680],
    ['11월', 1740]
  ]);

  var linechart_options = {title:'월 별 매출 현황'};
  var linechart = new google.visualization.LineChart(document.getElementById('columnchart_material1'));
  linechart.draw(data, linechart_options);

  var barchart_options = {title:'월 별 매출 현황',
                 legend: 'none'};
  var barchart = new google.visualization.BarChart(document.getElementById('columnchart_material2'));
  barchart.draw(data, barchart_options);
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
	height: :1000px;
	
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
.searchBtn{
 background-color: #1d5c83;
 margin-bottom: 10px;
}

.tableContainer {

}

</style>


</head>
<body>
<div class="container-sm mt-4">
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
							<button class="btn btn-primary searchBtn" type="submit">선택 조건 검색</button>
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

		<h4>제품목록</h4>

			<div style="float: right;">
				<form action="/excel/download" method="get">
					<button class="btn btn-primary searchBtn" type="submit">
						엑셀 다운로드
					</button>
				</form>
			</div>
			<!-- 리스트 -->
		<table class="table">
			<thead>
				<!-- productCode, productName, productType, weight, size, price, unit, content -->
				<tr>
					<th>주문서 ID</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>납기일</th>
					<th>담당자</th>
					<th>바이어코드</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
			<!-- //productCode, productName, productType, weight, size, price, unit, content, inserted -->
<%-- 				<c:forEach items="${OrderList }" var="order">
					<tr>
						<td>${order.orderCode }</td>
						<td>${order.inserted }</td>
						<td>${order.modified }</td>
						<td>${order.deliveryDate }</td>
						<td>${order.writer }</td>
						<td>${order.byuerCode }</td>
						<td>${order.status }</td>

					</tr>
				</c:forEach> --%>
					<tr>
						<td>WT22060101</td>
						<td>2022-06-01</td>
						<td>2022-06-01</td>
						<td>2022-08-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>종결</td>
					</tr>
					<tr>
						<td>WT22070402</td>
						<td>2022-07-04</td>
						<td>2022-07-15</td>
						<td>2022-08-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>종결</td>
					</tr>
					<tr>
						<td>WT22080101</td>
						<td>2022-08-01</td>
						<td>2022-08-01</td>
						<td>2022-09-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>종결</td>
					</tr>
					<tr>
						<td>WT22090402</td>
						<td>2022-09-04</td>
						<td>2022-09-15</td>
						<td>2022-10-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>종결</td>
					</tr>
										<tr>
						<td>WT22100101</td>
						<td>2022-10-01</td>
						<td>2022-10-01</td>
						<td>2022-12-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>승인</td>
					</tr>
					<tr>
						<td>WT22110402</td>
						<td>2022-11-04</td>
						<td>2022-11-15</td>
						<td>2022-12-30</td>
						<td>이나현</td>
						<td>MOB</td>
						<td>승인</td>
					</tr>
				
			</tbody>
		</table>
	</div>
</div>
<my:sidebar active=""></my:sidebar>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
//실제 사용 방법

$('#datePicker').datepicker({
		format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		... //생략
                language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		})//여기까지가 기본 사용 방법
            .on("changeDate", function(e) {
                 //이벤트의 종류
                 //show : datePicker가 보이는 순간 호출
                 //hide : datePicker가 숨겨지는 순간 호출
                 //clearDate: clear 버튼 누르면 호출
                 //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                 //changeMonth : 월이 변경되면 호출
                 //changeYear : 년이 변경되는 호출
                 //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
                 
                 console.log(e);// 찍어보면 event 객체가 나온다.
                 //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
                 // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
                 // 위와 같은 형태로 보인다. 
                 // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
            }
</script>
	
</body>
</html>