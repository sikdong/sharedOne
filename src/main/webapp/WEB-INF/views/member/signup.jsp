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
    #registerBtn{
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
    
    #emailIdCheckBtn{
    	text-align: inherit;
	    font-weight: 600; 
	    color: white; 
	    border-radius: 5px; 
	    background-color: white !important;
 		border-color: #1d5c83 !important;
 		color: #1d5c83 !important;
    }
    
    #emailIdCheckBtn:hover, #registerBtn:hover{
 		background-color: #1d5c83 !important;
 		color: white !important;
 	}
 
    .inputDiv{
    position: absolute; 

    }
    .form-control{
    	width:350px;
    }
</style>
<body>   
    <div class="insert-body mt-5 ">    	
	   <div class="container-md">
	       <div class="row">
	           <form id="memberForm" method="post">
	                <div class="col mt-1">
	                    <div class="mb-4">
	                        <h1 style="font-size: 24px; font-weight:600">?????? ??????</h1>
	                    </div>					
	                    	<hr class="line" style="border: solid 1px #000" />
	                    </div>
	                    
	                    <div class="container-sm content-size">
	                    	<!-- <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputId" class="col-form-label">?????????</label>
	                            <div class="col-sm-5 inputDiv">
	                                <input id="memberId" name="id" type="text" class="form-control" placeholder="???????????? ???????????????."/>
	                            </div>
	                        </div> -->
	                    	<div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputName" class="col-form-label">??????</label>
	                            <div class="col-sm-5 inputDiv">
	                                <input id="memberName" name="name" type="text" class="form-control" placeholder="????????? ???????????????."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPassword" class="col-form-label">????????????</label>
	                            <div class="col-sm-5 inputDiv">
	                                <input id="passwordInput1" name="password" type="password" class="form-control" placeholder="???????????? ???????????????."/>
	                            </div>	                            
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPassword" class="col-form-label">???????????? ??????</label>
	                            <div class="col-sm-5 inputDiv">
	                                <input id="passwordInput2" type="password" class="form-control" placeholder="???????????? ??????"/>
	                            </div>
	                            <div id="passwordText" class="form-text" style="text-align: center;"></div>	                            
	                        </div>	                        
	                        <div class="mb-2 row mt-2 rowdiv">                       		
	                            <label for="inputEmailId" class="col-form-label">?????????ID</label>
	                            <div class="col-sm-5 inputDiv" style="display: flex; align-items: stretch;">
	                                <input id="inputEmailId" name="email" type="text" class="form-control" style="border-top-right-radius: 0; border-bottom-right-radius: 0; min-width:262px;" placeholder="????????? ID??? ??????????????????."/>
	                                <button class="btn" type="button" id="emailIdCheckBtn" style="margin-left: -1px; border-top-left-radius: 0; border-bottom-left-radius: 0; height: fit-content; min-width: fit-content"disabled>????????????</button>
	                            </div>
	                            <div id="emailIdText" class="form-text" style="text-align: center;"></div>
	                        </div>
	                         <div class="mb-2 row mt-2 rowdiv">
	                            <label for="inputPhone" class="col-form-label">?????????</label>
	                            <div class="col-sm-5 inputDiv">
	                                <input id="memberPhone" name="phone" type="text" class="form-control" placeholder="???????????? ???????????????."/>
	                            </div>
	                        </div>
	                        <div class="mb-2 row mt-2 rowdiv">
								<label for="inputAuth" class="col-form-label" >??????</label>
									<div class="col-sm-5 inputDiv">
										<select id="memberRank" name="rank" class="form-control"
											style="padding-left: 8px;">
											<option name="select" selected>????????? ???????????????.</option>
											<option name ="??????" >??????</option>
											<option name ="??????">??????</option>
											<option name ="??????">??????</option>
											<option name ="??????">??????</option>
											<option name ="??????">??????</option>
											<option name ="??????">??????</option>
										</select>
									</div>
							</div>                      
	                    </div>
	                <hr />
	              </form>	              	
	            </div>
	            <div class="col-sm-5 " style="position: absolute; text-align: right; margin-left:265px">	                                
	                    <button class="btn registerBtn" type="button" id="registerBtn" style="height: 38px;" disabled>??????</button>
	                </div>
	        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
	
   
    
    //???????????? ????????? ?????? ?????? ??? ??? ??????
    $(function() {

        $("#registerBtn").click( function() {
             $('#memberForm').submit();
          });
    });
    
    const ctx = "${pageContext.request.contextPath}";  
    var availableName = false;
    var availablePassword = false;
    var availableEmailId = false;
    var availablePhone = false;
    var availableRank = false;
 	// ???????????? ??????/?????????
    function enableRegisterButton(){
    	
    	const registerButton = document.querySelector("#registerBtn");
    		
    	if(availablePassword && availableEmailId && availablePhone && availableName && availableRank){
    		//?????? ?????? ?????????
    		registerButton.removeAttribute("disabled")
    	}  else {
    		//?????? ?????? ????????????
    		registerButton.setAttribute("disabled", "");
    	}
    }
 	
	/*?????? ??????????????? ???????????? */
    memberName.addEventListener("keyup", checkName);
 	
	function checkName(){
 		
 		if (document.querySelector("#memberName").value != null){
 			availableName = true;
 		} 
 	}
  
    
 	// ???????????? ???????????? ??? ???????????? ?????? ????????? ??????
    const passwordInput1 = document.querySelector("#passwordInput1");
    const passwordInput2 = document.querySelector("#passwordInput2");
    const passwordText = document.querySelector("#passwordText");
    const passwordCheck = /(?=.*[0-9])(?=.*[a-z]).{8,20}/ ;
    passwordInput1.addEventListener("keyup", matchPassword);
    passwordInput2.addEventListener("keyup", matchPassword);

    function matchPassword(){
    	availablePassword = false;
    	if(!passwordCheck.test(passwordInput1.value)|| (passwordInput1.value).length<8){
    		passwordText.innerText = "??????????????? ?????????,????????? ????????? 8?????? ???????????? ???????????????."
    		passwordText.style.color="red";
    	} else {
    			
    		if(passwordInput1.value == passwordInput2.value){
    			passwordText.innerText = "????????? ???????????????."
    			passwordText.style.color="green";
    			availablePassword = true;
    		} else {
    			passwordText.innerText = "????????? ???????????? ????????????."	
    			passwordText.style.color="red";
    		}
    	}
    	enableRegisterButton()
    }
    
    const inputEmailId = document.querySelector("#inputEmailId");
    const emailIdText = document.querySelector("#emailIdText");
    const emailIdCheck = /(?=.*[0-9])(?=.*[a-z]).{5,15}/;
    

    function checkEmailId(){
    	
    	if(!emailIdCheck.test(inputEmailId.value)||((inputEmailId.value).length<5)&&((inputEmailId.value).length>15)){
    		
    		emailIdText.innerText = "????????? ???????????? ?????????,????????? ????????? 5?????? ?????? 15?????? ????????? ???????????????."
        	emailIdText.style.color="red";
    		//?????? ?????? ????????????
    		emailIdCheckBtn.setAttribute("disabled", "");
    		
    	} else if(emailIdCheck.test(inputEmailId.value)||((inputEmailId.value).length>4)&&((inputEmailId.value).length<16)){
    		
    		emailIdText.innerText = "????????? ????????? ???????????? ????????? ???????????????."
    		emailIdText.style.color="green";
    		//?????? ?????? ?????????
    		emailIdCheckBtn.removeAttribute("disabled")
    	}
    	enableRegisterButton()
    }
    
    inputEmailId.addEventListener("keyup", checkEmailId);
    
 	// ?????????ID ???????????? ?????? ???????????? ???????????????
    emailIdCheckBtn.addEventListener("click", function(){
    	availableEmailId = false;
    		
    	const email = inputEmailId.value;
    		
    	fetch(`\${ctx}/member/checkEmail`,{
    		method : "post",
    		headers : {
    			"Content-Type" : "application/json"
    		},
    		body : JSON.stringify({email})
    	})
    	   .then(res => res.json())
    	   .then(data => {
    		   emailIdText.innerText = data.message;
    		   if(data.status == "Approval"){
    			   availableEmailId = true;
    		   }
    			   
    		   enableRegisterButton();
    	   })	
    })
    
    const memberPhone = document.querySelector("#memberPhone");
    memberPhone.addEventListener("keyup", checkPhone);
	
 	function checkPhone(){
 	
 	const checkPhoneNumber =  /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
 	
 		if (checkPhoneNumber.test(memberPhone.value)){
 			availablePhone = true;
 			memberPhone.style.color="black";
 		} else {
 			availablePhone = false;
 			memberPhone.style.color="red";
 		}
 		enableRegisterButton();
 	}
	
 	memberRank.addEventListener("change", checkRank);
 	
	function checkRank(){
 		
	 	if (document.querySelector("select#memberRank option:checked").value == "????????? ???????????????."){
	 		availableRank = false;
	 	} else {
	 		availableRank = true;
	 	}
	 	
 	enableRegisterButton();
 	
 	} 
    
    </script>

</body>
</html>