<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

.form-style {
	border : 1px solid #ced4da; 
	width : 100%;
}
.leftFilterDiv {
	border-right-style: groove;
}


.btn-form {
	background : #1d5c83; 
	color : white;
	
}

.root {
	width: 77vw;
	margin: 3% 3% 0 20%;
}

.mt5 {
	margin-top: 5px !important;
}
.ml-3 {
	margin-left : 3%;
}

.jcsb {
	display: flex;
	justify-content: space-between !important;
}
.jcsa {
	display : flex;
	justify-content : space-around;
}

.form-width {
	width : 21vw !important;
}

.root-width{
	width : 77vw;
}
.flex {
	display : flex;
} 
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
	<my:side_bar></my:side_bar>
<div class="root">
		<form action="" method="POST" id="orderForm">
		<input type="hidden" name="status" id="status" />
		<div style="font-size: 30px;">
			<strong>주문서 수정</strong>
		</div>
		
		
		<div style="margin-top: 5%; font-size: 22px; color: #1d5c83;">
			주문서 정보
		</div>
		
		<hr style="width: 10%" />
		<br />
		<br />
		<div><strong>바이어 수정</strong></div>
		<br />
		<div class="container-sm mt-4">
					<div class="row d-flex">
						<!-- *좌측* 검색 조건 설명란 -->
						<div class="col-sm-2 leftFilterDiv mt-2">
							<div class="mb-5">
								<p class="filterText ">전체 검색</p>
							</div>
							<div class="mb-5">
								<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
							</div>
						</div><!-- 좌측 조건 설명 div 끝 -->
						
						<!-- *우측* 검색 필터 -->
						<div class="col-sm-10 mt-1">
								<!-- 검색필터 1st row : 전체 검색. -->
								<div class="row d-flex">
									<div class="col-sm-6 mb-4">
										<div class="input-group">
											<input name="buyerInfo" id="allBuyerInfoInput" class="form-control" type="Search" placeholder="바이어 관련 정보를 입력 ex) ATX, 한국" aria-label="Search">
							        		<button class="btn btn-outline-secondary" type="button" id="allBuyerInfoBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 1st row 끝 -->
								<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
								<div class="row d-flex">
									<div class="col-sm-3 mb-4">
										<div class="input-group" >
											<input name="" type="search" id="buyerName" class="form-control" list="datalistOptions1" placeholder="바이어명">
											<button class="btn btn-outline-secondary" id="buyerNameBtn" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="buyerCode" class="form-control" list="datalistOptions2" placeholder="바이어코드">
											<button class="btn btn-outline-secondary" id="buyerCodeBtn" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>	
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="country" class="form-control" list="datalistOptions3" placeholder="국가">
											<button class="btn btn-outline-secondary" id="countryBtn" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 2nd row 끝 -->
								<!-- 검색필터 3rd row : 기간 선택 -->
							</div><!-- 우측 검색 조건 div 끝 -->
						</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
						
					</div><!-- container-sm div 끝-->
					<hr />
					<div class="mt-5" id="buyerTable">
				</div>
		<input type="hidden" value="${orderHeader.orderId}" id="orderId" />
		<div style="width : 77vw; display : flex;" class="mt-5">
			<div class="form-width">
				<label for="staticEmail" class="col-form-label" style="min-width : 50px; margin-left : 3%">바이어코드</label>
				<div class="ml-3">
					<input type="text" class="form-control" value="${orderHeader.buyerCode}"
						name="buyerCode" id="buyerCodeInput">
				</div>
			</div>
			<div  class="form-width" style="margin-left : 10%">
				<label for="inputPassword" class="col-form-label" style="min-width : 50px; margin-left : 3%">납기요청일</label>
				<div class="ml-3">
					<input type="date" value="${orderHeader.deliveryDate }" class="form-control" name="deliveryDate" id="deliveryDate">
				</div>
			</div>
			<div  class="form-width" style="margin-left : 10%">
				<label for="inputPassword" class="col-form-label" style="min-width : 50px; margin-left : 3%">수정일</label>
				<div class="ml-3">
					<input readOnly type="date" name="modified" id="modified" class="form-control" value="${orderHeader.modified }" id="inputPassword">
				</div>
			</div>
		</div>
		
		<br />
		<br />
		<hr />
		<br />
		<br />
		
		<div><strong>주문 추가</strong></div>
		<br />
		<div class="container-sm mt-4">
					<div class="row d-flex">
						<!-- *좌측* 검색 조건 설명란 -->
						<div class="col-sm-2 leftFilterDiv mt-2">
							<div class="mb-5">
								<p class="filterText ">전체 검색</p>
							</div>
							<div class="mb-5">
								<p class="filterText ">조건 선택</p><!-- ( 각자 페이지에 따라 조건을 수정하세요! ex.바이어코드 / 바이어명 등등... ) -->
							</div>
						</div><!-- 좌측 조건 설명 div 끝 -->
						
						<!-- *우측* 검색 필터 -->
						<div class="col-sm-10 mt-1">
								<!-- 검색필터 1st row : 전체 검색. -->
								<div class="row d-flex">
									<div class="col-sm-6 mb-4">
										<div class="input-group">
											<input name="buyerInfo" id="allProductInfo" class="form-control" type="Search" placeholder="제품 관련 정보를 입력 ex) GA" aria-label="Search">
							        		<button type="button" class="btn btn-outline-secondary" style="cursor : pointer" id="allProductInfoBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 1st row 끝 -->
								<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
								<div class="row d-flex">
									<div class="col-sm-3 mb-4">
										<div class="input-group" >
											<input type="text" id="productNameInput"  class="form-control" list="datalistOptions1" placeholder="제품명">
											<button type="button" id="productNameBtn" class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input id="productCodeInput" type="text" class="form-control" list="datalistOptions2" placeholder="제품코드">
											<button type="button" id="productCodeBtn"  class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>	
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input type="text" id="productTypeInput" class="form-control" list="datalistOptions3" placeholder="제품그룹">
											<button type="button" id="productTypeBtn" class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 2nd row 끝 -->
								<!-- 검색필터 3rd row : 기간 선택 -->
							</div><!-- 우측 검색 조건 div 끝 -->
						</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
					</div><!-- container-sm div 끝-->
					<hr />
					<div id="productTable">
					</div>
					
			<button type="button" id="addOrder" class="mt-5 btn btn-form"
			style="margin-left: 48%; background: #1d5c83; color: white;">
			추가</button>
		
		<br />
		<br />
		<br />
		<br /><br />
                <div><strong>주문 수정</strong></div>
		<br /><br />
		<table class="table table-hover table-bordered table-sm caption-top">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th style="text-align: center;" scope="col" colspan="6">제품정보</th>
                        <th style="text-align: center;" scope="col" colspan="4	">금액정보</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">삭제여부</th>
                      </tr>
                      <tr>
                        <th>#</th>
                        <th>제품코드</th>
                        <th>제품그룹</th>
                        <th>제품명</th>
                        <th>규격(inch)</th>
                        <th>무게(lb)</th>
                        <th>단위</th>
                        <th>단가</th>
                        <th>판매가</th>
                        <th>수량</th>
                        <th>합계액</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider" id="tempOrderTable">
                    <c:forEach items="${orderItems }" var="orderItem" varStatus="status">
                      <tr id="table${status.index }">
                        <th scope="row" class="oiNumber"></th>
                        <td>${orderItem.productCode }<input type="hidden" name="productCode" value="${orderItem.productCode }"/></td>
                        <td>${orderItem.productType }</td>
                        <td>${orderItem.productName }</td>
                        <td>${orderItem.size }</td>
                        <td>${orderItem.weight }</td>
                        <td>${orderItem.unit }</td>
                        <td><fmt:formatNumber value="${orderItem.price }"/></td>
                        <td style="width : 150px;"><input type="text" name="finalPrice" value="${orderItem.finalPrice }" onclick="makeSumforfinalPrice(event),makeComma(event)" onchange="makeSumforfinalPrice(event), makeComma(event)" class="form-style" id="finalPrice${status.index }"/></td>
                        <td style="width : 100px;"><input type="number" name="quantity" onclick="makeSumforquantity(event)" onchange="makeSumforquantity(event)" class="form-style" id="quantity${status.index }" value="${orderItem.quantity }"/></td>
                        <td style="width : 180px;"><input type="text" readonly id="sum${status.index}"name="sum" class="form-style" /></td>
                        <td style="display : flex; justify-content : center;">
                        	<button type="button" data-product-code = "${orderItem.productCode }" onclick="document.querySelector('#table${status.index}').innerHTML ='', assignNumber(), deleteSavedTempOrder(event)" class="btn button btn-sm" style="margin-left : 2px; background : #1d5c83; color : white;">삭제</button>
                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                  <div style="width : 77vw;" class="mt-5">
					<label for="inputPassword" class=" col-form-label">주문 시 특이사항</label>
					<div class="ml-3">
						<textarea name="message" rows="5" class="form-control message" id="inputPassword" >${orderHeader.message }</textarea>
					</div>
				  </div>
		        <button type="button" style="margin-left: 40%; background: #1d5c83; color: white;"
				class="mt-5 btn" onclick="modify(this)">임시저장</button>
			<button id="registerBtn" onclick="modify(this)" type="button" style="background: #1d5c83; color: white;" class="mt-5 btn">주문
				수정</button>
			<a href="${path }/order/list" type="button" class="mt-5 btn"
				style="background: #1d5c83; color: white;">취소</a>
            	</form>
            </div>
            
            <div class="toast-container position-fixed bottom-0 end-0 p-3">
			  <div id="deleteOrderToast" class="toast" role="alert" style="width : 300px !important;" aria-live="assertive" aria-atomic="true">
			    <div class="toast-header">
			      <strong class="me-auto">주문 삭제 여부</strong>
			      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			    </div>
			    <div class="toast-body" id="deleteOrderMessage">
			    	주문이 삭제되었습니다
			    </div>
			  </div>
			</div>
			
			<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	        <br />
            <br />
            <br />
            <br />
            <br />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
	const path = "${pageContext.request.contextPath}"
	document.querySelector("input[name='buyerCode']").addEventListener
	function confirmBuyer(event){
		let originalBuyer = document.querySelector("#buyerCodeInput")
		 if(originalBuyer.value === event.target.value ){
			 event.target.setAttribute("data-bs-toggle", "");
		 } 
	 }
	
	function makeSumforfinalPrice(event){
		let quantity = event.target.parentElement.nextElementSibling.firstElementChild
		let finalPrice = event.target.value.split(',').join("");
		let preSum = finalPrice*quantity.value;
		let sum = preSum.toLocaleString();
		event.target.parentElement.nextElementSibling.nextElementSibling.firstElementChild.value= sum;
  	}

	function makeSumforquantity(event){
		let quantity = event.target
		let finalPrice = quantity.parentElement.previousElementSibling.firstElementChild.value.split(',').join("");
		let preSum = finalPrice*quantity.value;
		let sum = preSum.toLocaleString();
		quantity.parentElement.nextElementSibling.firstElementChild.value= sum
	}
	<%-- 전체 검색 --%>
	document.querySelector("#allBuyerInfoBtn").addEventListener("click", function(){
		const allBuyerInfoInput = document.querySelector("#allBuyerInfoInput").value;
		fetch(path+"/order/searchAllBuyerInfo/"+allBuyerInfoInput)
		.then(res => res.json())
		.then(list => {
			document.querySelector("#buyerTable").innerHTML = "";
			const table = 
				`<table class="table">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">바이어코드</th>
				<th scope="col">바이어명</th>
				<th scope="col">국가</th>
				<th scope="col">주소</th>
				<th scope="col">사업자번호</th>
				<th scope="col">담당자</th>
				<th scope="col">선적비용회사</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>
		<tbody id="buyerBody">
		</tbody>
	</table>`
		document.querySelector("#buyerTable").insertAdjacentHTML("afterbegin", table)
		for(const item of list){
			const buyerTableItem =
			
			`<tr>
				<th> 
					<input class="form-radio-input" type="radio" style="width : 20px; height : 20px;"
						name="buyerCode" value="\${item.buyerCode}" onclick="confirmBuyer(event), transferValue(event)">
				</th>
				<td id="tableBuyerCode">\${item.buyerCode }</td>
				<td>\${item.buyerName }</td>
				<td>\${item.country }</td>
				<td>\${item.address }</td>
				<td>\${item.businessNumber }</td>
				<td>\${item.manager }</td>
				<td>\${item.deliveryCompany }</td>
				<td>\${item.phone}</td>
			</tr>`
			document.querySelector("#buyerBody").insertAdjacentHTML("beforeend", buyerTableItem)
			}
		
		})
		
	})
	
	
	function transferValue(event) {
		document.querySelector("#buyerCodeInput").value = event.target.value;
		document.querySelector("#buyerTable").innerHTML = "";
	}
	<%-- 바이어명 검색 --%>
		document.querySelector("#buyerNameBtn").addEventListener("click", function(){
		const buyerName = document.querySelector("#buyerName").value;
		fetch(path+"/order/searchbuyerName/"+buyerName)
		.then(res => res.json())
		.then(list => {
			document.querySelector("#buyerTable").innerHTML = "";
			const table = 
				`<table class="table">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">바이어코드</th>
				<th scope="col">바이어명</th>
				<th scope="col">국가</th>
				<th scope="col">주소</th>
				<th scope="col">사업자번호</th>
				<th scope="col">담당자</th>
				<th scope="col">선적비용회사</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>
		<tbody id="buyerBody">
		</tbody>
	</table>`
		document.querySelector("#buyerTable").insertAdjacentHTML("afterbegin", table)
		for(const item of list){
			const buyerTableItem =
			
			`<tr>
				<th>
				<input class="form-radio-input" type="radio" style="width : 20px; height : 20px;"
					name="buyerCode" value="\${item.buyerCode}" onclick="transferValue(event)">
				</th>
				<td id="tableBuyerCode">\${item.buyerCode }</td>
				<td>\${item.buyerName }</td>
				<td>\${item.country }</td>
				<td>\${item.address }</td>
				<td>\${item.businessNumber }</td>
				<td>\${item.manager }</td>
				<td>\${item.deliveryCompany }</td>
				<td>\${item.phone}</td>
			</tr>`
			document.querySelector("#buyerBody").insertAdjacentHTML("beforeend", buyerTableItem)
			}
		})
	})
	
	<%-- 국가 검색 --%>
	document.querySelector("#countryBtn").addEventListener("click", function(){
		const country = document.querySelector("#country").value;
		fetch(path+"/order/searchcountry/"+country)
		.then(res => res.json())
		.then(list => {
			document.querySelector("#buyerTable").innerHTML = "";
			const table = 
				`<table class="table">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">바이어코드</th>
				<th scope="col">바이어명</th>
				<th scope="col">국가</th>
				<th scope="col">주소</th>
				<th scope="col">사업자번호</th>
				<th scope="col">담당자</th>
				<th scope="col">선적비용회사</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>
		<tbody id="buyerBody">
		</tbody>
	</table>`
		document.querySelector("#buyerTable").insertAdjacentHTML("afterbegin", table)
		for(const item of list){
			const buyerTableItem =
			
			`<tr>
				<th>
				<input class="form-radio-input" type="radio" style="width : 20px; height : 20px;"
					name="buyerCode" value="\${item.buyerCode}" onclick="transferValue(event)">
				</th>
				<td id="tableBuyerCode">\${item.buyerCode }</td>
				<td>\${item.buyerName }</td>
				<td>\${item.country }</td>
				<td>\${item.address }</td>
				<td>\${item.businessNumber }</td>
				<td>\${item.manager }</td>
				<td>\${item.deliveryCompany }</td>
				<td>\${item.phone}</td>
			</tr>`
			document.querySelector("#buyerBody").insertAdjacentHTML("beforeend", buyerTableItem)
			}
		})
	})
	<%-- 바이어 코드 검색 --%>
	document.querySelector("#buyerCodeBtn").addEventListener("click", function(){
		const buyerCode = document.querySelector("#buyerCode").value;
		fetch(path+"/order/searchbuyerCode/"+buyerCode)
		.then(res => res.json())
		.then(list => {
			document.querySelector("#buyerTable").innerHTML = "";
			const table = 
				`<table class="table">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">바이어코드</th>
				<th scope="col">바이어명</th>
				<th scope="col">국가</th>
				<th scope="col">주소</th>
				<th scope="col">사업자번호</th>
				<th scope="col">담당자</th>
				<th scope="col">선적비용회사</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>
		<tbody id="buyerBody">
		</tbody>
	</table>`
		
		document.querySelector("#buyerTable").insertAdjacentHTML("afterbegin", table)
		for(const item of list){
			const buyerTableItem =
			
			`<tr>
				<th> 
				<input class="form-radio-input" type="radio" style="width : 20px; height : 20px;"
					name="buyerCode" value="\${item.buyerName}" onclick="transferValue(event)">
				</th>
				<td id="tableBuyerCode">\${item.buyerCode }</td>
				<td>\${item.buyerName }</td>
				<td>\${item.country }</td>
				<td>\${item.address }</td>
				<td>\${item.businessNumber }</td>
				<td>\${item.manager }</td>
				<td>\${item.deliveryCompany }</td>
				<td>\${item.phone}</td>
			</tr>`
			document.querySelector("#buyerBody").insertAdjacentHTML("beforeend", buyerTableItem)
			}
		})
	})
	
	<%-- 전체 제품 검색 --%>
	document.querySelector("#allProductInfoBtn").addEventListener("click", function(){
		const allProductInfo = document.querySelector("#allProductInfo").value;
		const tableBuyerCode = document.querySelector("#buyerCodeInput").value;
		const deliveryDate = document.querySelector("#deliveryDate").value;
		if(deliveryDate != ''){
			
		fetch(path+"/order/searchAllProductInfo/"+allProductInfo+"/"+tableBuyerCode+"/"+deliveryDate)
		.then(res => res.json())
		.then(list => {
			if(list.length != 0){
				
				document.querySelector("#productTable").innerHTML = "";
				const table = 
					`<table class="table">
				<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">제품코드</th>
					<th scope="col">제품그룹</th>
					<th scope="col">제품명</th>
					<th scope="col">규격(inch)</th>
					<th scope="col">무게(lb)</th>
					<th scope="col">단위</th>
					<th scope="col">단가</th>
					<th scope="col">판매가</th>
					<th scope="col">판매 기간</th>
				</tr>
			</thead>
			<tbody id="productBody">
			</tbody>
			
		</table>`
			document.querySelector("#productTable").insertAdjacentHTML("afterbegin", table)
			for(const item of list){
				const p = item.price
				let price = p.toLocaleString();
				const sp = item.salePrice
				let salePrice = sp.toLocaleString();
				const productTableItem =
					
				`<tr>
					<th>
						<input class="form-radio-input" type="checkbox" style="width : 20px; height : 20px;"
							id="productCheckBox-\${item.productCode}" name="productCode" value="\${item.productCode}"
							data-from-date = "\${item.fromDate}" data-end-date="\${item.endDate}">
					</th>
					<td>\${item.productCode }</td>
					<td>\${item.productType }</td>
					<td>\${item.productName }</td>
					<td>\${item.size }</td>
					<td>\${item.weight }</td>
					<td>\${item.unit }</td>
					<td>\${price}</td>
					<td>\${salePrice }</td>
					<td>\${item.fromDate}~\${item.endDate}</td>
				</tr>`
				document.querySelector("#productBody").insertAdjacentHTML("beforeend", productTableItem)
					}
		
				}else {
					alert("해당 요청일에 판매하는 제품이 없습니다. 다시 검색해 주세요")	
				}
			})
		} else {
			alert("납기 요청일을 입력해주세요")
		}
	})
	
	<%--제품명 검색 --%>
	document.querySelector("#productNameBtn").addEventListener("click", function(){
		const allProductInfo = document.querySelector("#productNameInput").value;
		const tableBuyerCode = document.querySelector("#buyerCodeInput").value;
		const deliveryDate = document.querySelector("#deliveryDate").value;
		if(deliveryDate != ''){
		fetch(path+"/order/searchAllProductInfo/"+allProductInfo+"/"+tableBuyerCode+"/"+deliveryDate)
		.then(res => res.json())
		.then(list => {
			if(list.length != 0){
				
				document.querySelector("#productTable").innerHTML = "";
				const table = 
					`<table class="table">
				<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">제품코드</th>
					<th scope="col">제품그룹</th>
					<th scope="col">제품명</th>
					<th scope="col">규격(inch)</th>
					<th scope="col">무게(lb)</th>
					<th scope="col">단위</th>
					<th scope="col">단가</th>
					<th scope="col">판매가</th>
					<th scope="col">판매 기간</th>
				</tr>
			</thead>
			<tbody id="productBody">
			</tbody>
			
		</table>`
			document.querySelector("#productTable").insertAdjacentHTML("afterbegin", table)
			for(const item of list){
				const p = item.price
				let price = p.toLocaleString();
				const sp = item.salePrice
				let salePrice = sp.toLocaleString();
				const productTableItem =
					
				`<tr>
					<th>
						<input class="form-radio-input" type="checkbox" style="width : 20px; height : 20px;"
							id="productCheckBox-\${item.productCode}" name="productCode" value="\${item.productCode}"
							data-from-date = "\${item.fromDate}" data-end-date="\${item.endDate}">
					</th>
					<td>\${item.productCode }</td>
					<td>\${item.productType }</td>
					<td>\${item.productName }</td>
					<td>\${item.size }</td>
					<td>\${item.weight }</td>
					<td>\${item.unit }</td>
					<td>\${price}</td>
					<td>\${salePrice }</td>
					<td>\${item.fromDate}~\${item.endDate}</td>
				</tr>`
				document.querySelector("#productBody").insertAdjacentHTML("beforeend", productTableItem)
					}
		
				}else {
					alert("해당 요청일에 판매하는 제품이 없습니다. 다시 검색해 주세요")	
				}
			})
		} else {
			alert("납기 요청일을 입력해주세요")
		}
	})
	<%--제품코드로 검색 --%>
	document.querySelector("#productCodeBtn").addEventListener("click", function(){
		const allProductInfo = document.querySelector("#productCodeInput").value;
		const tableBuyerCode = document.querySelector("#buyerCodeInput").value;
		const deliveryDate = document.querySelector("#deliveryDate").value;
		if(deliveryDate != ''){
		fetch(path+"/order/searchAllProductInfo/"+allProductInfo+"/"+tableBuyerCode+"/"+deliveryDate)
		.then(res => res.json())
		.then(list => {
			if(list.length != 0){
				
				document.querySelector("#productTable").innerHTML = "";
				const table = 
					`<table class="table">
				<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">제품코드</th>
					<th scope="col">제품그룹</th>
					<th scope="col">제품명</th>
					<th scope="col">규격(inch)</th>
					<th scope="col">무게(lb)</th>
					<th scope="col">단위</th>
					<th scope="col">단가</th>
					<th scope="col">판매가</th>
					<th scope="col">판매 기간</th>
				</tr>
			</thead>
			<tbody id="productBody">
			</tbody>
			
		</table>`
			document.querySelector("#productTable").insertAdjacentHTML("afterbegin", table)
			for(const item of list){
				const p = item.price
				let price = p.toLocaleString();
				const sp = item.salePrice
				let salePrice = sp.toLocaleString();
				const productTableItem =
					
				`<tr>
					<th>
						<input class="form-radio-input" type="checkbox" style="width : 20px; height : 20px;"
							id="productCheckBox-\${item.productCode}" name="productCode" value="\${item.productCode}"
							data-from-date = "\${item.fromDate}" data-end-date="\${item.endDate}">
					</th>
					<td>\${item.productCode }</td>
					<td>\${item.productType }</td>
					<td>\${item.productName }</td>
					<td>\${item.size }</td>
					<td>\${item.weight }</td>
					<td>\${item.unit }</td>
					<td>\${price}</td>
					<td>\${salePrice }</td>
					<td>\${item.fromDate}~\${item.endDate}</td>
				</tr>`
				document.querySelector("#productBody").insertAdjacentHTML("beforeend", productTableItem)
					}
		
				}else {
					alert("해당 요청일에 판매하는 제품이 없습니다. 다시 검색해 주세요")	
				}
			})
		} else {
			alert("납기 요청일을 입력해주세요")
		}
	})
	
	<%--제품그룹로 검색 --%>
	document.querySelector("#productTypeBtn").addEventListener("click", function(){
		const allProductInfo = document.querySelector("#productTypeInput").value;
		const tableBuyerCode = document.querySelector("#buyerCodeInput").value;
		const deliveryDate = document.querySelector("#deliveryDate").value;
		if(deliveryDate != ''){
		fetch(path+"/order/searchAllProductInfo/"+allProductInfo+"/"+tableBuyerCode+"/"+deliveryDate)
		.then(res => res.json())
		.then(list => {
			if(list.length != 0){
				
				document.querySelector("#productTable").innerHTML = "";
				const table = 
					`<table class="table">
				<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">제품코드</th>
					<th scope="col">제품그룹</th>
					<th scope="col">제품명</th>
					<th scope="col">규격(inch)</th>
					<th scope="col">무게(lb)</th>
					<th scope="col">단위</th>
					<th scope="col">단가</th>
					<th scope="col">판매가</th>
					<th scope="col">판매 기간</th>
				</tr>
			</thead>
			<tbody id="productBody">
			</tbody>
			
		</table>`
			document.querySelector("#productTable").insertAdjacentHTML("afterbegin", table)
			for(const item of list){
				const p = item.price
				let price = p.toLocaleString();
				const sp = item.salePrice
				let salePrice = sp.toLocaleString();
				const productTableItem =
					
				`<tr>
					<th>
						<input class="form-radio-input" type="checkbox" style="width : 20px; height : 20px;"
							id="productCheckBox-\${item.productCode}" name="productCode" value="\${item.productCode}"
							data-from-date = "\${item.fromDate}" data-end-date="\${item.endDate}">
					</th>
					<td>\${item.productCode }</td>
					<td>\${item.productType }</td>
					<td>\${item.productName }</td>
					<td>\${item.size }</td>
					<td>\${item.weight }</td>
					<td>\${item.unit }</td>
					<td>\${price}</td>
					<td>\${salePrice }</td>
					<td>\${item.fromDate}~\${item.endDate}</td>
				</tr>`
				document.querySelector("#productBody").insertAdjacentHTML("beforeend", productTableItem)
					}
		
				}else {
					alert("해당 요청일에 판매하는 제품이 없습니다. 다시 검색해 주세요")	
				}
			})
		} else {
			alert("납기 요청일을 입력해주세요")
		}
	})
		
	let i = 1
 	<%--상세정보에 추가 --%>
	document.querySelector("#addOrder").addEventListener("click", function() {
		
		const buyerCode = document.querySelector("#buyerCodeInput").value;
		const productCode = document.querySelectorAll('input[name="productCode"]:checked');
		let doubleCheck = document.querySelectorAll('#tempOrderTable input[name="productCode"]')
		let a = true;
		for(let j = 0; j < doubleCheck.length; j++){
			for(let i = 0; i < productCode.length; i++){
				if(productCode[i].value === doubleCheck[j].value){
					alert("중복되는 제품이 있습니다. 다시 선택해주세요")
				 	i = productCode.length;
				 	j = doubleCheck.length;
				 	a = false;
				}
			}
		}
		if(a){
		let productCodes = [];
		let fromDates = [];
		let endDates = [];
		productCode.forEach((el) => {
			productCodes.push(el.value);
			fromDates.push(el.dataset.fromDate)
			endDates.push(el.dataset.endDate)	
		})
		
		const data = {
				'productCodes' : productCodes,
				'buyerCode' : buyerCode,
				'fromDates' : fromDates,
				'endDates' : endDates
		}
		
		fetch(path+"/order/addTempProductOrder/", {
			method : "POST",
			headers : {
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		})
		.then(res => res.json())
		.then(data => { 
			for(const da of data){
				let op = da.price
				let orderPrice = op.toLocaleString();
				let sp = da.salePrice
				let salePrice = sp.toLocaleString();
			const productOrderTable =
            `<tr id="tr\${i}">
              <th scope="row" class="oiNumber"></th>
              <td>\${da.productCode}<input type="hidden" name="productCode" value="\${da.productCode}"></td>
              <td>\${da.productType}</td>
              <td>\${da.productName}</td>
              <td>\${da.size}</td>
              <td>\${da.unit}</td>
              <td>\${da.weight}</td>
              <td>\${orderPrice}</td>
              <td style="width : 150px;">
	              <input class="form-style" 
	              type="text" id="finalPrice\${i}" 
	              onclick = "makeSumforfinalPrice(event)"
	              onchange = "makeSumforfinalPrice(event)"
	              name="finalPrice" value="\${salePrice}">
              </td>
              <td style="width : 100px;"><input 
              onclick = "makeSumforquantity(event)" 
	          onchange = "makeSumforquantity(event)" 
	              
              id="quantity\${i}" class="form-style" type="number" name="quantity" value=0></td>
              <td style="width : 180px;"><input readonly type="text" id="sum\${i}" name="sum" class="form-style" value="0" /></td>
              <td style="display : flex; justify-content : center;">
              	<button type="button" onclick="document.querySelector('#tr\${i}').innerHTML = '', assignNumber(), showToast()" id="button\${i}" class="btn button btn-sm" style="background : #1d5c83; color : white;">삭제</button>
              </td>
            </tr>`
          	document.querySelector("#tempOrderTable").insertAdjacentHTML("beforeend", productOrderTable);
			i++;
			}
			document.querySelector("#productBody").innerHTML = "";
			assignNumber();
		})
			makeLoadingComma();
		}
	}); 
	
	function modify(element){
		const buyerCode = document.querySelector('input[name="buyerCode"]').value;
		const deliveryDate = document.querySelector('input[name="deliveryDate"]').value;
		let status = element.innerHTML;
		if(status.search(/\s/) != -1){
			status = status.split(' ').join('');
		}
		let message = document.querySelector(".message").value;
		let orderId = document.querySelector("#orderId").value;
		if(message === null){
			message = "";
		}
		const size = document.querySelectorAll("input[name='productCode']");
		const itemInfo = [];
		let inputElems = document.querySelectorAll(".productList");
		inputElems.forEach((inputElem) => {
		
		let productCode = inputElem.querySelector("input[name='productCode']").value;
		  let number = inputElem.querySelector("input[name='sum']").value.replace(",", "");
		  let sum = Number(number);
		  let quantity = Number(inputElem.querySelector("input[name='quantity']").value);
		  let fp = inputElem.querySelector("input[name='finalPrice']").value.replace(",", "");
		 let finalPrice = Number(fp);
		 const arr ={
				 productCode,
				 sum,
				 quantity,
				 finalPrice
				 
		 }
		 
		 itemInfo.push(arr);
		});
		
         
		const buyerInfo = {
			buyerCode,
			deliveryDate,
			message,
			status,
			orderId
		}
		const data = {
			ohd : buyerInfo,
			oid : itemInfo
		}
		fetch(path+"/order/purchaseOrder", {
			method : "POST",
			headers : {
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		})
	}
	  document.getElementById('modified').value = new Date().toISOString().substring(0, 10)
	
	 function assignNumber() {
		if(document.querySelectorAll(".oiNumber")){
			
		const oiNumber = document.querySelectorAll(".oiNumber")
		for(let i = 0; i < oiNumber.length; i++){
			let a = i;
			oiNumber[i].innerHTML = ++a;
			}
	
		}
	}
	 assignNumber()
	 
	 function deleteSavedTempOrder(event){
		 const orderId = document.querySelector("#orderId").value;
		 const productCode = event.target.dataset.productCode;
		 const data = {
				 'orderId' : orderId,
				 'productCode' : productCode
		 }
		 fetch(path+"/order/deleteOrder",{
			 method : "DELETE", 
			 headers : {
				"Content-Type" : "application/json"
				},
			body : JSON.stringify(data)
		 })
		 .then(res => res.json())
		 .then(data => {
			 showToast();
		 })
	 }
	 
	 function showToast(){
		 const deleteOrderToast = document.querySelector("#deleteOrderToast");
		 const deleteToast = new bootstrap.Toast(deleteOrderToast);
		 deleteToast.show();
	 }
	 
	 function makeComma(event){
		 event.target.value = event.target.value.toLocaleString()
	 }
	 
	 function makeLoadingComma(){
		 if(document.querySelectorAll("input[name='finalPrice']")){
			 
		 let finalPrice = document.querySelectorAll("input[name='finalPrice']")
		 let quantity = document.querySelectorAll('input[name="quantity"]')
		 let sum = document.querySelectorAll('input[name="sum"]')
		 for(let i = 0; i < finalPrice.length; i++){
			let fp = finalPrice[i].value;
			let qt = quantity[i].value;
			sum[i].value = (fp*qt).toLocaleString();
			
		 	}
		 }
	 }
	 makeLoadingComma()
	 
	
	</script>
</body>
</html>