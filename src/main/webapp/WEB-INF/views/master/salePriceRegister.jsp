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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Insert title here</title>
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
</style>
<body>
<!-- 현재 날짜 설정  -->
<c:set value="<%=sf.format(nowDate)%>" var="nowDate"/>
<!-- ${nowDate}  -->

<!-- 한달후 날짜 설정 -->
<c:set value='<%=sf.format(addMonth)%>' var="addMonth" /> 
<!-- ${addMonth}  -->   
<div class="insert-body mt-5 ">
   <div class="container-md">
   
      <form id="form">
         <div class="row">
             <div class="col mt-1">
                <div class="mb-4">
                    <h1 style="font-size: 24px; font-weight:600">판매가 등록</h1>
                </div>					
                <hr class="line" style="border: solid 1px #000" />
                </div>
                
                
         <!--   priceId, salePrice, discountRate, 
                fromDate, endDate, buyerCode, 
                buyerName, country, product, 
                productCode, productName, price -->
                <div class="container-sm content-size">
                	<div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">바이어 코드</label>
                        <div class="col-sm-5 ">
     						<div class="input-group">
							    <input name="buyerCode" type="text" id="parentInput1B" class="form-control"  placeholder="바이어코드를 입력하세요.">
							    <button id="buyerSearch" class="btn btn-outline-secondary" type="button">검색</button>
     						</div>
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">제품 코드</label>
                        <div class="col-sm-5">
                        	<div class="input-group">
                           		<input id="parentInput" name="productCode" value="${p.productCode }" type="text" class="form-control" placeholder="제품코드를 입력하세요."/>
                                <button id="productSearch" class="btn btn-outline-secondary" type="button">검색</button>
     						</div>
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">단가</label>
                        <div class="col-sm-5">
			    			<input id="price" value="" type="text" class="form-control" placeholder="단가" readonly >					     
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">판매가</label>
                        <div class="col-sm-5">
                            <input name="salePrice" value="" id="salePrice" type="text" class="form-control" placeholder="판매가를 입력하세요."/>
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label" >할인율</label>
                        <div class="col-sm-5">
                            <input name="discountRate" value="" id="" type="text" class="form-control" placeholder="%" readonly />
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">판매 시작일</label>
                        <div class="col-sm-5">
                            <input name="fromDate" value="${nowDate }" id="d1" type="date" class="form-control"/>
                        </div>
                    </div>
                    <div class="mb-2 row mt-2 rowdiv">
                        <label for="" class="col-3 col-form-label">판매 종료일</label>
                        <div class="col-sm-5">
                            <input name="endDate" value=""             id="d2" type="date" class="form-control"/>
                        </div>
                    </div>                        
                </div>
            <hr/>        
         </div>
     </form>
     
     <div class="d-flex">
     	 <div class="col-10"></div>
         <button id="registerBtn" class="btn primaryBtn" type="button" > 등록 </button>
     </div>
     <div class="d-flex">
     	<div id="message"></div>
     </div>
      
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
const ctx = "${pageContext.request.contextPath}";
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

/* 인풋값 입력하면, 부모창에 검색 시키기  */
$(function(){
	$('input[name=buyerCode], input[name=productCode]').on('input', function(){
		const buyerCode = $('input[name=buyerCode]').val();
		const productCode = $('input[name=productCode]').val();
		
		$("#parentInput1B", parent.opener.document).val(buyerCode);
		$("#parentInput1P", parent.opener.document).val(productCode);
		$(opener.document).find("#selectedSearchBtn").click();		
	})
});
/* 저장하기  */
$(function() {
		
    $("#registerBtn").click( function() {			
		const buyerCode = $('input[name=buyerCode]').val();
		const productCode = $('input[name=productCode]').val();
		const price = $('input[name=price]').val();		
		
		/* 와... 콤마제거 -> 스트링 -> int 형변환  */
		const stringSalePrice = $('input[name=salePrice]').val();
		const salePrice = parseInt(stringSalePrice.replace(',', ''), 10 ); 
		
		const discountRate = $('input[name=discountRate]').val().slice(0, -1);
		const fromDate = $('input[name=fromDate]').val();
		const endDate = $('input[name=endDate]').val();

		const data = { buyerCode, productCode, price, salePrice, discountRate, fromDate, endDate };
		
		$.ajax({
    		url : '${ctx}'+"/master/salePriceRegister",
    		method : "POST",
    		data : (data),
    		dataType : "json",
    		success : function(){
    			alert("등록 되었습니다.");
    			/* 부모창 */
    	   		$("#parentInput1B", parent.opener.document).val(buyerCode);
    			$("#parentInput1P", parent.opener.document).val(productCode);
    			$(opener.document).find("#selectedSearchBtn").click();
    			self.close();
    		}
    	})	
    	
    });
	
})

