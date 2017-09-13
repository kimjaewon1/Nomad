<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<style>
			h1{
				color: black;
			}
			.about{
				height: 100%;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		
		<!--메인페이지 영역-->
			
				<div class="about" style="height: 100%;">
					<div class="container">
					<div class="col-md-12 col-xs-12 col-md-12 col-md-lg-12">
						<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
							<img src="resources/img/safety.png" style="width: 100%; height: 250px;"/>
						</div>
						<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
							 
							<h1>Steppe는 편리합니다.</h1>
							<p>
								Steppe은 프로젝트 관리  툴'PMS'를 무료로 이용하실 수 있습니다.
								<br/>
								PMS를 통해 작업 내역을 증빙하고, 개발사와 실시간으로 소통하세요.
							</p>
						</div>	
					</div>
					</div>
					<div class="row"></div>
					<div class="container">
						<div class="col-md-12 col-xs-12 col-md-12 col-md-lg-12">
							
							<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
								 
								<h1>Steppe은 안전합니다.</h1>
								<p>
									프리랜서가 실제로 수행했던 프로젝트 내역과 해당 클라이언트의 솔직한 평가를
									확인하실 수 있습니다. 
									<br/>
									Steppe은 정보를 객관적으로 파악할 수 있도록 노력하고 있습니다.
								</p>
							</div>
							<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
								<img src="resources/img/icon.png" style="width: 100%; height: 250px;"/>
							</div>
						</div>
					</div>
					<div class="row"></div>
					<div class="container">
						<div class="col-md-12 col-xs-12 col-md-12 col-md-lg-12">
							<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
								<img src="resources/img/speed.png" style="width: 100%; height: 250px;"/>
							</div>
							<div class="col-md-6 col-xs-6 col-md-6 col-md-lg-6">
								<h1>Steppe는 쉽고 빠릅니다.</h1>
								<p>
									간편하게 프로젝트를 등록 하실 수 있습니다.
									<br/>등록된 프로젝트는 프리랜서에게 공유되며, 사용자에게 최적화된 검토 시스템을
									통해 프로젝트 지원자의 견적과 프로필을 한눈에 비교하실 수 있습니다.
								</p>
							</div>
						</div>
					</div>
			</div>
		<hr>
	
		<!--푸터 영역 시작-->
		<jsp:include page="footer.jsp"/>
		<!--푸터 영역 끝-->
	
		<script src="resources/js/jquery-3.2.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/wow.min.js"></script>
		<script>wow = new WOW({}).init();</script>
	
	</body>
</html>