<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
		<style>
			table {
			
				margin: 0 auto;
			}
			
			td,th {
				text-align:center;
				color: black;
				padding: 3px;
			} 
			
			input {
				color: black;
				width: 723px;
			}
			
			.btn {
				color: white;
				margin-top: 0px;
				width:60px;
			}
			
			.btn:hover {
				background-color:  #1ee1b9;
				color: white;
				margin-top: 0px;
			}
		</style>   
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<!--메인페이지 영역-->
		<div class="about">
			<h4 align="center">결제 관리</h4>
			<div class="container" style="text-align:center;">
				<table class="table table-responsive" >
					<tr>
						<th>결제 NO.</th>
						<th>내역 NO.</th>
						<th>결제액</th>
						<th>결제자</th>
						<th>프로젝트 NO.</th>
						<th>결제 구분</th>
						<th>상세 보기</th>
					</tr>
					${prlist}
					
					<tr>
						<td colspan="9" align="center">${paging}</td>
					</tr>
				</table>
			</div>				
			
		
		</div>
		<hr>
		<div class="row"></div>
		 
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