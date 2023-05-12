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
<title>가격관리</title>

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
		height: 900px;
		overflow: scroll;
	}
	.selectedRow{
		background-color: #D3D3D3;
	}
	.listHover:hover {
		background-color: #D3D3D3;
		cursor: pointer;
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
 	.price-input{
 		margin: 20px 20px;
 		width: 80%;
 		display: flex;
 		
 	}
 	.price-input span{
 		margin: auto;
 	}
 	.price-input .field{
 		height: 40px;
 		margin: auto;
 		display: flex;
 		align-content: center;
 	}
 	.field input{
 		width: 50%;
 		height: 100%;
 		align-content: center;
 		margin-left: 10px; 
 		border: 1px solid #999;
 		border-radius: 5px;
 		outline: none;
 		text-align: center;
 		font-size: 19px;
 		-moz-appearance: textfield;
 		
 	}
 	.separator{
 		margin: auto;
 	}
 	.slider{
 		height : 5px;
 		border-radius: 5px ;
 		position : relative;
 		background: #ddd;
 	}
 	.slider .progress{
 		height : 5px;
 		border-radius: 5px;
 		position : absolute;
 		left : 0%;
 		right : 0%;
 		background: #1479FB;
 	}
 	.range-input{
 		position: relative;
 	}
 	.range-input input{
 		top : -5px;
 		height : 5px;
 		width : 100%;
 		background: none;
 		position: absolute;
 		pointer-events: none; 
 		-webkit-appearance : none;
 	}
 	input[type="range"]::-webkit-slider-thumb{
 		pointer-events: auto; 
 		
 	}
 	input[type="range"]::-moz-range-thumb{
 		pointer-events: auto; 
 		-moz-appearance : none;
 		border: none;
 		
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
<div class="container-sm mt-4">
	<h4>가격 관리</h4>
	<div class="row d-flex">
		<!-- *좌측* 검색 조건 설명란 -->
		<div class="col-sm-2 leftFilterDiv mt-2">
			<div class="mb-5">
				<p class="filterText ">전체 검색</p>
			</div>
			<div class="mb-5">
				<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
			</div>
			<!-- <div class="mb-5">
				<p class="filterText ">바이어 선택</p>( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... )
			</div> -->
			<div class="mb-5">
				<p class="filterText ">판매가 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
			</div>
			<div class="mb-5">
				<p class="filterText ">판매가 기간</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex. 주문일 / 납기일 등등... ) -->
			</div>
		</div><!-- 좌측 조건 설명 div 끝 -->
		
		<!-- *우측* 검색 필터 -->
		<div class="col-sm-10 mt-1">
			<form id="form"><!-- form ajax  -->		
				<!-- 검색필터 1st row : 전체 검색. -->
				<div class="row d-flex  mb-1">
					<div class="col-sm-6 mb-4">
						<div class="input-group">
							<input name="q" value="${param.q }" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
			        		<button  class="btn btn-outline-secondary" type="button" ><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div><!-- 1st row 끝 -->
				<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex mb-1">
					<div class="col-sm-3 mb-4">
						<div class="input-group" >			
							<input name="productCode" value="${param.productCode }" type="text" id="parentInput" class="form-control" placeholder="제품코드">	
							<button id="productSearch"  class="btn btn-outline-secondary" type="button">제품 검색</button>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="buyerCode" value="${param.buyerCode }" type="text" id="parentInput1B" class="form-control" placeholder="바이어코드">	
							<button id="buyerSearch" class="btn btn-outline-secondary" type="button">바이어 검색</button>
						</div>
					</div>			
				</div><!-- 2nd row 끝 -->
				<!-- 검색필터 3rd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
				<div class="row d-flex mb-1">
					<div class="col-sm-3 mb-4">
						<div class="input-group">
							<input name="productName" value="${param.productName }" type="hidden" id="" class="form-control" placeholder="제품명">	
							<%-- 
							<button class="btn btn-outline-secondary" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
							--%>
						</div>	
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="buyerName" value="${param.buyerName }" type="hidden" id="" class="form-control" placeholder="바이어명">
							<%-- 
							<button class="btn btn-outline-secondary" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
							--%>							
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<input name="country" value="${param.country }" type="hidden" id="" class="form-control" placeholder="국가">					
							<%--
							<button class="btn btn-outline-secondary" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
							--%>
						</div>
					</div>
				</div><!-- 3rd row 끝 -->
				<!-- 검색필터 4th row : 단가 선택  -->
				<div class="row d-flex mb-3">
					<div class="col-sm-9">				
						<div class="slider">
							<div class="progress">
							 <%-- 슬라이드 ui 만든 DIV.  --%>
							</div>
						</div>
						<div class="range-input">
							<input type="range" id="min" value="0" min="0" max="100000" step="10000">			
							<input type="range" id="max" value="100000" min="0" max="100000" step="10000">
						</div>
						<div class="price-input">
							<div class="field">
								<span>Min</span>
								<input type="number" class="input-min" name="priceMin" value="0" readonly>
							</div>
							<div class="separator">-</div>
							<div class="field">
								<span>Max</span>
								<input type="number" class="input-max" name="priceMax" value="100000" readonly>
							</div>	
						</div>
					</div>
				</div><!-- 4th row 끝 -->
				<!-- 검색필터 5th row : 기간 선택 -->
				<div class="row d-flex">
					<div class="col-sm-2">
						<div class="form-check"  style="margin-top: 10px;">
						    <input class="form-check-input" type="checkbox" value="" id="checkedAllDate" checked>
							<label class="form-check-label" for="flexCheckDefault">전체기간</label>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input name="d1" value="" type="date" id="" class="form-control">
							<span class="input-group-text">~</span>
			        		<input name="d2" value="" type="date" id="" class="form-control">
						</div>
					</div>
				</div><!-- 5th row 끝 -->
				<div class="row mt-4">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div style="text-align: justify;">
							<button id="selectedSearchBtn" class="btn btn-oneline-primary primaryBtn" type="button">선택 조건 검색</button>
						</div>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<div style="text-align: justify;">
							<button id="resetPage" class="btn btn-outline-secondary" type="button">검색 초기화</button>
						</div>
					</div>
				</div>
			</form>	
		</div><!-- 우측 검색 조건 div 끝 -->
	</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
	
	<hr>
	
	<div class="d-flex">	
		<h4>가격 상세</h4>	
		<div class="col-sm-10"></div>
		<!-- 가격 등록 버튼 : 창모드 -->
		<c:url value="/master/salePriceRegister" var="getLink"></c:url>
		<button type="button" onclick="window.open('${getLink}','가격등록','width=500,height=500,left=1500,top=100,bottom=300,location=no,status=no,scrollbars=yes');" class="btn btn-oneline-primary primaryBtn" >가격등록</button>			
	</div>
	
	<div class="scrollBox">	
	  <table class="table">
			<thead>
				<tr>
	                <th style="text-align: center; border-right: ridge;" scope="col" colspan="2">번호</th>
	                <th style="text-align: center; border-right: ridge;" scope="col" colspan="2">제품정보</th>	
	                <th style="text-align: center; border-right: ridge;" scope="col" colspan="3">바이어정보</th>
	                <th style="text-align: center; " scope="col" colspan="4">가격정보</th>	 	                   
                </tr> 
				<tr>
					<th>선택</th>
					<th>#</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>바이어코드</th>
					<th>국가</th>
					<th>바이어명</th>
					<th>단가</th>
					<th>판매가</th>
					<th>할인율</th>
					<th>판매가 기간</th>
					<th>비고</th>
				</tr>
			</thead>		
			<tbody id="tbody">
				
			</tbody>
		</table>
	</div><!-- scrollBox 끝 -->
</div><!-- container 끝  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

if ($('#tbody').val() == '') {
	listAll();	
}
search();
checkDate();

/* 기본 전체 리스트 */
function listAll(){
	/* const priceId = $('input[name=priceId]').val(); */
	$.ajax({
<<<<<<< Updated upstream
		url : "salePriceListAjaxList",
=======
		url : "/valves/master/salePriceListAjaxList",
>>>>>>> Stashed changes
		method : "GET",
		/* data : ("priceId" : priceId), */
		dataType : "json"
	})
	.done(function(list){
		$('#tbody').empty();
		
		$.each(list, function(idx, item){
			console.log(item);
			let number = idx + 1;
			
			$('#tbody').append(
				'<tr id="tr' +item.priceId+ '" class="listHover">' +
					'<td><input type="checkbox" name="checkbox" id="checkbox' +item.priceId+ '"></td>'+
					'<td>' +number+ '</td>'+
					'<td>' +item.productCode+ '</td>'+
					'<td>' +item.productName+ '</td>'+
					'<td>' +item.buyerCode+ '</td>'+
					'<td>' +item.country+ '</td>'+
					'<td>' +item.buyerName+ '</td>'+
					'<td>' +addComma(String(item.price))+ '</td>'+
					'<td>' +addComma(String(item.salePrice))+ '</td>'+
					'<td>' +item.discountRate+'%</td>'+
					'<td>' +item.fromDate+ '~' +item.endDate+ '</td>'+
					'<td>' + 
						'<button id="modify' + item.priceId+ '" type="button" class="btn btn-outline-secondary" >수정</button>'+
					'</td>'+	
				'</tr>'
			);
			
			/* 수정버튼 누를때, 수정창 열기  */
			$('#modify'+item.priceId).on('click', function(){
				
				/* 자식창 열기 */
				window.open('salePriceModify?priceId='+item.priceId,'가격수정',
						'width=500,height=500,left=1500,top=100,bottom=300,location=no,status=no,scrollbars=yes');
			
			})	
		})
	})
} 

/* 제품검색 시 검색창 띄우기 */
$(function(){
		
	$('#productSearch').on('click', function(){
		window.open("${pageContext.request.contextPath}/master/productSearch" , '제품검색','toolbar=no,resizable=no,status=no,menubar=no,width=500, height=500, top=200,left=300');
		
	});	
	
});
/* 바이어검색 시 검색창 띄우기 */
$(function(){
		
	$('#buyerSearch').on('click', function(){
		window.open("${pageContext.request.contextPath}/master/buyerSearch" , '바이어검색','toolbar=no,resizable=no,status=no,menubar=no,width=500, height=500, top=200,left=300');
		
	})
	
});
/* 검색 => ajax 테이블 조회 */
function search(){
	$(function(){
		$('input, #selectedSearchBtn').on('keyup click input' ,function(){
			/* q, productCode, productName, buyerCode, buyerName, country, priceMin, priceMax */
			const q = $('input[name=q]').val();
			const productCode = $('input[name=productCode]').val();
			const productName = $('input[name=productName]').val();
			const buyerCode = $('input[name=buyerCode]').val();
			const buyerName = $('input[name=buyerName]').val();
			const country = $('input[name=country]').val();
			const priceMin = $('input[name=priceMin]').val();
			const priceMax = $('input[name=priceMax]').val();
			const fromDate = $('input[name=d1]').val();
			const endDate = $('input[name=d2]').val();
			
			const data = {q, productCode, productName, buyerCode, buyerName, country, priceMin, priceMax, fromDate, endDate };
			$.ajax({
<<<<<<< Updated upstream
				url : "salePriceListAjax",
=======
				url : "/valves/master/salePriceListAjax",
>>>>>>> Stashed changes
				method : "GET",
				data : (data),
				dataType : "json"
			})
			.done(function(list){
				$('#tbody').empty();
				
				$.each(list, function(idx, item){
					console.log(item);
					let number = idx + 1;
					
					$('#tbody').append(
						'<tr id="tr' +item.priceId+ '" class="listHover">' +
							'<td><input type="checkbox" name="checkbox" id="checkbox' +item.priceId+ '"></td>'+
							'<td>' +number+ '</td>'+
							'<td>' +item.productCode+ '</td>'+
							'<td>' +item.productName+ '</td>'+
							'<td>' +item.buyerCode+ '</td>'+
							'<td>' +item.country+ '</td>'+
							'<td>' +item.buyerName+ '</td>'+
							'<td>' +addComma(String(item.price))+ '</td>'+
							'<td>' +addComma(String(item.salePrice))+ '</td>'+
							'<td>' +item.discountRate+'%</td>'+
							'<td>' +item.fromDate+ '~' +item.endDate+ '</td>'+
							'<td>' + 
								'<button id="modify' + item.priceId+ '" type="button" class="btn btn-outline-secondary" >수정</button>'+
							'</td>'+	
						'</tr>'
					);
					
					/* 수정버튼 누를때, 수정창 열기, 백그라운드 주기, 체크하기  */
					$('#modify'+item.priceId).click(function(){
						/* 수정창 열기 */
						window.open('salePriceModify?priceId='+item.priceId,'가격수정',
								'width=500,height=500,left=1500,top=100,bottom=300,location=no,status=no,scrollbars=yes');
						/* 선택된 자식 수정창의 priceId == 부모 테이블 속 row priceId => addClass 와 checked 하기 . */
						/* row 백그라운드 ,체크 해제하기, */
						/* $('tr').removeClass();
						$('[name=checkbox]').prop('checked', false); 
						 */
						
						/* row 백그라운드 ,체크하기, */
						/*
						$('#checkbox'+item.priceId ).prop('checked', true);
						$('#tr'+item.priceId ).addClass("selectedRow"); 
						*/
					})	
				})
			})
		})
	})
} 

/* 필터 가격 슬라이더 */
$(function(){
	$('#min').on("input", function(){		
		let minVal = $(this).val();
		/* console.log("minVal="+minVal);	 */	
		$('input[name=priceMin]').attr('value', minVal);
		$('.progress').css('left', (minVal /100000) * 100+"%");
	})
	$('#max').on("input", function(){		
		let maxVal = $(this).val();
		$('input[name=priceMax]').attr('value', maxVal);
		/* console.log("maxVal="+maxVal); */	
		/* console.log(100 -(maxVal /100000) *100+"%"); */
		$('.progress').css('right', 100 - (maxVal /100000) * 100+"%");
	})
});
/* 필터 가격 인풋 입력하면? 슬라이더 길이 변경 */
$(function(){
	$('input[name=priceMin]').on("input", function(){		
		let minVal = $(this).val();
		$('#min').attr('value', minVal);
		$('.progress').css('left', (minVal /100000) * 100+"%");
	})
	$('input[name=priceMax]').on("input", function(){		
		let maxVal = $(this).val();
		$('#max').attr('value', maxVal);
		$('.progress').css('right', 100 - (maxVal /100000) * 100+"%");
	})
});

/* 필터 전체기간 체크 */
function checkDate(){	
	$('input[name=d1]').prop("disabled", true);
	$('input[name=d2]').prop("disabled", true);
	$('#checkedAllDate').click(function(){
		if($('#checkedAllDate').is(':checked') ){	
			$('input[name=d1]').attr('value', '');
			$('input[name=d2]').attr('value', '');		
			$('input[name=d1]').prop("disabled", true);
			$('input[name=d2]').prop("disabled", true);
		}else{
			$('input[name=d1]').removeAttr("disabled");
			$('input[name=d2]').removeAttr("disabled");
			$('input[name=d1]').attr('value', '${nowDate }')
			$('input[name=d2]').attr('value', '${addMonth }')
		}
	})
}	

/*천단위 add콤마 펑션*/
function addComma(value){
     value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value; 
}
/*천단위 remove콤마 펑션*/
function removeComma(value){
     value = value.replace(/[^\d]+/g, "");
     return value; 
}

$(function(){
	$('#resetPage').click(function(){
		location.reload();
	})
})

</script>
	
</body>
</html>