<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>    
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
    #productType, #productWeight{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .inputDiv{
	    position: absolute;
	    right: 20px;
    }
    .col-form-label{
        font-weight: 600;
    }
    .check {
    	margin-bottom: 15px;
    }
    
    #productNameExist, #productCodeExist {
        position: absolute;
    	left: 307px;
    	line-height: 10px;
    	margin-top: 10px;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border-radius: 5px; 
	    background-color: white !important;
 		border-color: #1d5c83 !important;
 		color: #1d5c83 !important;
    }
    
    #productNameExist:hover, #productCodeExist:hover {
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
    
    .registerBtn {
    	line-height: 10px;
    	float: right !important; 
	    text-align: center !important;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border: none; 
	    border-radius: 5px; 
	    background: #1d5c83;
	    margin-bottom: 25px;
    }
    
    #productName, #productCode {
    	background-color: #F0F0F0;
    }
    #checkProductCode {
    	visibility: hidden;
    }
    
</style>
<body>

<sec:authorize access="isAuthenticated()">   
    <div class="insert-body mt-5 ">
    	<form id ="registerfrm" action="" name= "registerfrm" method="post">
	        <div class="container-md">
	            <div class="row">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">제품 등록</h1>
	                    </div>					
	                    <hr class="line" style="border: solid 1px #000" />
	                    </div>
	                    <div class="container-sm content-size">
	                    	
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">제품명</label>
	                            <div class="col-sm-7 inputDiv inputDiv">
	                                <input id="productName" name="productName"  type="text" class="form-control" placeholder="규격, 무게, 제품 타입 선택"  readOnly/>
	                            </div>
	                            <div class="check">
		                            <div id="productNameText1" class="form-text">제품명 확인을 해주세요.</div>
		                                <button class="btn" type="button" id="productNameExist">확인</button>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">규격(Inch)</label>
	                            <div class="col-sm-7 inputDiv">
	                                <input id="productSize" name="size" type="text" class="form-control" placeholder="규격을 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">무게(lb)</label>
	                            <div class="col-sm-7 inputDiv">
	                            	<select id="productWeight" name="weight" class="form-control" style="padding-left: 8px;" >
	                                      <option selected>제품 무게를 선택 하세요.</option>
	                                      <option name="150" value = "150">150 파운드</option>
	                                      <option name="300" value = "300">300 파운드</option>
	                                      <option name="600" value = "600">600 파운드</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputProductType" class="col-form-label">제품 종류</label>
	                            <div class="col-sm-7 inputDiv inputDiv">
	                                    <select id="productType" name="productType" class="form-control" style="padding-left: 8px;" >
	                                      <option selected>제품 종류를 선택 하세요.</option>
	                                      <option name="GATE 밸브" value = "GATE 밸브" ${param.productType == 'GATE 밸브' ? 'selected' : '' }>GATE 밸브</option>
	                                      <option name="GLOBE 밸브" value = "GLOBE 밸브" ${param.productType == 'GLOBE 밸브' ? 'selected' : '' }>GLOBE 밸브</option>
	                                      <option name="SWING 밸브" value = "SWING 밸브" ${param.productType == 'SWING 밸브' ? 'selected' : '' }>SWING 밸브</option>
	                                      <option name="LUG 밸브" value = "LUG 밸브" ${param.productType == 'LUG 밸브' ? 'selected' : '' }>LUG 밸브</option>
	                                      <option name="WAFER 밸브" value = "WAFER 밸브" ${param.productType == 'WAFER 밸브' ? 'selected' : '' }>WAFER 밸브</option>
	                                    </select>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputCode" class="col-form-label">제품 코드</label>
	                            <div class="col-sm-7 inputDiv inputDiv">
	                                <input id="productCode" name="productCode" type="text" class="form-control" placeholder="제품명 확인이 필요합니다"  readOnly/>
	                            </div>
								<div id ="checkProductCode" class="check">
									<div id="productCodeText1" class="form-text">제품코드 확인을 해주세요.</div>
									<button class="btn" type="button" id="productCodeExist">확인</button>
								</div>
							</div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">단위</label>
	                            <div class="col-sm-7 inputDiv">
	                                <input id="productUnit" name="unit" type="text" class="form-control" placeholder="제품단위를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputProductPrice" class="col-form-label">단가</label>
	                            <div class="col-sm-7 inputDiv">
	                                <input id="productPrice" name="price" onkeyup="inputNumberFormat(this);" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" class="form-control" placeholder="단가를 입력하세요."/>
	                            </div>
		                        </div>
	
