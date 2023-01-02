
<%@tag import="java.time.LocalDate"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- c커스텀 태그 사용하기 위해 --%>
<%@ attribute name="active" required="false" %> <%-- narvar active 초기값 false --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>


<style>

</style>

<nav class="navbar fixed-top">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">쉐어드원 3조 오더관리 시스템</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">메인</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-light fa-house-chimney"></i>주문
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">주문관리</a></li>
              <li><a class="dropdown-item" href="#">제품관리</a></li>
            </ul>
          </li>
                    <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-light fa-file-lines"></i>리포트
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