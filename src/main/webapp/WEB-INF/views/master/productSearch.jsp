<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>제품 검색</title>
</head>
<style>
 .screen_out{
 	overflow: auto;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
 }
 .form_search .product_search {
    height: 46px;
    padding: 0 65px 0 15px;
    background-color: #fff;
    position: relative;
}
.product_search .btn_search{
    font-size: x-large;
    position: absolute;
    right: 0;
    top: 0;
    width: 36px;
    height: 46px;
    background-color: #fff;
    cursor: pointer; 
    border: none;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
.product_name:focus{
    outline: none;
}
.productInfo{
	border-bottom: 1px solid black;
	font-size: 12px;
	padding: 10px;
	font-size: large;
}
/* .productInfo:hover{
	background-color:lightgray;
} */
ul{
	margin-left:0;
	padding-left:0;
}
li{
	list-style-type: none;
}
.notResult{
	text-align: center;
	padding-bottom: 10px;
	font-size: x-large;
}
.productType{
	font-weight:bold;
	color: red;
}
dt{
	border: 1px solid black;
	border-radius:5px;
	width: fit-content;
	float: left;
}
.ptName{
	padding : 0px 3px;
}
.productType{
	padding : 1px;
}
.ptDiv{
	margin-bottom: 5px;
}
.chooseBtn{
	float: right;
	border-radius: 5px;
}
.chooseBtn:hover{
	background-color:lightblue;
	color:white;
}
.spinner{
	width:100%;
	position:relative;
	z-index:1014;
	height:100%;
}
.spinner-border{
	display:block;
	position:fixed;
	top:calc(50%-(58px/2));
	right:calc(50%-(58px/2));
}
</style>
<body style="margin: 0px; padding: 0px; height: 100%; width: 100%; overflow: auto; background-color: lightgray;">
	<div class="searchBody" style="background-color: whitesmoke; font-size: 14px; line-height: 1.5; color: #222;" >
		<div class="searchBar" style="height: 47px; overflow: visible;" >
			<h1 class="screen_out">제품 검색</h1>
			<form action="" id="searchForm" class="form_search">
				<fieldset class="fld_inside" style="border: 0;border-bottom: 1px solid gray;">
			        <legend class="screen_out">제품 검색 입력폼</legend>
			        <div class="product_search">
			            
			            <div class="wrap_tf_keyword">
			                <input placeholder="검색할 제품을 입력, 예시) GA0001, GA, 0010" name="keyword" id="keywordInput" value="${param.keyword }" 
			                	   class="product_name" type="text" autocomplete="off"
			                	   style="font-size: 25px; inline-size: -webkit-fill-available; border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:0px;">			            	
			            </div>			            
			            <button type="button" class="btn_clear" style="display: none;"><span class="img_post">취소</span></button>
			            <button type="submit" class="btn_search"><i class="fa-solid fa-magnifying-glass"></i></button>        
			        </div>
			    </fieldset>			
			</form>
            <div id="postCodeSuggestLayer" class="suggest_search" style="position: relative; top:0; z-index:999;"></div>
            <label for="focusContent" class="screen_out">의 검색 결과 입니다. 아래쪽으로 스크롤하세요.</label>
		</div>	
        <div class="result_body mt-3 pb-2">
        <c:if test="${empty productList}">
        	<div class="notResult">
	        	<span>"${param.keyword }"에 대한 검색 결과가 없습니다.</span>
        	</div>
        </c:if>
        	<ul id="list">
        	<li>
        		<input type="hidden" value="${count }" id="countProduct">
        		<input type="hidden" id="lastProductId" value = ${lastProductId }>
        		<input type="button" id="testBtn" value="test">
        	</li>
            <c:forEach items="${productList }" var="product" varStatus="st">
				<li>
					<div class="productInfo">
						<div class="ptDiv">
							<span class="productType">${product.productType }</span>
							<button class="chooseBtn" value="${product.productCode },${product.productName }">선택</button>
						</div>
						<dl>
							<dt>
								제품코드
							</dt>
							<dd>
								<span class="productCode" id="productCode+${product.productId}">&nbsp&nbsp${product.productCode }</span>
							</dd>
							<dt class="ptName">
								제&nbsp품&nbsp명
							</dt>
							<dd>
								<span class="productName">&nbsp&nbsp${product.productName }</span>
							</dd>
						</dl>
					</div>	
				</li>
			</c:forEach>
			<%-- <li>
				 <div class="loadingImg" style="text-align:center; background-color:none;">
		        	<img style="width: 100px; height: 100px;"src="${pageContext.request.contextPath}/content/spinner.svg" alt="">
		        </div>
			</li>    --%>                                                                  
        	</ul>                                    
        </div>		
	</div>
	<div class="d-flex justify-content-center spinner">
	  <div class="spinner-border" id="loadingImg" role="status">
	    <span class="sr-only">Loading...</span>
	  </div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>	
const ctx = "${pageContext.request.contextPath}";	
var lastId = document.querySelector("#lastProductId").value; 
var count = document.querySelector("#countProduct").value;
var isLoading = false;

$(window).on("scroll",function(){
	// 위로 스크롤 길이
	var scrollTop=$(window).scrollTop();
	// 웹브라우저 창 높이
	var windowHeight=$(window).height();
	// 문서 전체의 높이
	var documentHeight=$(document).height();
	// 바닥까지 스크롤 여부
	var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
	
	if(isBottom){
		// 만약 마지막 리스트 일 경우
		if(count <= 0){
			return; // 함수 종료
		}

		// 로딩바 띄우기
		$(".loadingImg").show();
		
		if(!isLoading)    //실행 가능 상태라면?
        {
			isLoading = true; //실행 불가능 상태로 변경
			getList(); 
        }
	}
})

function getList(){
	
	count = count-10;
	
	const keyword = document.querySelector("#keywordInput").value;
	
	if(keyword == null){
		keyword = "";
	}
	fetch(`\${ctx}/master/addProductList?keyword=\${keyword}&&lastId=\${lastId}`)
	.then(res => res.json())
	.then(list => {
		const searchList = document.querySelector("#list");
		for(const listAdd of list){
			lastId = `\${listAdd.productId}`;
			const addProduct = `
						<li>
							<div class="productInfo">
								<div class="ptDiv">
									<span class="productType">\${listAdd.productType }</span>
									<button class="chooseBtn" value="\${listAdd.productCode }">선택</button>
								</div>
								<dl>
									<dt>
										제품코드
									</dt>
									<dd>
										<span class="productCode" id="productCode+\${listAdd.productId}">&nbsp&nbsp\${listAdd.productCode }</span>
									</dd>
									<dt class="ptName">
										제&nbsp품&nbsp명
									</dt>
									<dd>
										<span class="productName">&nbsp&nbsp\${listAdd.productName }</span>
									</dd>
								</dl>
							</div>	
						</li>`;												
			document.querySelector("#list").insertAdjacentHTML("beforeend", addProduct);
			isLoading = false;
			// 로딩바 숨기기
			$(".loadingImg").hide();
		}
	});
};

$(document).on('click','.chooseBtn', (e)=>{
	  data = e.target.value.split(",");
	  var result1 = data[0];	  
	  var result2 = data[1];	  
	  var result3 = data[1].charAt(0);	  
	  
	  window.opener.document.getElementById("parentInput1P").value = result1;
	  window.opener.document.getElementById("parentInput2P").value = result2;
	  window.opener.document.getElementById("parentInput3P").value = result3;

	  window.close();
	})
	
/* salePriceList.jsp_서정 : 인풋값 입력하면, 부모창에 검색 시키기  */
/* $(function(){
	$('.chooseBtn').click(function(){
		const productCode = $(this).val();
		console.log("this:"+productCode);
		$("#p1", parent.opener.document).val(productCode);
		$(opener.document).find("#selectedSearchBtn").click();		
	})
}); */
</script>
</html>