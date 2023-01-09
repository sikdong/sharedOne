<!DOCTYPE html>
<%@tag import="java.time.LocalDate"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- c커스텀 태그 사용하기 위해 --%>
<%@ attribute name="active" required="false" %> <%-- narvar active 초기값 false --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<c:url value="/member/logout" var="logoutLink"/>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- JQuery CDN 연동 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style>
    .sideDiv{
        position: fixed;
        width: 16%;

        min-width: 270px;
        max-width: 270px;

        height: 100vh;
        background: #1d5c83;
        color: #e3e3e3;
        font-size: large;
        padding-left: 20px;
        padding-right: 10px;
        padding-top: 10px;
    }
    .list-head{
        margin-left: 10px;
        text-align: left;

        width: 150px;

    }
    .threeline{
        color: #e3e3e3;
    }
    .threeline:hover{
        color: #e3e3e3;
    }
    .listbtn{
        text-align: right;
        margin-left: 45px;
        width: 50px;
    }
    .fa-bars{
        font-size: 25px;
    }
    .list-row{
        margin-bottom: 20px;
    }
    ul ul{
        margin-left: 4px;
        margin-bottom: 25px;
    }
    li{
        list-style: none;
    }
    li a{
        text-decoration: none;
        color: #e3e3e3;
    }
    .li-div{
        margin-bottom: 10px;
        color: #e3e3e3;
    }
    .border-bottom{
        color: #e3e3e3;
    }
    .sideHead{
        justify-content: center;
        color: #e3e3e3;
    }
        </style>
<body>
    <div class="row">
    <div class="sideDiv">
        <div class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none" style="border-bottom: 1px solid #5e6e82; justify-content: center;">
          <h1 class="sideHead">Order</h1>
        </div>
        <ul class="list-unstyled ps-0">
          <li class="mb-1">
            <div class="row list-row">
                <div class=" list-head"><i class="fa-regular fa-clipboard"></i>&nbsp; 마스터 관리</div>
                <div class=" listbtn"><a class="threeline" href="#" data-toggle="collapse" data-target="#master-collapse" aria-expanded="false"><i class="fa-solid fa-bars"></i></a></div>
            </div>
            <div class="collapse" id="master-collapse" style="">
              <ul>
                <li>
                    <div class="li-div">
                        <a href="#" class="rounded" style="color: #e3e3e3;">바이어 관리</a>
                    </div>
                </li>
                <li>
                	<c:url value="/master/productList" var="productListLink">
                		<c:param name="" value=""></c:param>
                	</c:url>
                    <div class="li-div">
                        <a href="${productListLink }" class="rounded" style="color: #e3e3e3;">제품 관리</a>
                    </div>
                </li>
                <li>
                	<c:url value="/master/salePriceList" var="salePriceListLink">
                		<c:param name="" value=""></c:param>
                	</c:url>
                    <div class="li-div">
                        <a href="${salePriceListLink }" class="rounded" style="color: #e3e3e3;">가격 관리</a>
                    </div>
                </li>
              </ul>
            </div>
          </li>
          <li class="mb-1">
            <div class="row list-row">
                <div class="list-head"><i class="fa-regular fa-file-lines"></i>&nbsp; 주문 관리</div>
                <div class="listbtn"><a class="threeline" href="#" data-toggle="collapse" data-target="#order-collapse" aria-expanded="false"><i class="fa-solid fa-bars"></i></a></div>
            </div>
            <div class="collapse" id="order-collapse" style="">
                <ul>
                    <li>
                   
                    	<c:url value="/order/list" var="orderListLink">
                			<c:param name="" value=""></c:param>
                		</c:url>
                        <div class="li-div">
                            <a href="${orderListLink }" class="rounded" style="color: #e3e3e3;">주문 목록</a>
                        </div>
                    </li>
                </ul>
            </div>
          </li>
          <li class="mb-1">
            <div class="row list-row">
                <div class="list-head"><i class="fa-brands fa-wpforms"></i>&nbsp; 리포트</div>
                <div class="listbtn"><a class="threeline" href="#" data-toggle="collapse" data-target="#report-collapse" aria-expanded="false"><i class="fa-solid fa-bars"></i></a></div>
            </div>
            <div class="collapse" id="report-collapse">
                <ul>
                    <li>
                        <div class="li-div">
                            <a href="#" class="rounded" style="color: #e3e3e3;">월별 리포트</a>
                        </div>
                    </li>
                    <li>
                        <div class="li-div">
                            <a href="#" class="rounded" style="color: #e3e3e3;">영업 리포트</a>
                        </div>
                    </li><li>
                        <div class="li-div">
                            <a href="#" class="rounded" style="color: #e3e3e3;">바이어 리포트</a>
                        </div>
                    </li>
                  </ul>
            </div>
          </li>
          <li class="mb-1">
            <div class="row list-row">
                <a href="${logoutLink}" class="list-head" style="text-decoration: none;color: #e3e3e3;"><i class="fa-regular fa-file-lines"></i>&nbsp; 로그아웃</a>
            </div>
          </li>
          <li class="my-3"style="border-top: 1px solid #5e6e82;"></li>
        </ul>
      </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script>


</script>
</body>
</html>