<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<style>

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
<title>Insert title here</title>
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
	<my:sidebar></my:sidebar>
<div class="root">
		<div style="font-size: 30px;">
			<strong>주문서 등록</strong>
		</div>
		
		
		<div style="margin-top: 5%; font-size: 22px; color: blue;">
			주문서정보
		</div>
		
		<hr style="width: 10%" />
		<br />
		<div><strong>바이어 선택</strong></div>
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
							 <div class="mb-5">
								<p class="filterText ">납기 요청</p>
							</div> 
						</div><!-- 좌측 조건 설명 div 끝 -->
						
						<!-- *우측* 검색 필터 -->
						<div class="col-sm-10 mt-1">
								<!-- 검색필터 1st row : 전체 검색. -->
								<div class="row d-flex">
									<div class="col-sm-6 mb-4">
										<div class="input-group">
											<input name="buyerInfo" id="allBuyerInfoInput" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
							        		<button class="btn btn-outline-secondary" type="submit" id="allBuyerInfoBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 1st row 끝 -->
								<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
								<div class="row d-flex">
									<div class="col-sm-3 mb-4">
										<div class="input-group" >
											<input name="" type="search" id="buyerName" class="form-control" list="datalistOptions1" placeholder="바이어명">
											<button class="btn btn-outline-secondary" id="buyerNameBtn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="buyerCode" class="form-control" list="datalistOptions2" placeholder="바이어코드">
											<button class="btn btn-outline-secondary" id="buyerCodeBtn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>	
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="country" class="form-control" list="datalistOptions3" placeholder="국가">
											<datalist id="datalistOptions3">
												<c:forEach items="${types }" var="type">
													<option value="${type }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" id="countryBtn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 2nd row 끝 -->
								<!-- 검색필터 3rd row : 기간 선택 -->
								<div class="row d-flex">
									<div class="col-sm-5">
										<div class="input-group" style="margin-top :15px !important;">
											<input name="d1" type="date" id="d1Id" class="form-control">
										</div>
									</div>
								</div>	
							</div><!-- 우측 검색 조건 div 끝 -->
						</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
						
					</div><!-- container-sm div 끝-->
					
					<div class="mt-5" id="buyerTable">
				</div>
		
		<!-- <div class="container-sm mt-4">
			<div class="row d-flex">
				*우측* 검색 필터
				<div class="col-sm-10 mt-1">
					<form action="" method="">form get? post? 		
						검색필터 1st row : 전체 검색.
						검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  )
						<div class="row d-flex">
							<div class="col-sm-3 mb-4">
								<div>바이어명</div>
								<div class="input-group mt5">
									<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="">
									<button data-bs-toggle="modal" data-bs-target="#buyerModal" class="btn btn-outline-secondary" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
								</div>
							</div>
							<div class="col-sm-3">
								<div>바이어코드</div>
								<div class="input-group mt5">
									<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="">
								</div>	
							</div>
							<div class="col-sm-3">
								<div>국가</div>
								<div class="input-group mt5">
									<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="">
								</div>
							</div>
							<div class="col-sm-3">
								<div>납기 요청일</div>
								<div class="input-group mt5">
									<input name="" value="" type="text" class="form-control" list="datalistOptions4" id="exampleDataList4" placeholder="">
								</div>
							</div>
						</div>2nd row 끝
						검색필터 3rd row : 기간 선택
					</form>	
				</div>우측 검색 조건 div 끝
			</div>좌측 + 우측 전체를 감싸는 d-flex 끝
		</div>container-sm div 끝 -->
		
		<br />
		<hr />
		<br />
		<div><strong>제품 선택</strong></div>
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
											<input name="buyerInfo" id="allBuyerInfoInput" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
							        		<button class="btn btn-outline-secondary" style="cursor : pointer" id="allBuyerInfoBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 1st row 끝 -->
								<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
								<div class="row d-flex">
									<div class="col-sm-3 mb-4">
										<form action="">
										<div class="input-group" >
											<input type="text" id="allProductInfo" class="form-control" list="datalistOptions1" placeholder="제품명">
											<datalist id="datalistOptions1">
												<c:forEach items="${productList }" var="product">
													<option value="${product.productCode }">
												</c:forEach>
											</datalist>
											<button id="allProductInfoBtn"class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
										</form>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="제품코드">
											<datalist id="datalistOptions2">
												<c:forEach items="${productList }" var="product">
													<option value="${product.productName }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>	
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="제품그룹">
											<datalist id="datalistOptions3">
												<c:forEach items="${types }" var="type">
													<option value="${type }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 2nd row 끝 -->
								<!-- 검색필터 3rd row : 기간 선택 -->
							</div><!-- 우측 검색 조건 div 끝 -->
						</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
						
					</div><!-- container-sm div 끝-->
		
		<button type="button" class="btn btn-primary">임시저장</button>
		<button type="button" class="btn btn-primary">닫기</button>
			
		
		
		<div style="width : 77vw; display : flex;" class="mt-5">
			<div class="form-width flex">
				<label for="staticEmail" class="col-form-label" style="min-width : 50px;">제품명</label>
				<div class="ml-3 input-group" style="width : 250px !important;">
					<input type="text" class="form-control"
						id="staticEm77vwail" value="email@example.com">
						<button data-bs-toggle="modal" data-bs-target="#productModal" class="btn btn-outline-secondary" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			<div  class="form-width flex">
				<label for="inputPassword" class=" col-form-label">제품코드</label>
				<div class="ml-3">
					<input type="text" class="form-control" id="inputPassword">
				</div>
			</div>
			<div  class="form-width flex">
				<label for="inputPassword" class=" col-form-label">수량</label>
				<div style="margin-left : 7%;">
					<input type="number" class="form-control" id="inputPassword">
				</div>
			</div>
		</div>
		<div style="width : 77vw;" class="flex mt-5">
			<div class="form-width flex">
				<label for="staticEmail" class=" col-form-label">원가	</label>
				<div style="margin-left : 7%;">
					<input type="number" class="form-control"
						id="staticEmail" value="email@example.com">
				</div>
			</div>
			<div  class="form-width flex">
				<label for="inputPassword" class=" col-form-label">단가</label>
				<div style="margin-left : 11%">
					<input type="number" class="form-control" id="inputPassword">
				</div>
			</div>
			<div  class="form-width flex">
				<label for="inputPassword" class=" col-form-label">등록일</label>
				<div style="margin-left : 3%;">
					<input type="text" class="form-control" id="inputPassword">
				</div>
			</div>
		</div>
		
			<button type="button" style="margin-left : 43%;" class="mt-5 btn btn-primary">등록</button>
		<br />
		<br />
		<br />
		<hr style="width : 77vw;"/>
                <table class="table table-hover table-bordered table-sm caption-top">
                    <caption style="font-weight: bold; font-size: large;">상세정보</caption>
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th style="text-align: center;" scope="col" colspan="5">제품정보</th>
                        <th style="text-align: center;" scope="col" colspan="5">금액정보</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">삭제여부</th>
                      </tr>
                      <tr>
                        <th>#</th>
                        <th>제품코드</th>
                        <th>제품그룹</th>
                        <th>제품명</th>
                        <th>규격</th>
                        <th>단위</th>
                        <th>원가</th>
                        <th>단가</th>
                        <th>부가세</th>
                        <th>수량</th>
                        <th>합계액</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider">
                      <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>
                            <button class="btn btn-primary btn-sm">수정</button>
                            <button class="btn btn-primary btn-sm ">삭제</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div style="width : 77vw;" class="mt-5">
					<label for="inputPassword" class=" col-form-label">주문 시 특이사항</label>
					<div class="ml-3">
						<textarea rows="5" class="form-control" id="inputPassword" ></textarea>
					</div>
				  </div>
		        <button style="margin-left: 42%;" type="submit" class="mt-5 btn btn-primary">주문등록</button>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
		

	<!-- Button trigger modal -->

	<!-- Modal -->
	
	<!-- 제품 모달 -->
	<div class="modal fade" id="productModal" tabindex="-1"
		aria-labelledby="buyerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 me-2" id="productModalLabel">제품 선택</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
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
							<form action="" method=""><!-- form get? post?  -->		
								<!-- 검색필터 1st row : 전체 검색. -->
								<div class="row d-flex">
									<div class="col-sm-6 mb-4">
										<div class="input-group">
											<input name="" value="" class="form-control" type="Search" placeholder="전체검색" aria-label="Search">
							        		<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 1st row 끝 -->
								<!-- 검색필터 2nd row : 조건 검색 ( 각자 페이지의 따라 변경  ) -->
								<div class="row d-flex">
									<div class="col-sm-3 mb-4">
										<div class="input-group" >
											<input name="" value="" type="text" id="" class="form-control" list="datalistOptions1" placeholder="제품명">
											<datalist id="datalistOptions1">
												<c:forEach items="${productList }" var="product">
													<option value="${product.productCode }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="" class="form-control" list="datalistOptions2" placeholder="제품코드">
											<datalist id="datalistOptions2">
												<c:forEach items="${productList }" var="product">
													<option value="${product.productName }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>	
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<input name="" value="" type="text" id="" class="form-control" list="datalistOptions3" placeholder="제품그룹">
											<datalist id="datalistOptions3">
												<c:forEach items="${types }" var="type">
													<option value="${type }">
												</c:forEach>
											</datalist>
											<button class="btn btn-outline-secondary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
										</div>
									</div>
								</div><!-- 2nd row 끝 -->
								<!-- 검색필터 3rd row : 기간 선택 -->
							</form>	
						</div><!-- 우측 검색 조건 div 끝 -->
					</div><!-- 좌측 + 우측 전체를 감싸는 d-flex 끝-->
				</div><!-- container-sm div 끝-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">선택</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
	const path = "${pageContext.request.contextPath}"
	
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
					<input class="form-radio-input" type="radio"
						id="flexCheckDefault" name="buyerName">
				</th>
				<td>\${item.buyerCode }</td>
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
					<input class="form-radio-input" type="radio"
						id="flexCheckDefault" name="buyerName">
				</th>
				<td>\${item.buyerCode }</td>
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
					<input class="form-radio-input" type="radio"
						id="flexCheckDefault" name="buyerName">
				</th>
				<td>\${item.buyerCode }</td>
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
					<input class="form-radio-input" type="radio"
						id="flexCheckDefault" name="buyerName">
				</th>
				<td>\${item.buyerCode }</td>
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
	
	document.querySelector("#allProductInfoBtn").addEventListener("click", function(){
		const allProductInfo = document.querySelector("#allProductInfo").value;
		fetch(path+"/order/searchAllProductInfo/"+allProductInfo)
		.then(res => res.json())
		.then(list => {
			document.querySelector("#productTable").innerHTML = "";
			const table = 
				`<table class="table">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">제품코드</th>
				<th scope="col">제품그룹</th>
				<th scope="col">제품명</th>
				<th scope="col">규격</th>
				<th scope="col">무게</th>
				<th scope="col">단위</th>
				<th scope="col">원가</th>
			</tr>
		</thead>
		<tbody id="productBody">
		</tbody>
	</table>`
		document.querySelector("#productTable").insertAdjacentHTML("afterbegin", table)
		for(const item of list){
			const productTableItem =
			
			`<tr>
				<th>
					<input class="form-radio-input" type="radio"
						id="flexCheckDefault" name="buyerName">
				</th>
				<td>\${item.productCode }</td>
				<td>\${item.productType }</td>
				<td>\${item.productName }</td>
				<td>\${item.size }</td>
				<td>\${item.weight }</td>
				<td>\${item.unit }</td>
				<td>\${item.price }</td>
			</tr>`
			document.querySelector("#productBody").insertAdjacentHTML("beforeend", buyerTableItem)
			}
		})
	})
	</script>
</body>
</html>