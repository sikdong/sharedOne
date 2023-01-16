<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>

</script>
<title>Insert title here</title>
</head>
<style>
    .order-report-content{
        width: fit-content;
    }
    #printDiv{
    	width: fit-content;
    }
   table {
        width: 100%;
      }
    .n-th{
        text-align: right;
        background-color: #eeeeee;
    }
    .d-d-th{
        background-color: #d4d3d3;
        
    }
    .d-n-th{
        background-color: #eeeeee;
    }  
    table, th, td {
      border: 1px solid #acabab;
    }
    th, td {
        padding: 15px;
    }
    .detail-table{
       text-align: center;
    }
    .btn:hover{
        background-color: rgb(159, 158, 156);
    }
	@media print {
	    html, body { -webkit-print-color-adjust:exact; width: 210mm; height: 297mm; margin: 5mm 5mm 5mm 5mm; }
	    table { page-break-inside:auto; }
	    tr    { page-break-inside:avoid; page-break-after:auto; }
	    thead { display:table-header-group; }
	    tfoot { display:table-footer-group; }
	}
</style>
<body>
    <div class="container order-report-content">
        <div class="row">
            <div class="row mt-5" style="text-align: center;">     
                 <div id="rvbtn_group" style="text-align: right;">
                 	<c:url value="/order/excelConvert" var="excelLink"></c:url>
                 	<button title="프린트" type="button" class="btn" id="print" style="border: gray 2px solid; font-weight: bold; float:left; font-size:x-large; padding:0px; width: 65px;" onclick="content_print();">&nbsp&nbsp<i class='bx bx-printer'></i>&nbsp&nbsp</button>
					<form action="${excelLink }" method="get">
						<input name="orderId" value="${orderHeader.orderId }" class="form-control" type="hidden">
	                    <button title="엑셀다운" type="submit" class="btn" id="excelConverBtn" style="width: 65px; margin-left:5px; border: gray 2px solid; font-weight: bold; float:left; font-size:x-large; padding:0px;">&nbsp&nbsp<i class="fa-regular fa-file-excel"></i>&nbsp&nbsp</button>         
					</form>
                </div>
            </div>
        </div>
        <br>
        <div id="printDiv" style="width: fit-content; max-width: 960px;">
	        <div class="row">
	        	<span style="text-align: center; font-size: 30px; font-weight: bolder; margin-bottom:15px;">
	                    주문서
	                </span> 
	            <table style="border: 1px solid black; width: 100%;">
	                <tbody>
	     
	                  <tr>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">주문번호</th>
	                    <td>${orderHeader.orderCode }</td>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">기안자</th>
	                    <td>${orderHeader.writer }</td>
	                  </tr>
	                  <tr>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">기안일자</th>
	                    <td>${orderHeader.inserted }</td>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">납기요청일</th>
	                    <td>${orderHeader.deliveryDate}</td>
	                  </tr>
	               
	                </tbody>
	              </table>
	        </div>
	        <br>
	        <div class="row">
	            <table style="border: 1px solid black; width: 100%;">
	                <tbody>
	                  <tr>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">바이어</th>
	                    <td>${buyer.buyerName }</td>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">대표자</th>
	                    <td>${buyer.manager }</td>
	                  </tr>
	                  <tr>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">국가</th>
	                    <td>${buyer.country }</td>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee; ">주소</th>
	                    <td style="word-break:break-all;width: 300px;">${buyer.address }</td>
	                  </tr>
	                  <tr>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">전화번호</th>
	                    <td>${buyer.phone }</td>
	                    <th class="n-th" style="text-align: right; background-color: #eeeeee;">사업자번호</th>
	                    <td>${buyer.businessNumber }</td>
	                  </tr>
	                </tbody>
	              </table>
	        </div>
	        <br>
	        <div class="row">
	            <span style="float: left; font-size: large; font-weight: bold;">상세정보</span>
	            <table class="detail-table" style="border: 1px solid black; width: 100%;">
	                <thead>
	                  <tr>
	                    <th class="d-d-th" style="background-color: #d4d3d3;">번호</th>
	                    <th colspan="3" class="d-d-th" style="background-color: #d4d3d3;">제품정보</th>
	                    <th colspan="3" class="d-d-th" style="background-color: #d4d3d3;">금액정보</th>
	                    
	                  </tr>
	                  <tr>
	                    <th class="d-n-th" style="background-color: #eeeeee;">#</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">제품명</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">규격</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">단위</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">판매가</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">수량</th>
	                    <th class="d-n-th" style="background-color: #eeeeee;">합계액</th>
	                  </tr>  
	                </thead>
	                <tbody id="tbody">
	                  <c:forEach items="${orderItem}" var="item">
	                  	<c:set var="i" value="${i+1 }"/>
		                  <tr>
		                    <th>${i}</th>
		                    <td>${item.productName }</td>
		                    <td>${item.size }</td>
		                    <td>${item.unit }</td>
		                    <td class="finalPrice"><fmt:formatNumber value="${item.finalPrice}" type="currency" currencySymbol="￦"/></td>	              
		                    <td class="quantity">${item.quantity }</td>
		                    <td class="sum"><fmt:formatNumber value="${item.sum }" type="currency" currencySymbol="￦"/></td>
		                  </tr>	               
	                  </c:forEach>               
	     			
	                  <tr>
	                    <th class="d-n-th "  colspan="4" style="background-color: #eeeeee;">총합</th>
	                    <td id="price_sum"><fmt:formatNumber value="${sumValue.priceSum }" type="currency" currencySymbol="￦"/></td>
	                    <td id="quantity_sum">${sumValue.quantitySum }</td>
	                    <td id="sum_sum"><fmt:formatNumber value="${sumValue.sumTotal }" type="currency" currencySymbol="￦"/></td>
	                  </tr>                  
	                </tbody>
	              </table>
	        </div>
        </div>
        <br>
        <div class="row mb-5">
	        <span style="float: left; font-size: large; font-weight: bold;">특이사항</span>
	        <table>
	        	<tfoot>
	        		<tr>
	                	<td>${orderHeader.message }</td>
	                </tr>
	        	</tfoot>
	        </table>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
/* 엑셀 파일로 다운로드 */
$(document).ready(function(){
	$("#excelConverBtn").on('click',function(){
		location.href="/order/excelConvert/${orderHeader.orderId}";
	});
});
/* 프린터 출력 */
function content_print(){
    
    var initBody = document.body.innerHTML;
    window.onbeforeprint = function(){
        document.body.innerHTML = document.getElementById('printDiv').innerHTML;
    }
    window.onafterprint = function(){
        document.body.innerHTML = initBody;
    }
    window.print();    
}           
</script>
</body>
</html>