<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Steppe</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/sb-admin.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	<style>

.dropmenu {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropmenu a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropbtn {
	padding: 30px;
	text-align: left;
	color: gray;
}
</style>
</head>

<body style="background-color: #fff;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main">Steppe</a>
			</div>
			<!-- Top Menu Items -->
			<div class="navbar-collapse collapse">
			<div class="menu">
			<ul class="nav nav-tabs" role="tablist" style="float:right; ">
						<c:if test="${!empty m_id}">
							<li role="presentation" onclick="myFunction()" class="dropbtn">
								${member.m_id}님 어서오세요.
								<div id="myDropdown" class="dropmenu">
									<c:set var="m_kind" value="${m_kind}" />
									<c:if test="${m_kind eq 'C'}">
										<a href="goAddProject">프로젝트 등록</a>
										<a href="goPms">프로젝트 관리</a>
									</c:if>
									<a href="goMyProfile">프로필</a>
									<a href="updateInfo">회원수정</a>
									<a href="goMyPage">마이페이지</a>

									<c:if test="${m_id eq 'admin'}">
										<a href="goMemberMM"> 회원관리 </a>

									</c:if>
									<c:if test="${m_id eq 'admin'}">
										<a href="goProjectMM"> 프로젝트 관리 </a>
									</c:if>
									<c:if test="${m_id eq 'admin'}">
										<a href="goReportList"> 신고 관리 </a>
									</c:if>

									<c:if test="${m_id eq 'admin'}">
										<a href="goFstMM"> 자격 시험 관리 </a>
									</c:if>
									<c:if test="${m_id eq 'admin'}">
										<a href="goPurchaseMM"> 결제 관리 </a>
									</c:if>
									<a href="logout">logout</a>
								</div>

							</li>
						</c:if>
						<li role="presentation"><c:if test="${null eq m_id }">
								<a href="goLogin">로그인</a>
							</c:if></li>
						<li role="presentation"><c:if test="${null eq m_id}">
								<a href="goJoin">회원가입</a>
							</c:if>
						</li>
					</ul>
			</div>
		</div>
	<!-- jQuery -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
<script>
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {

	    var dropmenus = document.getElementsByClassName("dropmenu");
	    var i;
	    for (i = 0; i < dropmenus.length; i++) {
	      var openDropdown = dropmenus[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
</script>
</html>
