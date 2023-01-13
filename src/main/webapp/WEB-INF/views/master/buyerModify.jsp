<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<title>바이어 수정</title>
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
    #deliveryCompany{
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
        text-align: left;
    }
    
    .btnBox {
    	position: relative;
    	margin-bottom: 25px;
    }
    
    .btnBox1 {
    	position:relative;
    }
    
    #buyerCodeExist, #businessNumberExist {
    	margin-left: 50px;
    
    }

    #businessNumberExist {
    	margin-top: 10px;
    	line-height: 10px;
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
    
    #businessNumberExist:hover {
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
 	
 	#modifyForm {
 		position: relative;
 	}
    
    #modifyBtn {
    	display : inline-block !important;
    	line-height: 10px;
		text-align : center !important;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border: none; 
	    border-radius: 5px; 
	    background: #1d5c83;
	    position: absolute;
	    top: 508px;
	    right: 75px;
    }
    
    
    #removeBtn {
	    float: right; 
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border: none; 
	    border-radius: 5px; 
	    background: #1d5c83; 
	    margin-bottom: 20px; 
	    margin-right: 15px;
    }
    
</style>
<body>
	<div class="insert-body mt-5 ">
		<div class="container-md">
			<form id="modifyForm" name="modifyfrm" action="" method="post">
			<input type="hidden" name="buyerCode" value="${buyer.buyerCode}"> 
				<div class="row">
					<div class="col mt-1">
						<div class="mb-4">
							<h1 style="font-size: 24px; font-weight: 600">바이어 수정</h1>
						</div>
						<hr class="line" style="border: solid 1px #000" />
					</div>
					<div class="container-sm content-size">
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputCode" class="col-form-label">바이어 코드</label>
							<div class="col-sm-7 inputDiv">
								<input id="buyerCode" type="text" class="form-control" name ="buyerCode" value="${buyer.buyerCode }"
									placeholder="${buyer.buyerCode }" disabled />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label">바이어명</label>
							<div class="col-sm-7 inputDiv">
								<input id="buyerName" type="text" class="form-control" name ="buyerName" value="${buyer.buyerName }"
									placeholder="${buyer.buyerName }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputAddress" class="col-form-label">주소</label>
							<div class="col-sm-7 inputDiv">
								<input id="buyerAddress" type="text" class="form-control" name ="address" value="${buyer.address }"
									placeholder="${buyer.address }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputCountry" class="col-form-label">국가</label>
							<div class="col-sm-7 inputDiv">
								<input id="buyerCountry" type="text" class="form-control" name ="country"  value="${buyer.country }"
									placeholder="${buyer.country }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputBusinessNum" class="col-form-label">사업자번호</label>
							<div class="col-sm-7 inputDiv">
								<input id="businessNum" type="text" class="form-control" name ="businessNumber"  value="${buyer.businessNumber }"
									placeholder="${buyer.businessNumber }" />
							</div>
							<div class="check">
								<div id="businessNumberText1" class="form-text">사업자번호 확인을 해주세요.</div>
									<button class="btn" type="button" id="businessNumberExist">확인</button>
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputPhone" class="col-form-label">연락처</label>
							<div class="col-sm-7 inputDiv">
								<input id="buyerPhone" type="text" class="form-control" name ="phone"  value="${buyer.phone }"
									placeholder="${buyer.phone }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputdeliveryCompany" class="col-form-label" >선적비용부담회사</label>

							<div class="col-sm-7 inputDiv">
								<select id="deliveryCompany" name="deliveryCompany" class="form-control"
									style="padding-left: 8px;">
									<option selected>${buyer.deliveryCompany }</option>
									<option name ="자사" >자사</option>
									<option name ="거래처">거래처</option>
								</select>
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputManager" class="col-form-label" >담당자</label> 
							<div class="col-sm-7 inputDiv">
								<input id="manager" type="text" class="form-control" name ="manager" value="${buyer.manager }"
									placeholder="${buyer.manager }" />
							</div>
						</div>
					</div>
					<hr />

					<!-- 수정버튼 -->
					<input id="modifyBtn" class="btn" type="submit" value="수정" onclick="modifyCheck()">
				</div>
			</form>
		</div>
			<form id="removeForm" name="removefrm" action="/master/buyerRemove" method="post">
				<input type="hidden" name="code" value="${buyer.buyerCode}">
		    <input id="removeBtn" class="btn" type="submit" value="삭제" onclick="removeCheck()">
			</form>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
    const ctx = "${pageContext.request.contextPath}";
    
    var availableBusinessNumber = false;
    
    function enableSubmitButton() {
    	const button = document.querySelector("#modifyBtn");
    	if (availableBusinessNumber) {
    		button.removeAttribute("disabled")
    	} else {
    		button.setAttribute("disabled", "");
    	}
    }
    
  //BusinessNumber input 변경시 submit 버튼 비활성화
    document.querySelector("#businessNum").addEventListener("keyup", function() {
    	availableBusinessNumber = false;
    	enableSubmitButton();
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
  
    //삭제확인 버튼 클릭하면 삭제 form 전송
    function removeCheck() {
	  
	 	if (confirm("정말 삭제하시겠습니까?") == true) { 
	 		document.removefrm.submit();
	 		window.opener.location.reload();    //부모창 reload
	 		setTimeout(function() {   
	             window.close();
	          }, 100);
	 	} else{
	     return false;
	     }

	}
    //수정 버튼 클릭하면 수정 form 전송
    function modifyCheck() { 
    	document.modifyfrm.submit();
        window.opener.location.reload();
    	setTimeout(function() {
    		window.close();
            }, 10);  
        }  


    
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