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
</style>
<body>   
    <div class="insert-body mt-5 ">
        <div class="container-md">
	        <form id="modifyForm" action="" method="post">
	            <div class="row">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">판매가격 수정</h1>
	                    </div>					
	                    <hr class="line" style="border: solid 1px #000" />
                    </div>
	                    
                    <div class="container-sm content-size">
                  
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputCode" class="col-3 col-form-label">제품 코드</label>
                            <div class="col-sm-5">
                                <input id="productCode" type="text" class="form-control" value="${sale.productCode }" disabled/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputBuyerName" class="col-3 col-form-label">바이어 코드</label>
                            <div class="col-sm-5">
                                <input id="buyerCode" type="text" class="form-control" value="${sale.buyerCode }" disabled/>                          
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputSalePrice" class="col-3 col-form-label">판매가격</label>
                            <div class="col-sm-5">
                                <input name="salePrice"  value="${sale.salePrice }" id="salePrice" type="number" class="form-control" placeholder="판매가격을 입력하세요."/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceDiscount" class="col-3 col-form-label">할인율</label>
                            <div class="col-sm-5">
                                <input name="discountRate"  value="${sale.discountRate }" id="priceDiscount" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  class="form-control" placeholder="할인율을 입력하세요."/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceStartDate" class="col-3 col-form-label">시작일</label>
                            <div class="col-sm-5">
                                <input name="fromDate"  value="${sale.fromDate }" id="priceStartDate" type="date" class="form-control"/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceEndDate" class="col-3 col-form-label">종료일</label>
                            <div class="col-sm-5">
                                <input name="endDate"  value="${sale.endDate }" id="priceEndDate" type="date" class="form-control"/>
                            </div>
                        </div>                                
                    </div>
            	</div>
			</form>
                    
            <hr/>
                
            <div>
            	<input type="hidden" name="priceId" value="${sale.priceId }" disabled>
                <button id="modifyBtn" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 수정 </button>
            </div>
             
            <form action="${pageContext.request.contextPath }/master/salePriceDelete" method="post">
            	<input type="hidden" name="priceId" value="${sale.priceId }" disabled>
	            <button id="deleteBtn" class="btn"> 삭제 </button>
            </form>    
        </div>
    </div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        수정하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="modifySubmitBtn" type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		const ctx = ${pageComtext.request.contextPath}
		$(function(){
			$("#modifySubmitBtn").click(function(){
				$("#modifyForm").submit();
				$(location).attr('href', '${ctx}/master/salePriceList')
			});
		});
	

        function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        } 
        
        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }
        
        function inputOnlyNumberFormat(obj) {
            obj.value = onlynumber(uncomma(obj.value));
        }
        
        function onlynumber(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
        }
         
    </script>

</body>
</html>