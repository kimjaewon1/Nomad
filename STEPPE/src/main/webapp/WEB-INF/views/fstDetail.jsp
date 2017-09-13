<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/css/style.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Steppe</title>
<style>
	table{
		color: black;
	}
	td{
		text-align: center;
		font-size: 20px;
	}
	.buttonA{
				width:85px;
				background: #0f1c34;
				box-sizing: border-box;
				border-radius: 5px;
				border: 1px solid white;
				color: #fff;
				font-weight: bold;
				font-size: 14px;
				outline: none;
				cursor: pointer;
				text-align: center;
			}
			.AA{
				color:#fff;
			}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="about" style="height: -webkit-fill-available;">
		<div class="container">
			<table class="table table-striped">
				<tr><td>${test.t_num}</td><td style="text-align: center;">${test.t_content}</td></tr>
				<tr><td>1번</td><td class="tcontent">${test.t_no1}</td></tr>
				<tr><td>2번</td><td class="tcontent">${test.t_no2}</td></tr>
				<tr><td>3번</td><td class="tcontent">${test.t_no3}</td></tr>
				<tr><td>4번</td><td class="tcontent">${test.t_no4}</td></tr>
				<tr><td>정답</td><td class="tcontent">${test.t_answer}</td></tr>
			</table>
		</div>
	</div>
			<br/>
			<button class='buttonA'><a href="javascript:history.go(-1)" class='AA'>뒤로가기</a></button>
			</div>

	<div class="row"></div>
	<hr/>
		 
		<!-- 푸터 영역 -->  
		<jsp:include page="footer.jsp" />
</body>
	<script src="resources/js/jquery-3.2.1.min.js"></script>		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
</html>