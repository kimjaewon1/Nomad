<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>steppe 견적 요청</title>
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
			
			td {
				padding: 3px;
			}
			
			input {
				color: black;
				width: 723px;
			}
			
			.btn {
				color: white;
				margin-top: 0px;
				width:200px;
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
			<h4 align="center">견적 문의 하기</h4>
			<%-- <form action="sendEstimate?mid=${member.m_id}" method="post"> --%>
			<form action="sendEstimate" method="post">
				<table>
					<tr>
						<td>
							<input type="text" name="e_title" placeholder="제목" />
						</td>
					</tr>
					<%-- <tr>
						<td>
							<input type="text" name="mid" placeholder="${mid}" />
						</td>
					</tr> --%>
					<tr>
						<td>
							<textarea rows="20" cols="100" name="e_content" style="resize: none; color:black;" placeholder="글 내용"></textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="hidden" name="mid" value="${mid}"/>
							<input type="submit" class="btn" value="견적 요청 하기" /> 
						</td>
					</tr>
				</table>
			</form>
			
		
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