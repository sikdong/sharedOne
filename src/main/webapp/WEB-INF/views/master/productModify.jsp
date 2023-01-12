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
<title>제품 수정</title>
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
    #productType{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .col-form-label{
        font-weight: 600;
    }
    
    .btnBox {
    	position: relative;
    	margin-bottom: 25px;
    }
    
    #modifyForm {
 		position: relative;
 	}
    
    #modifyBtn {
    	display : inline-block !important;
    	line-height: 10px;
	    text-align: center !important;
	    font-size: 15px; 
	    font-weight: 600; 
	    width: 60px; 
	    height: 30px; 
	    color: white; 
	    border: none; 
	    border-radius: 5px; 
	    background: #1d5c83;
	    position: absolute;
	    top: 939px;
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
    }
</style>
<body>   
    <div class="insert-body mt-5 ">
		<div class="container-md">
			<form id="modifyForm" name="modifyfrm" action="" method="post">
				<input type="hidden" name="productCode" value="${product.productCode}">
				<div class="row">
					<div class="col mt-1">
						<div class="mb-4">
							<h1 style="font-size: 24px; font-weight: 600">제품 수정</h1>
						</div>
						<hr class="line" style="border: solid 1px #000" />
					</div>
					<div class="container-sm content-size">
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputCode" class="col-form-label">제품 코드</label>
							<div class="col-sm-5">
								<input id="productCode" type="text" class="form-control"
									name="productCode" placeholder="${product.productCode }"
									disabled />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label" >제품명</label>
							<div class="col-sm-5">
								<input id="productName" type="text" class="form-control" name="productName" value="${product.productName }" placeholder="${product.productName }" disabled />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputProductType" class="col-form-label">제품종류</label>
							<div class="col-sm-5">
								<select id="productType" name="productType" class="form-control"
									style="padding-left: 8px;" disabled>
									<option selected>${product.productType }</option>
									<option name="GATE 밸브">GATE 밸브</option>
									<option name="GLOBE 밸브">GLOBE 밸브</option>
									<option name="LUG 밸브">LUG 밸브</option>
									<option name="SWING 밸브">SWING 밸브</option>
									<option name="WAFER 밸브">WAFER 밸브</option>
								</select>
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label">무게</label>
							<div class="col-sm-5">
								<input id="productName" name="weight" type="text" value="${product.weight }"
									class="form-control" placeholder="${product.weight }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label">규격</label>
							<div class="col-sm-5">
								<input id="productName" name="size" type="text" value="${product.size }"
									class="form-control" placeholder="${product.size }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label">단위</label>
							<div class="col-sm-5">
								<input id="productName" name="unit" type="text"
									class="form-control" value="${product.unit }" placeholder="${product.unit }" />
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputProductPrice" class="col-form-label">단가</label>
							<div class="col-sm-5">
								<input id="productPrice" name="price"
									onkeyup="inputNumberFormat(this);"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									type="text" class="form-control"
									value="${product.price }"
									placeholder="${product.price }" 
									/>
							</div>
						</div>

						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputPriceStartDate" class="col-form-label">단가
								시작일</label>
							<div class="col-sm-5">
								<input id="productStartDate" name="fromDate" type="date"
									class="form-control" value="${product.fromDate }"/>
							</div>
						</div>
						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputPriceEndDate" class="col-form-label">단가
								종료일</label>
							<div class="col-sm-5">
								<input id="productEndDate" name="endDate" type="date"
									class="form-control" value="${product.endDate }"/>
							</div>
						</div>

						<div class="mb-2 row mt-2 rowdiv">
							<label for="inputName" class="col-form-label">제품 설명</label>
							<div class="col-sm-5">
								<input id="productName" name="content" type="text"
									class="form-control" placeholder="${product.content }" />
							</div>
						</div>
					</div>
					<hr />
				</div>

				<!-- 수정버튼 -->

				<input id="modifyBtn" class="btn" type="submit" value="수정" onclick="modifyCheck()">
			</form>

			<form action="/master/productRemove" name="removefrm" method="post">
				<input type="hidden" name="code" value="${product.productCode}">
				<input id= "removeBtn" class="btn" type="submit" value="삭제" onclick="removeCheck()">
			</form>

		</div>

	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
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