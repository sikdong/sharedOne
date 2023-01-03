<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- 구글 열차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart1);
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart1() {
		/* 		var data = google.visualization.arrayToDataTable([
	      ['월','전년동월실적', '당월실적', '전년 당월 매출', '당월 매출'],	  
	      <c:forEach items="${chartList}" var="chart">
			
			['금액,${chart.prvProfit},${chart.nowProfit},${chart.prvSales},${chart.nowSales}]
			<c:if test="${not empty chartList.size() }">
				,
			</c:if>	
		</c:forEach>  
	    ]); */
	    
		var data = google.visualization.arrayToDataTable([
	          ['월','전년12월매출', '12월매출', '전년 12월 순이익', '12월 순이익'],
	          ['ㅤ', 1000, 1030, 540, 350]
	        ]);

	        var options = {
	          chart: {
	            title: '작년 대비 매출, 순이익',
	            subtitle: '조회 달 기준 매출&순이익',
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
		
	}
	
	function drawChart2(){
		<!-- javaScript forEach 문으로  -->
		/* 		var data = google.visualization.arrayToDataTable([
				      ['월', ${month-5}', '${month-4}', '${month-3}', '${month-2}', '${month-1}', '${month}'],	  
				      <c:forEach items="${SalesList}" var="chart">
						
						['금액',${chart.nowSales-5},${chart.nowSales-4},${chart.nowSales-3},${chart.nowSales-2},${chart.nowSales-1},${chart.nowSales}]
						<c:if test="${not empty chartList.size() }">
							,
						</c:if>	
					</c:forEach>  
				    ]);
			 */

		var data = google.visualization.arrayToDataTable([
	          ['기간','2022.6', '2022.7', '2022.8', '2022.9', '2022.10', '2022.11', '2022.12'],
	          ['ㅤ',  780, 850, 580,750, 1000, 400, 600]
	        ]);

	        var options = {
	          chart: {
	            title: '6개월간 매출',
	            subtitle: '조회 달 6개월 이전 매출',
	          }
	        };

	        var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
		
	}

</script>
<style>
.yearSelect {
	float: left;
	margin-left: 12px;
	margin-bottom: 20px;
}

#exampleSelect1 {
	padding-right: 20.0em 
}

.monthSelect {
	float: left;
	margin-left: 270px;
	margin-bottom: 20px;
}

#exampleSelect2 {
	padding-right: 20.0em 
}

/* 그래프 박스 */

div.mainBoard {
	margin-top: 20px;
	width: 100%;
	height: :1050px;
	
}
/* div.top{
	width: 100%;
	height: 150px;
	
} */
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
.mr10px{
	margin-right:10px;
}
.listHover:hover {
	background-color: #D3D3D3;
	cursor: pointer;
}
.btn-m5{
	margin : 5px;
}

.table {
	margin-top: 10px;

}

#navbar-example1 {
	margin-top: 20px !important;
	margin-bottom: 20px !important;
}

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<my:sidebar active=""></my:sidebar>

<div class="container-sm">
	<div class="yearSelect">
      <label for="exampleSelect1" class="form-label mt-4">연도</label>
      <select class="form-select" id="exampleSelect1">
        <option>2022</option>
        <option>2021</option>
      </select>
    </div>
    <div class="monthSelect">
      <label for="exampleSelect2" class="form-label mt-4">월</label>
      <select multiple="" class="form-select" id="exampleSelect2">
        <option>1월</option>
        <option>2월</option>
        <option>3월</option>
        <option>4월</option>
        <option>5월</option>
        <option>6월</option>
        <option>7월</option>
        <option>8월</option>
        <option>9월</option>
        <option>10월</option>
        <option>11월</option>
        <option>12월</option>
      </select>
    </div>

	<div class="mainBoard">
		<!-- 막대그래프 -->
        <div class="left p-2">
        	<div id="columnchart_material1" style="width: 500px; height: 550px;"></div>
        </div>
		<div class="right p-2">
			<div id="columnchart_material2" style="width: 500px; height: 550px;"></div>
		</div>
		<!-- 테이블 -->
		<div class="left p-2">
			<nav id="navbar-example1" class="navbar bg-light px-3 mb-2">
				<a class="navbar-brand" href="#">월 별 순이익</a>
			</nav>
			<div data-bs-spy="scroll" data-bs-target="#navbar-example1"
				data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true"
				class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>순이익</th>
							<th>누적순이익</th>
							<th>Rate(%)</th>
						</tr>
					</thead>
					<tbody>
<%-- 						<c:forEach items="${chartList}" var="chart">
							<tr class="listHover">
								<td>${chart.month}</td>
								<td>${chart.profit}</td>
								<td>${chart.cumulativeProfit}</td>
								<td>${chart.profitRate}</td>
						</c:forEach> --%>
							<tr class="listHover">						
								<td>2022.12</td>
								<td>258,000</td>
								<td>1,258,000</td>
								<td>21%</td>
							</tr>
							<tr class="listHover">
								<td>2022.11</td>
								<td>250,000</td>
								<td>1,000,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.10</td>
								<td>250,000</td>
								<td>750,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.9</td>
								<td>250,000</td>
								<td>500,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.8</td>
								<td>250,000</td>
								<td>250,000</td>
								<td>20%</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="right p-2">
			<nav id="navbar-example1" class="navbar bg-light px-3 mb-2">
				<a class="navbar-brand" href="#">월 별 매출</a>
			</nav>
			<div data-bs-spy="scroll" data-bs-target="#navbar-example1"
				data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true"
				class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매출</th>
							<th>누적매출</th>
							<th>Rate(%)</th>
						</tr>
					</thead>
					<tbody>
<%-- 						<c:forEach items="${chartList}" var="chart">
							<tr class="listHover">
								<td>${chart.month}</td>
								<td>${chart.sales}</td>
								<td>${chart.cumulativeSales}</td>
								<td>${chart.salesRate}</td>
							</tr>
						</c:forEach> --%>
							<tr class="listHover">						
								<td>2022.12</td>
								<td>500,000</td>
								<td>2,500,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.11</td>
								<td>500,000</td>
								<td>2,000,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.10</td>
								<td>500,000</td>
								<td>1,500,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.9</td>
								<td>500,000</td>
								<td>1,000,000</td>
								<td>20%</td>
							</tr>
							<tr class="listHover">
								<td>2022.8</td>
								<td>500,000</td>
								<td>500,000</td>
								<td>20%</td>
							</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>