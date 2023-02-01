<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<title>Login</title>
</head>
<style>
.error-pagewrap{
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    -webkit-text-size-adjust: 100%;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    font-family: 'Roboto', sans-serif;
    font-weight: 400;
    box-sizing: border-box;
    min-height: 100vh;
    text-align: center;
}
.error-page-int{
    background-color: whitesmoke;
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    vertical-align: middle;
    display: inline-block;
    max-width: 500px;
    padding: 20px 0;
    width: 80%;
    position: relative;
    margin: 8% auto;
}
.custom-login{
    font-weight: 400;
    box-sizing: border-box;
    text-align: center;
}
.content-error{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    margin: 0px 20px;
}
.hpanel{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
}
.panel-body{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    background: #fff;
    border-radius: 2px;
    padding: 20px;
    position: relative;
}

form{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
}
.form-group{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    margin-bottom: 15px;
}
.control-label{
    float: left;
    text-align: center;
    box-sizing: border-box;
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700;
}
.form-control{
    line-height: 1.42857143;
    background-color: #FFFFFF;
    background-image: none;
    border: 1px solid #e5e6e7;
    border-radius: 1px;
    color: inherit;
    display: block;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    width: 100%;
    height: 40px;
    box-shadow: none;
}
.help-block{
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    font-size: 85%;
    display: block;
    margin-top: 5px;
    margin-bottom: 10px;
    color: #737373;
}
.login-checkbox{
    float: left;
    font-weight: 400;
    text-align: center;
    box-sizing: border-box;
    position: relative;
    display: block;
    margin-top: -5px;
    margin-bottom: 15px;
}
label{
    text-align: center;
    box-sizing: border-box;
    display: inline-block;
    max-width: 100%;
    min-height: 20px;
    margin-bottom: 0;
    font-weight: 400;
    cursor: pointer;
    padding-left: 0px;
}
.icheckbox_square-green{
    text-align: center;
    font-weight: 400;
    box-sizing: border-box;
    display: inline-block;
    vertical-align: middle;
    margin: 0;
    padding: 0;
    width: 22px;
    height: 22px;
    background: url(img/green1.png) no-repeat;
    border: none;
    cursor: pointer;
    background-position: 0 0;
    position: relative;
}
.i-checks{
    color: inherit;
    font: inherit;
    margin: 4px 0 0;
    line-height: normal;
    box-sizing: border-box;
    padding: 0;
    margin-left: -20px;
    position: absolute;
    opacity: 0;
}
.iCheck-helper{
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    -webkit-text-size-adjust: 100%;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    font-family: 'Roboto', sans-serif;
    text-align: center;
    font-weight: 400;
    cursor: pointer;
    box-sizing: border-box;
    position: absolute;
    top: 0%;
    left: 0%;
    display: block;
    width: 100%;
    height: 100%;
    margin: 0px;
    padding: 0px;
    background: rgb(255, 255, 255);
    border: 0px;
    opacity: 0;
}
#loginbtn{
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    -webkit-text-size-adjust: 100%;
    box-sizing: border-box;
    font: inherit;
    margin: 0;
    overflow: visible;
    text-transform: none;
    
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: large;
    font-weight: 500;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;

    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    color: #fff;
    display: block;
    width: 100%;
    background-color: #006DF0;
    border-color: #006DF0;
}   
</style>
<body>
<my:side_bar></my:side_bar>
    <div class="error-pagewrap">
		<div class="error-page-int">
            <div class="d-flex align-items-center" style="justify-content: center; color: #1d5c83; ">
                <h1 class="loginHead" style="font-weight: 800;">Order</h1>
              </div>
			<div class="text-center m-b-md custom-login">
				
			</div>
			<div class="content-error">
				<div class="hpanel">
                    <div class="panel-body">
                        <form action="#" id="loginForm" method="post">
                            <div class="form-group">
                                <label class="control-label" for="userId" id="userId">사원번호</label>
                                <input type="text" placeholder="사원번호를 입력해주세요." title="사원번호를 입력해주세요." required="" value="" name="username" id="username" class="form-control" autocomplete="off">
                               
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="password" id="userPassword">비밀번호</label>
                                <input type="password" title="비밀번호를 입력해주세요." placeholder="비밀번호를 입력해주세요." required="" value="" name="password" id="password" class="form-control">
                                
                            </div>                            
                            <input id="loginbtn" style="background-color: #1d5c83;" value="로그인" type="submit">
                        </form>
                    </div>
                </div>
			</div>
		</div>   
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>