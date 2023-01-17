<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 
</head>
<style>
    .container{
        width: 200px;
        height: 300px;
        display: contents;
    }
    .insert-body {
        max-width: 700px;
    }
    .buyer-insert-header{
        width: 100%;
        height: 100%;
        text-align: center;
        margin-bottom: 30px;
        margin-top: 30px;
    }
    .form-name{
        text-align: right;
    }
    .form-text{
        float: left;
        text-align: left;
    }
    #buyerName{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .col-form-label{
        font-weight: 600;
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
 	.selectedRow{
		background-color: #D3D3D3;
	}
</style>
<body>   
  <div class="insert-body mt-5 ">
     <div class="container-md">
       <form id="form" action="">
           <div class="row">
               <div class="col mt-1">
                   <div class="mb-4">
                       <h1 style="font-size: 24px; font-weight:600">판매가 수정</h1>
                   </div>					
                   <hr class="line" style="border: solid 1px #000" />
                  </div>
                   
                  <div class="container-sm content-size">
                		<input name="priceId" type="hidden" class="form-control" value="${sale.priceId }" disabled/>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">제품 코드</label>
                          <div class="col-sm-5">
                              <input name="productCode" type="text" class="form-control" value="${sale.productCode }" disabled/>
                          </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">바이어 코드</label>
                          <div class="col-sm-5">
                              <input name="buyerCode" type="text" class="form-control" value="${sale.buyerCode }" disabled/>                          
                          </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">단가</label>
                        <div class="col-sm-5">
			    			<input id="price" value="${sale.price }" type="text" class="form-control" placeholder="단가" readonly disabled>					     
                        </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">판매가</label>
                          <div class="col-sm-5">
                              <input name="salePrice" value="${sale.salePrice }" type="number" class="form-control" placeholder="판매가격을 입력하세요."/>
                          </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">할인율</label>
                          <div class="col-sm-5">
                              <input name="discountRate" value="${sale.discountRate }%" class="form-control" placeholder="%" readonly/>
                          </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">판매가 시작일</label>
                          <div class="col-sm-5">
                              <input id="d1" name="fromDate" value="${sale.fromDate }" type="date" class="form-control"/>
                          </div>
                      </div>
                      <div class="mb-2 row mt-2 rowdiv">
                          <label for="" class="col-3 col-form-label">판매가 종료일</label>
                          <div class="col-sm-5">
                              <input id="d2" name="endDate" value="${sale.endDate }" type="date" class="form-control"/>
                          </div>
                      </div>                                
                  </div>
          	 </div>
		</form>
                  
		<hr/>
	    <div class="d-flex">
		    <div class="col-9">
		    </div>
	        <button id="modifyBtn" class="btn primaryBtn" > 수정 </button>
	    
		    <form action="${pageContext.request.contextPath }/master/salePriceDelete" method="post">
			    <input type="hidden" name="priceId" value="${sale.priceId }" disabled>
			    <button id="deleteBtn" class="btn btn-outline-secondary"> 삭제 </button>
		    </form>  
		</div>
		<div class="d-flex">
			<div id="message"></div>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
const ctx = "${pageComtext.request.contextPath}";

dateCheck();


/* 저장된 인풋값을 => 부모창에 검색 시키기  */
 $(function(){
	const buyerCode = $('input[name=buyerCode]').val();
	const productCode = $('input[name=productCode]').val();
	
	$("#b1", parent.opener.document).val(buyerCode);
	$("#p1", parent.opener.document).val(productCode);
	$(opener.document).find("#selectedSearchBtn").click();		
	
})

/* 자동으로 할인율 넣기  */
$('input[name=salePrice]').keyup(function(){
	let sp = $('input[name=salePrice]').val();
	let pr = $('#price').val();
	/* console.log(pr); */
	/* console.log(sp); */
	
	/* Math.round() 소수점 반올림하고, toFixed(0) 소숫점 제거  */
	var dc = (1 - ( sp / pr )) * 100; 	
	dc = parseFloat(dc).toFixed(0);
	dc = Math.round(dc);
	/* console.log(dc); */
	$('input[name=discountRate]').attr('value', dc+"%");
})

/* 판매가 기간 중복체크 */
function dateCheck(){
	$('input[type=date]').on('input', function(){
		const productCode = $('input[name=productCode]').val();
		const buyerCode = $('input[name=buyerCode]').val();	
		const data = {buyerCode, productCode};
		console.log(productCode);
		/* 날짜 가져와서. 중복 체크하기   */
		$.ajax({	
			url:"/master/salePriceModifyAjax",
			method: "GET",
			data: (data),
			dataType: "json"
		})
		.done(function(dateList){
			if (dateList != '') {		
				$.each(dateList, function(idx, item){
					console.log(item);
					let fromDate = item.fromDate;
					let endDate = item.endDate;			
					
					$('#modifyBtn').attr('disabled', false);
					let d1 = $('#d1').val();
					let d2 = $('#d2').val();
					if ( (d1 < d2 && d2 < fromDate) || (endDate < d1 && d1 < d2) /*  || (fromDate < d1 && d2 < endDate) */ ) {
						$('#message').css('color', 'green').text("수정 가능합니다.");
					} else{
						$('#modifyBtn').attr('disabled', true);
						$('#message').css('color', 'red').text("해당 제품의 판매가 기간이 중복됩니다.");
					}		
				})
			}	
		})	
	});
} 

/* 수정 confirm  -> 수정하기 */
$(function() {
    $("#modifyBtn").click( function() {	
    	/* 인풋 빈칸 알림창 */
    	if( $('input[name=salePrice]').val() == ''){
    		alert("판매가를 입력하세요.");
    		return false;
    	}
   	  	if( $('input[name=d1]').val() == ''){
    		alert("판매가 시작일을 입력하세요.");
    		return false;
    	}
   	  	if( $('input[name=d2]').val() == ''){
    		alert("판매가 종료일을 입력하세요.");
    		return false;
    	} 
    	if( confirm("수정하시겠습니까?") ){ 
    		
	   		const priceId = $('input[name=priceId]').val();
			const productCode = $('input[name=productCode]').val();
			const buyerCode = $('input[name=buyerCode]').val();
			const salePrice = $('input[name=salePrice]').val();
			const discountRate = $('input[name=discountRate]').val().slice(0, -1);
			const fromDate = $('input[name=fromDate]').val();
			const endDate = $('input[name=endDate]').val();
	
			const data = { priceId, productCode, buyerCode, salePrice, discountRate, fromDate, endDate };
				
	    	$.ajax({
	    		url : "/master/salePriceModify",
	    		method : "POST",
	    		data : (data),
	    		dataType : "json",
	    		success : function(){
	    			
	    			$("#b1", parent.opener.document).val(buyerCode);
	    			$("#p1", parent.opener.document).val(productCode);
	    			$(opener.document).find("#selectedSearchBtn").click();	
	   			
	    		}
	    	})    	
	   	
    	}else{
    		alert("가격이 수정되지 않았습니다. ");
    		return false;
    	};	 
    });
});

	
	
        
</script>

</body>
</html>