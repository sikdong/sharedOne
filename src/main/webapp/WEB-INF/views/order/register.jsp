<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %> --%>
<!DOCTYPE html>
<html>
<head>
<style>

.root {
	width: 77vw;
	margin: 3% 3% 0 20%;
}

.mt-5 {
	margin-top: 5px;
}
.ml-3 {
	margin-left : 3%;
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


	<div class="root">
		<div style="font-size: 30px;">
			<strong>주문서 등록</strong>
		</div>
		<div style="margin-top: 5%; font-size: 22px; color: blue;">
			주문서정보
		</div>
		<hr style="width: 10%" />
		<button>임시저장</button>
		<button>닫기</button>
		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
			data-bs-target="#productModal">제품검색
		</button>
		<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
			data-bs-target="#buyerModal">바이어검색
		</button>
		
		<div style="width : 77vw;" class="jcsb mt-5">
			<div class="form-width jcsb">
				<label for="staticEmail" class="col-form-label">제품코드</label>
				<div class="ml-3">
					<input type="text" class="form-control"
						id="staticEm77vwail" value="email@example.com">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">제품명</label>
				<div class="ml-3">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">등록일</label>
				<div class="ml-3">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
		</div>
		<div style="width : 77vw;" class="jcsb mt-5">
			<div class="jcsb form-width jcsb">
				<label for="staticEmail" class=" col-form-label">바이어코드</label>
				<div class="ml-3">
					<input type="text" class="form-control"
						id="staticEmail" value="email@example.com">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">바이어명</label>
				<div class="ml-3">
					<input type="text" class="form-control" id="inputPassword">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">수량</label>
				<div class="ml-3">
					<input type="number" class="form-control" id="inputPassword">
				</div>
			</div>
		</div>
		<div style="width : 77vw;" class="jcsb mt-5">
			<div class="form-width jcsb">
				<label for="staticEmail" class="col-form-label">원가</label>
				<div class="ml-3">
					<input type="text" class="form-control"
						id="staticEmail" value="email@example.com">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">단가</label>
				<div class="ml-3">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			<div  class="form-width jcsb">
				<label for="inputPassword" class=" col-form-label">납기요청일</label>
				<div class="ml-3">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
		</div>
		<div style="width : 77vw;" class="mt-5">
			<label for="inputPassword" class=" col-form-label">비고</label>
			<div class="ml-3">
				<textarea rows="5" class="form-control" id="inputPassword"></textarea>
			</div>
		</div>
			<button style="margin-left : 43%;" class="mt-5">등록</button>
		<br />
		<br />
		<br />
		<hr style="width : 77vw;"/>
                <table class="table table-hover table-bordered table-sm caption-top">
                    <caption style="font-weight: bold; font-size: large;">상세정보</caption>
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th style="text-align: center;" scope="col" colspan="2">제품정보</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">바이어명</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">등록일</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">납기요청일</th>
                        <th style="text-align: center;" scope="col" colspan="5">금액정보</th>
                        <th style="text-align: center; vertical-align: middle;" scope="col" rowspan="2">삭제여부</th>
                      </tr>
                      <tr>
                        <th>#</th>
                        <th>제품명</th>
                        <th>단위</th>
                        <th>단가</th>
                        <th>공급가액</th>
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
		        <button style="margin-left: 42%;" type="submit" class="mt-5 btn btn-primary btn-sm waves-effect waves-light">주문등록</button>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
		

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="buyerModal" tabindex="-1"
		aria-labelledby="buyerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 me-2" id="buyerModalLabel">바이어 검색</h1>
					<form class="d-flex" role="search">
						<input class="form-control" type="search" placeholder=""
							aria-label="검색">
						<button style="width: 100px;" class="btn btn-outline-primary"
							type="submit">검색</button>
					</form>
					<div class="dropdown">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							</a>

						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">바이어1</a></li>
							<li><a class="dropdown-item" href="#">바이어2</a></li>
							<li><a class="dropdown-item" href="#">바이어3</a></li>
						</ul>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
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
							<tr>
								<th>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault">
									</div>
								</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">선택</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품 모달 -->
	<div class="modal fade" id="productModal" tabindex="-1"
		aria-labelledby="buyerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 me-2" id="productModalLabel">제품 검색</h1>
					<form class="d-flex" role="search">
						<input class="form-control" type="search" placeholder=""
							aria-label="검색">
						<button style="width: 100px;" class="btn btn-outline-primary"
							type="submit">검색</button>
					</form>
					<div class="dropdown">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							</a>

						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">제품1</a></li>
							<li><a class="dropdown-item" href="#">제품2</a></li>
							<li><a class="dropdown-item" href="#">제품3</a></li>
						</ul>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">제품코드</th>
								<th scope="col">제품그룹</th>
								<th scope="col">제품명</th>
								<th scope="col">제조사</th>
								<th scope="col">무게</th>
								<th scope="col">규격</th>
								<th scope="col">단위</th>
								<th scope="col">원가</th>
								<th scope="col">특이사항</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault">
									</div>
								</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
						</tbody>
					</table>
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
</body>
</html>