<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Steppe</title>
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/css/style.css" rel="stylesheet" />	
    <!-- =======================================================
        Theme Name: Day
        Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
  </head>
  <body>
    <jsp:include page="header.jsp" />
      
    <!--carousel 영역-->
	<div class="slider">		
		<div id="about-slider">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators visible-xs">
					<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-slider" data-slide-to="1"></li>
					<li data-target="#carousel-slider" data-slide-to="2"></li>
				</ol>
			
			</div>	
    	</div>
	<!--메인페이지 영역-->
	<div class="about">
		<div class="container">
			<div class="section">
				<h1 style="color:black; text-align: center;">더 쉽고 간편해진 '지원자 보기'</h1>
				<p>지원자 목록과 지원자의 상세정보를 한눈에 볼 수 있는 '분리형 레이아웃'</p>>
				<p>프리랜서의 상세 정보를 보고 싶을 때는 '지원서 탭'</p>
				<p>프리랜서의 경력, 포트폴리오, 리뷰 등을 보고 싶을 때는 '프로필 탭'</p>
				<p>프리랜서가 제출한 상세 견적을 보고 싶을 때는 '상세 견적 탭'</p>
				<p>지원자 관리, 미팅, 견적, 계약까지 '프리모아'에서는 한눈에 사용하세요.</p>
			
			</div>
			<div class="section">
				<h1 style="color:black; text-align: center;">더 쉽고 간편해진 '지원자 보기'</h1>
				<p>지원자 목록과 지원자의 상세정보를 한눈에 볼 수 있는 '분리형 레이아웃'</p>>
				<p>프리랜서의 상세 정보를 보고 싶을 때는 '지원서 탭'</p>
				<p>프리랜서의 경력, 포트폴리오, 리뷰 등을 보고 싶을 때는 '프로필 탭'</p>
				<p>프리랜서가 제출한 상세 견적을 보고 싶을 때는 '상세 견적 탭'</p>
				<p>지원자 관리, 미팅, 견적, 계약까지 '프리모아'에서는 한눈에 사용하세요.</p>
			
			</div>
			<div class="section">
				<h1 style="color:black; text-align: center;">더 쉽고 간편해진 '지원자 보기'</h1>
				<h3>프로젝트 리뷰</h3>
				<p>
					만족도, 전문성 등 5가지 핵심 분야에 대한 평가와 함께
					프리랜서에 대한 코멘트로 클라이언트의 솔직한 후기를 확인하실 수 있습니다.
				</p>
				<h3>리뷰</h3>
					<p>프리랜서의 상세 정보를 보고 싶을 때는 '지원서 탭'</p>
				<p>프리랜서의 경력, 포트폴리오, 리뷰 등을 보고 싶을 때는 '프로필 탭'</p>
				<p>프리랜서가 제출한 상세 견적을 보고 싶을 때는 '상세 견적 탭'</p>
				<p>지원자 관리, 미팅, 견적, 계약까지 '프리모아'에서는 한눈에 사용하세요.</p>
			</div>
		</div>
	</div>			
	</div>
	<hr>
      
    <!-- 푸터 영역 -->  
    <jsp:include page="footer.jsp" />
      
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/js/jquery-3.2.1.min.js"></script>		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
    
</body>
</html>