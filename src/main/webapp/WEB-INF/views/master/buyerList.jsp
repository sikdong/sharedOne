<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>바이어목록</title>

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
	
	.table .trtr:hover {
 	font-weight: bold;
 }
</style>


</head>
<body>
<div class="container-sm mt-4">
	<div class="row d-flex">
		
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-1">
			<p class="filterText">전체 검색</p>
			<p class="filterText">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			<p class="filterText">기간 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10">
			<form action="" method=""><!-- form get? post?  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex">
					<div class="col-sm-9">
						<div class="input-group">
							<input class="form-control" type="search" placeholder="전체검색" aria-label="Search">
			        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex">
					<div class="col-sm-3">
						<div class="input-group" >
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="바이어코드">
							<datalist id="datalistOptions1">
								<c:forEach items="${buyerList }" var="buyer">
									<option value="${buyer.buyerCode }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="바이어명">
							<datalist id="datalistOptions2">
								<c:forEach items="${buyerList }" var="buyer">
									<option value="${buyer.buyerName }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="국가">
							<datalist id="datalistOptions3">
								<c:forEach items="${country }" var="country">
									<option value="${country }">
								</c:forEach>
							</datalist>
							<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="" value="" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="담당자">
							<datalist id="datalistOptions4">
								<c:forEach items="${manager }" var="manager">
									<option value="${manager }">
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
					<div class="col-sm-4">
						<div class="input-group">
							<input type="text" id="datePicker" class="form-control" value="2019-06-27">
			        		<input type="text" id="datePicker" class="form-control" value="2019-06-27">
						</div>
					</div>
					<div class="col-sm-6 d-flex">
						
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">오늘</button>		
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">1주 </button>	
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">15일</button>		
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">1개월</button>
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">3개월</button>
						<button type="button" id="" class="btn btn-outline-secondary" style="font-size: 12pt">6개월</button>	
						
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
	
	<h4>바이어목록</h4>
	<!-- 리스트 -->
	<table class="table table-hover container">
		<thead>
			<tr>
				<th>바이어코드</th>
				<th>바이어명</th>
				<th>주소</th>
				<th>국가</th>
				<th>사업자번호</th>
				<th>연락처</th>
				<th>선적비용부담회사</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyerList }" var="buyer">
			<c:url value="/buyer/get" var="getLink">
					<c:param name="code" value="${buyer.buyerCode }"></c:param>
				</c:url>
				<tr onclick="location.href='${getLink}'" class="trtr">
					<td>${buyer.buyerCode }</td>
					<td>${buyer.buyerName }</td>
					<td>${buyer.address }</td>
					<td>${buyer.country }</td>
					<td>${buyer.businessNumber }</td>
					<td>${buyer.phone }</td>
					<td>${buyer.deliveryCompany }</td>
					<td>${buyer.manager }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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