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
	   <div class="container-md">
	       <div class="row">
	           <form id="memberForm" method="post">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">사원 등록</h1>
	                    </div>					
	                    <hr class="line" style="border: solid 1px #000" />
	                    </div>
	                    <div class="container-sm content-size">
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputId" class="col-form-label">사원 번호</label>
	                            <div class="col-sm-5">
	                                <input id="memberId" name="id" type="text" class="form-control" placeholder="사원번호를 입력하세요."/>
	                                <button class="btn" type="button" id="buyerCodeExist">확인</button>
	                            </div>
	                            <div id="buyerCodeText1" class="form-text">사원 번호를 확인을 해주세요.</div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPassword" class="col-form-label">비밀번호</label>
	                            <div class="col-sm-5">
	                                <input id="passwordInput1" name="password" type="password" class="form-control" placeholder="비밀번호 입력하세요."/>
	                            </div>	                            
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPassword" class="col-form-label">비밀번호 확인</label>
	                            <div class="col-sm-5">
	                                <input id="passwordInput2" type="password" class="form-control" placeholder="비밀번호 확인"/>
	                            </div>	                            
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">이름</label>
	                            <div class="col-sm-5">
	                                <input id="memberName" name="name" type="text" class="form-control" placeholder="이름을 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputEmail" class="col-form-label">이메일</label>
	                            <div class="col-sm-5">
	                                <input id="memberEmail" name="email" type="text" class="form-control" placeholder="주소를 입력하세요."/>
	                            </div>
	                        </div>
	                         <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPhone" class="col-form-label">연락처</label>
	                            <div class="col-sm-5">
	                                <input id="memberPhone" name="phone" type="text" class="form-control" placeholder="연락처를 입력하세요."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
								<label for="inputAuth" class="col-form-label" >직급</label>
									<div class="col-sm-5">
										<select id="memberAuth" name="Auth" class="form-control"
											style="padding-left: 8px;">
											<option selected>직급을 선택하세요.</option>
											<option name ="팀장" >팀장</option>
											<option name ="차장">차장</option>
											<option name ="과장">과장</option>
											<option name ="대리">대리</option>
											<option name ="주임">주임</option>
											<option name ="사원">사원</option>
										</select>
									</div>
							</div>                      
	                    </div>
	                <hr />
	              </form>
	                <div>
	                    <input id="registerBtn" class="btn registerBtn" value="등록"/>
	                </div>
	            </div>
	        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
	    
    //등록버튼 누르면 등록 실행 후 창 닫기
    document.querySelector("#registerBtn").addEventListener("click", function() {
    	
    	document.querySelector("#memberForm").submit();
    	
    	setTimeout("window.close()", 3000);
    	
    	    //현재 팝업창 Close
    	
    })
    
    const ctx = "${pageContext.request.contextPath}";  
    
 	// 새 비밀번호 일치여부 및 비밀번호 정규 표현식 적용
    const passwordInput1 = document.querySelector("#passwordInput1");
    const passwordInput2 = document.querySelector("#passwordInput2");
    const passwordText = document.querySelector("#passwordText");
    const passwordCheck = /(?=.*[0-9])(?=.*[a-z]).{8,20}/ ;
    passwordInput1.addEventListener("keyup", matchPassword);
    passwordInput2.addEventListener("keyup", matchPassword);

    function matchPassword(){
    	availablePassword = false;
    	if(!passwordCheck.test(passwordInput1.value)|| (passwordInput1.value).length<8){
    		passwordText.innerText = "비밀번호는 영문자,숫자로 구성된 8글자 이상으로 조합하시오."	
    	} else {
    			
    		if(passwordInput1.value == passwordInput2.value){
    			passwordText.innerText = "암호가 일치합니다."
    			availablePassword = true;
    		} else {
    			passwordText.innerText = "암호가 일치하지 않습니다."		
    		}
    	}
    		
    	enableModifyButton();
    }
    
    </script>

</body>
</html>