<!-- 							<div class="mb-2 row mt-2 rowdiv">
								<label for="inputPriceStartDate" class="col-form-label">단가 시작일</label>
								<div class="col-sm-7 inputDiv">
									<input id="productStartDate" name ="fromDate" type="date" class="form-control" />
								</div>
							</div>
							<div class="mb-2 row mt-2 rowdiv">
								<label for="inputPriceEndDate" class="col-form-label">단가 종료일</label>
								<div class="col-sm-7 inputDiv">
									<input id="productEndDate" name ="endDate" type="date" class="form-control" />
								</div>
							</div> -->
	
							<div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">제품 설명</label>
	                            <div class="col-sm-7 inputDiv">
	                                <input id="productContent" name="content" type="text" class="form-control" placeholder="제품설명을 입력하세요."/>
	                            </div>
	                        </div>                   
	                    </div>
	                <hr />
	                <div>
	                    <input id="registerBtn" class="btn registerBtn" value="등록" onclick="registerCheck()" disabled>
	                </div>
	              
	            </div>
	        </div>
    	</form>
      </div>
</sec:authorize>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>

    
    //제품명 지정
    var productSize = '';
    var productWeight = '';
    var productType = '';
    
	var productName =  $("#productName").val(productSize + productWeight + productType);
	
     $( "#productSize" ).keyup(function(){
    	 productSize = $("#productSize").val();
    	 $("#productName").val(productSize + productWeight + productType);
     });
     
     $( "#productWeight" ).change(function(){
    	 if($("#productWeight").val() == "150") {
    		 productWeight = '-150';
    	 }else if($("#productWeight").val() == "300") {
    		 productWeight= '-300'; 
    	 }else if($("#productWeight").val() == "600") {
    		 productWeight = '-600';
    	 }else {
    		 productWeight = '';
    	 }
    	 $("#productName").val(productSize + productWeight + productType);
     });
    
     $( "#productType" ).change(function(){
    
    	 if($("#productType").val() == "GATE 밸브") {
    		 productType = ' GATE RF';
    	 }else if($("#productType").val() == "GLOBE 밸브") {
    		 productType = ' GLOBE RF'; 
    	 }else if($("#productType").val() == "SWING 밸브") {
    		 productType = ' SCHECK RF';
    	 }else if($("#productType").val() == "LUG 밸브") {
    		 productType = ' TAPPED LUG';
    	 }else if($("#productType").val() == "WAFER 밸브") {
    		 productType = ' WAFER CHECK';
    	 }else {
    		 productType = ' ';
    	 }
    	 $("#productName").val(productSize + productWeight + productType);
    });
  
  //단가 콤마 붙이기
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
    
  //등록버튼 누르면 등록 실행 후 창 닫기
    const ctx = "${pageContext.request.contextPath}";
    
    var availableProductCode = false;
    
    var availableProductName = false;
     
    
    function enableSubmitButton() {
    	const button = document.querySelector("#registerBtn");
    	if (availableProductName) {
    		button.removeAttribute("disabled")
    	} else {
    		button.setAttribute("disabled", "");
    	}
    }
    
  //ProductName input 변경시 submit 버튼 비활성화
    document.querySelector("#productName").addEventListener("keyup", function() {
    	availableProductName = false;
    	enableSubmitButton();
    });
  

    //제품명 중복확인
    document.querySelector("#productNameExist").addEventListener("click", function() {
    	availableProductName = false;
    	// 입력된 제품명
    	const productName = document.querySelector("#productName").value;
    	// 제품타입
    	const productType =  document.querySelector("#productType").value.substring(0,2);
    	console.log(productType);
    	
    	// fetch 요청 보내고
    	fetch(ctx + "/master/existproductName/" + productName +"/"+productType)
    		.then(res => res.json())
    		.then(data => {
    			// 응답 받아서 메세지 출력
    			document.querySelector("#productNameText1").innerText = data.message;
    			
    			//제품명 사용가능하면
    			if (data.status == "not exist") {
    				availableProductName = true;
    				
   			     //제품코드 지정 (2자리까지)
   			    	 if(productType != '제품 종류를 선택 하세요.') {
   			    		document.querySelector("#productCode").value = productType +data.lastProductCodeNum ;
   			            /*  $("#productCode").val(productType +data.lastProductCodeNum); */
   			             document.querySelector("#checkProductCode").style.visibility = 'visible';
   			             
   			             //규격, 무게, 제품 종류 수정 readonly
   			             document.querySelector("#productSize").readOnly = true;
   			             document.querySelector("#productSize").style.backgroundColor = "#F0F0F0";
   			          	 document.querySelector("#productWeight").style.removeProperty("-webkit-appearance");
/*    			             document.querySelector("#productWeight").onFocus = this.initialSelect = this.selectedIndex;
   			             document.querySelector("#productWeight").onChange = this.selectedIndex = this.initialSelect; */
   			         	 document.querySelector("#productWeight").style.backgroundColor = "#F0F0F0";
   			          document.querySelector("#productType").style.removeProperty("-webkit-appearance");
   			          	 document.querySelector("#productType").style.backgroundColor = "#F0F0F0";
   			             
    			    }else {
    			    		 $("#productCode").val('');
    				}
    			}
    		}); 
    	
    });
    
    //제품코드 중복확인
    document.querySelector("#productCodeExist").addEventListener("click", function() {
    	availableProductCode = false;
    	// 입력된 제품코드를
    	const productCode = document.querySelector("#productCode").value;
    	// fetch 요청 보내고
    	fetch(ctx + "/master/existproductCode/" + productCode )
    		.then(res => res.json())
    		.then(data => {
    			// 응답 받아서 메세지 출력
    			document.querySelector("#productCodeText1").innerText = data.message;
    			
    			if (data.status == "not exist") {
    				availableProductCode = true;
    				enableSubmitButton();
    			}
    		}); 
    	
    });
    
    //등록
    function registerCheck() {
    	//단가 콤마 제거
		var price = document.querySelector("#productPrice").value;
    	var registerdPrice = price.split(',').join("");
    	console.log(registerdPrice);

    	document.querySelector("#productPrice").value = registerdPrice;

		document.registerfrm.submit();
		window.opener.location.reload();
 		setTimeout(function() {
			window.close();
		       }, 50);
    } 
    
    //Input 알림창
    $(function(){
	$('#registerBtn').click(function(){
		if($('input[name=productName]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("제품명이 입력되어야 합니다");
		}
		else if($('input[name=productCode]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("제품코드가 입력되어야 합니다");
		}
		else if($('input[name=price]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("단가를 입력하세요.");
		}
		else if($('input[name=size]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("규격을 입력하세요.");
		}
		else if($('input[name=weight]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("무게를 선택 하세요.");
		}
		else if($('input[name=unit]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("단위를 입력하세요.");
		}
		else if($('input[name=productType]').val() =='' ){
			$('#registerfrm').submit(function(e){
				e.preventDefault();
			})
			alert("제품종류를 선택 하세요.");
		}
	})
})
    
    </script>

</body>
</html>