<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #deliveryCompany{
        -webkit-appearance: button;
    }
    
    .form-name{
        text-align: right;
    }
    .form-text{
        float: left;
        text-align: left;
    }
    #productType{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .col-form-label{
        font-weight: 600;
    }
    #businessNumberExist, #buyerCodeExist {
    	line-height: 10px;
    	margin-top: 10px;
    	text-align: inherit;
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
    
    #businessNumberExist:hover, #buyerCodeExist:hover {
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
    
</style>
<body>   
    <div class="insert-body mt-5 ">
    	<form id="registerForm" name ="registerfrm" action="" method="post">
	        <div class="container-md">
	            <div class="row">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">바이어 등록</h1>
	                    </div>					
	                    <hr class="line" style="border: solid 1px #000" />
	                    </div>
	                    <div class="container-sm content-size">
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputCode" class="col-form-label">바이어 코드</label>
	                            <div class="col-sm-5">
	                                <input id="buyerCode" name="buyerCode" type="text" class="form-control" placeholder="바이어코드를 입력하세요."/>
	                                <button class="btn" type="button" id="buyerCodeExist">확인</button>
	                            </div>
	                            <div id="buyerCodeText1" class="form-text">바이어코드 확인을 해주세요.</div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">바이어명</label>
	                            <div class="col-sm-5">
	                                <input id="buyerName" name="buyerName" type="text" class="form-control" placeholder="바이어명을 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputAddress" class="col-form-label">주소</label>
	                            <div class="col-sm-5">
	                                <input id="buyerAddress" name="address" type="text" class="form-control" placeholder="주소를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputCountry" class="col-form-label">국가</label>
	                            <div class="col-sm-5">
	                                <input id="buyerCountry" name="country" type="text" class="form-control" placeholder="국가를 입력하세요."/>
	                            </div>
	                        </div> 
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputBusinessNum" class="col-form-label">사업자번호</label>
	                            <div class="col-sm-5">
	                                <input id="businessNum" name="businessNumber" type="text" class="form-control" placeholder="사업자번호를 입력하세요."/>
	                                <button class="btn" type="button" id="businessNumberExist">확인</button>
	                            </div>
	                            <div id="businessNumberText1" class="form-text">사업자번호 확인을 해주세요.</div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPhone" class="col-form-label">연락처</label>
	                            <div class="col-sm-5">
	                                <input id="buyerPhone" name="phone" type="text" class="form-control" placeholder="연락처를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
								<label for="inputPhone" class="col-form-label" >선적비용부담회사</label>
	
								<div class="col-sm-5">
									<select id="deliveryCompany" name="deliveryCompany" class="form-control"
										style="padding-left: 8px;">
										<option selected>선적 비용 부담 회사를 선택하세요.</option>
										<option name ="자사" >자사</option>
										<option name ="거래처">거래처</option>
									</select>
								</div>
							</div>
	                         <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPhone" class="col-form-label">담당자</label>
	                            <div class="col-sm-5">
	                                <input id="manager" name="manager" type="text" class="form-control" placeholder="담당자를 입력하세요."/>
	                            </div>
	                        </div>                      
	                    </div>
	                <hr />
	                <div>
	                    <input id="registerBtn" class="btn registerBtn" type="submit" value="등록" onclick="registerCheck()">
	                </div>
	              
	            </div>
	        </div>
	  	</form>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
    
	    //등록버튼 누르면 등록 실행 후 창 닫기
	    function registerCheck() { 
    	document.registerfrm.submit();
        window.opener.location.reload();
    	setTimeout(function() {
    		window.close();
            }, 20);  
        }   
	    
	    const ctx = "${pageContext.request.contextPath}";
	    
	    var availableBuyerCode = false;
	    var availableBusinessNumber = false;
	    
	    function enableSubmitButton() {
	    	const button = document.querySelector("#registerBtn");
	    	if (availableBuyerCode && availableBusinessNumber) {
	    		button.removeAttribute("disabled")
	    	} else {
	    		button.setAttribute("disabled", "");
	    	}
	    }
	    
	  //BuyerCode input 변경시 submit 버튼 비활성화
	    document.querySelector("#buyerCode").addEventListener("keyup", function() {
	    	availableBuyerCode = false;
	    	enableSubmitButton();
	    });
	    
	  //BusinessNumber input 변경시 submit 버튼 비활성화
	    document.querySelector("#businessNum").addEventListener("keyup", function() {
	    	availableBusinessNumber = false;
	    	enableSubmitButton();
	    });
	  
	    //바이어코드 중복확인
	    document.querySelector("#buyerCodeExist").addEventListener("click", function() {
	    	availableBuyerCode = false;
	    	// 입력된 바이어코드를
	    	const buyerCode = document.querySelector("#buyerCode").value;
	    	
	    	// fetch 요청 보내고
	    	fetch(ctx + "/master/existbuyerCode/" + buyerCode)
	    		.then(res => res.json())
	    		.then(data => {
	    			// 응답 받아서 메세지 출력
	    			document.querySelector("#buyerCodeText1").innerText = data.message;
	    			
	    			if (data.status == "not exist") {
	    				availableBuyerCode = true;
	    				enableSubmitButton();
	    			}
	    		}); 
	    	
	    });
	  
	  //사업자번호 중복확인
	    document.querySelector("#businessNumberExist").addEventListener("click", function() {
	    	availableBusinessNumber = false;
	    	// 입력된 사업자번호을
	    	const businessNumber = document.querySelector("#businessNum").value;
	    	
	    	// fetch 요청 보내고
	    	fetch(ctx + "/master/existbusinessNum/" + businessNumber)
	    		.then(res => res.json())
	    		.then(data => {
	    			// 응답 받아서 메세지 출력
	    			document.querySelector("#businessNumberText1").innerText = data.message;
	    			
	    			if (data.status == "not exist") {
	    				availableBusinessNumber = true;
	    				enableSubmitButton();
	    			}
	    		}); 
	    	
	    });
	    
    </script>

</body>
</html>