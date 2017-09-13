<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Steppe</title>
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
}
.dropbtn:HOVER {
	background-color: white;
}
#dropbtnFont{
	color: white;
}
#dropbtnFont:HOVER {
	color: black;
}
</style>
</head>
<body>

<!--상단 메뉴바-->
	<header id="header">
	 <nav class="navbar navbar-default navbar-static-top" role="banner">
	<div class="container" style="width: 100%;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="navbar-brand">
				<a href="main"><h1>steppe</h1></a>
			</div>
		</div>
		<div class="navbar-collapse collapse">
			<div class="menu">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation">
						<a href="goIntro">steppe?</a>
					</li>
					<li role="presentation">
						<a href="goNotice">공지사항</a>
					</li>
					<li role="presentation">
						<a href="goProject">프로젝트</a>
					</li>
					<li role="presentation">
						<a href="goFreelancer">프리랜서</a>
					</li>
					<li role="presentation">
						<a href="goManual">이용방법</a>
					</li>
					
					<c:if test="${!empty m_id}">

						<li role="presentation" onclick="myFunction()" class="dropbtn" id="dropbtnFont">
							<c:set var="m_kind" value="${m_kind}" />
							<c:if test="${m_kind eq 'C'}">
								클라이언트님 어서오세요.
							</c:if>
							<c:if test="${m_kind eq 'F'}">
								프리랜서님 어서오세요.
							</c:if>
							<c:if test="${m_kind eq 'A'}">
								관리자님 어서오세요.
							</c:if>

							<div id="myDropdown" class="dropmenu">
								<c:if test="${m_kind eq 'C'}">
									<a href="goAddProject">프로젝트 등록</a>
									<a href="goPms">프로젝트 관리</a>
									<a href="updateInfo">회원수정</a>
									<a href="goMyPage">마이페이지</a>
								</c:if>
								<c:if test="${m_kind eq 'F'}">
									<a href="goPms">프로젝트 관리</a>
									<a href="goMyProfile">프로필</a>
									<a href="updateInfo">회원수정</a>
									<a href="goMyPage">마이페이지</a>
								</c:if>
								

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
					<li role="presentation">
						<c:if test="${null eq m_id }">
							<a href="goLogin">로그인</a>
						</c:if></li>
					<li role="presentation">
						<c:if test="${null eq m_id}">
							<a href="goJoin">회원가입</a>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</nav> 
	</header>
	<!--상단 메뉴바 영역 끝-->

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