/* 자동으로 단가 넣기  */
$(function(){
	$('input[name=productCode]').on('change keyup paste input click',function(){
		
		
		<c:forEach items="${productList}" var="p">
			if( $('input[name=productCode]').val() !='' && $('input[name=productCode]').val() == '${p.productCode}' ){
					$.ajax({
						url : '${ctx}'+"/master/getPrice",
						method : "GET",
						data : {productCode : $('input[name=productCode]').val() },
						dataType : "json",
						success : function(price){
							
							price = addComma(String(price));
							$('#price').attr('value', price);
						}
					})		
			}
		</c:forEach>
	})
})
/* 판매가 입력시 콤마(int->String 형변환으로 ) */
$(function(){	 
	$('input[name=salePrice]').on('keyup', function(){
		
		$(this).val(function(index, value) {
		    return value
		    .replace(/\D/g, "")
		    .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		    ;
		});
	});
 })
/* 자동으로 할인율 넣기  */
$('input[name=salePrice]').keyup(function(){
	let sp = $('input[name=salePrice]').val().replace(/\D/g, "");
	let pr = $('#price').val().replace(/\D/g, "");
	
	/* console.log(pr); */
	/* console.log(sp); */
	
	/* Math.round() 소수점 반올림하고, toFixed(0) 소숫점 제거  */
	var dc = (1 - ( sp / pr )) * 100; 	
	dc = parseFloat(dc).toFixed(0);
	Math.round(dc);
	/* console.log(dc); */
	$('input[name=discountRate]').attr('value', dc+"%");
})

/* trim 해서 자동으로 앞뒤 빈칸제거후 등록하도록.  */
$(function(){
	$('input[name=buyerCode]').keyup(function(){
		const buyerCode = $.trim( $('input[name=buyerCode]').val() );		
		/* console.log(buyerCode); */
		
	});
	$('input[name=productCode]').keyup(function(){
		const productCode = $.trim( $('input[name=productCode]').val() );
		const buyerCode = $('input[name=buyerCode]').val();	
		const data = {buyerCode, productCode};
		/* 바이어선택후 제품중복 등록 할때, 날짜 가져와서. 중복 체크하기   */
		$.ajax({	
			url:'${ctx}'+"/master/salePriceRegisterAjax",
			method: "GET",
			data: (data),
			dataType: "json"
		})
		.done(function(dateList){
			if (dateList != '') {		
				$.each(dateList, function(idx, item){
					let fromDate = item.fromDate;
					let endDate = item.endDate;			
					$('input[type=date]').on('input', function(){
						$('#registerBtn').attr('disabled', false);
						let d1 = $('#d1').val();
						let d2 = $('#d2').val();
						if ( (d1 < d2 && d2 < fromDate) || (endDate < d1 && d1 < d2) ) {
							$('#message').css('color', 'green').text("해당 제품의 판매가를 등록할 수 있습니다.");
							return true;
						} else{
							$('#registerBtn').attr('disabled', true);
							$('#message').css('color', 'red').text("해당 제품의 판매가 기간이 중복됩니다.");
							return false;
						}
					})
				})
			}
		})
	});
	$('input[name=salePrice]').keyup(function(){
		const salePrice = $.trim( $('input[name=salePrice]').val() );		
	});
	
	
})


/* input 알림창 */
$(function(){
	$('#registerBtn').click(function(){
		if( $('input[name=buyerCode]').val() =='' ){
			$('#from').submit(function(e){
				e.preventDefault();
			})
			alert("바이어코드를 입력하세요.");
			return false;
		}
		if($('input[name=productCode]').val() =='' ){
			$('#from').submit(function(e){
				e.preventDefault();
			})
			alert("제품코드를 입력하세요.");
			return false;
		}
		if($('input[name=salePrice]').val() =='' ){
			$('#from').submit(function(e){
				e.preventDefault();
			})
			alert("판매가를 입력하세요.");
			return false;
		}
		if($('input[name=fromDate]').val() =='' ){
			$('#from').submit(function(e){
				e.preventDefault();
			})
			alert("판매 시작일을 입력하세요.");
			return false;
		}
		if($('input[name=endDate]').val() =='' ){
			$('#from').submit(function(e){
				e.preventDefault();
			})
			alert("판매 종료일을 입력하세요.");
			return false;
		}
		
	})
})

/*천단위 add콤마 펑션*/
function addComma(value){
     value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value; 
}


/*천단위 remove콤마 펑션*/
 /* 
function removeComma(value){
     value = value.replace(/\D/g, ""); 
     return value; 
}
 */


    
</script>

</body>
</html>