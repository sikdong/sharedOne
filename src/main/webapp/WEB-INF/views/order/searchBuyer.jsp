<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>

.root {
	width: 77vw;
	height : 100vh;
	margin: 3% 3% 0 20%;
	display : flex;
	justify-content : center;
}

.mt-5 {
	margin-top: 5px;
}
.ml-1 {
	margin-left : 1%;
}

.jcsb {
	display: flex;
	justify-content: space-between !important;
}

.form-width {
	width : 21vw !important;
}

.root-width{
	width : 77vw;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

		<div class="root">
			<div class="root-width">
				
				<div style="font-size: 30px;">
					<strong>주문서 등록</strong>
				</div>
				
				<div class="mt-5" style="display : flex; justify-content : center;"> 
					
					<label class="modal-title fs-5 me-2" id="buyerModalLabel">
						<strong>바이어 검색</strong>
					</label>
					
					<form class="d-flex ml-1" role="search" >
						<input class="form-control" type="search" placeholder=""
							aria-label="검색">
						<button style="width: 150px;" class="btn btn-outline-primary"
							type="submit">검색</button>
						<select style="width : 150px !important" class="form-select" aria-label="Default select example">
						  <option selected>선택</option>
						  <c:forEach items="${buyers }" var="buyer" varStatus="status">
						  <option value="${status.count }">${buyer.buyerName }</option>
						  </c:forEach>
						</select>
					
					<div style="display : flex; margin-left : 10%">
						<div class="modal-title fs-5" style="padding-right : 3%; min-width : 120px;" id="buyerModalLabel">
							<strong>납기 요청일</strong>
						</div>
						<input type="date" />
					</div>
					</form>
					
				 </div> 
				 <br />
				 <br />
				 <br />
				 <br />
				<div class="mt-5">
					<table class="table">
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
								<th scope="col">특이사항</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${buyers }" var="buyer">
							<tr>
								<th>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault">
									</div>
								</th>
								<td>${buyer.buyerCode }</td>
								<td>${buyer.buyerName }</td>
								<td>${buyer.country }</td>
								<td>${buyer.address }</td>
								<td>${buyer.businessNumber }</td>
								<td>${buyer.manager }</td>
								<td>${buyer.deliveryCompany }</td>
								<td>${buyer.phone}</td>
								<td style="text-align : center;">-</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer" style="display : flex; justify-content : center;">
					<!-- 폼 제출로 가야함 -->
					<button class="btn btn-primary mt-5">선택</button>
				</div>
				<!-- 만약 바이어가 2명이 체크된다면 1명만 체크해야 한다고 알려주기 -->
				
	 		</div>
		</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>