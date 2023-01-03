
<%@tag import="java.time.LocalDate"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- c커스텀 태그 사용하기 위해 --%>
<%@ attribute name="active" required="false" %> <%-- narvar active 초기값 false --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
*{
	font-family: sans-serif;
}
 .logoImg{
 	width: 200px;
 	height: 100px
 }
 .headFont{
 	font-size: 20px;
 }
 .offcanvas{
 	background: azure;
 }
</style>

<nav class="navbar fixed-top">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
	      <div class="logoImg">
		      <img style="width: 300px; height: 100px;" src="${pageContext.request.contextPath}/content/order.jpg" alt="로고사진" />
		        <!-- <h5 class="offcanvas-title" id="offcanvasNavbarLabel">쉐어드원 3조 오더관리 시스템</h5> -->
	      </div>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle headFont" style="color: black" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-brands fa-wpforms headFont"></i>&nbsp&nbsp주문
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">주문관리</a></li>
              <li><a class="dropdown-item" href="#">제품관리</a></li>
            </ul>
          </li>
                    <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle headFont" style="color: black" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
             <i class="fa-regular fa-clipboard headFont"></i>&nbsp&nbsp리포트
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">월간 리포트</a></li>
              <li><a class="dropdown-item" href="#">바이어 리포트</a></li>
              <li><a class="dropdown-item" href="#">영업 리포트</a></li>
              <li><a class="dropdown-item" href="#">승인여부 별 리포트</a></li>
            </ul>
          </li>
        </ul>

      </div>
    </div>
  </div>
</nav>