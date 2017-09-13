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
<!-- =======================================================
        Theme Name: Day
        Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
	<style>
		.navbar-header {
			/*background-color: dimgrey;*/
			
		}
		
		#join {
			/* width: 300px; */
			/* background-color: lightgrey; */
			text-align: center;
		}
		
		table {
			margin: 0 auto;
			color: black;
		}
		
		td {
			padding: 3px;
		}
		
		input {
			color: black;
		}
		
		.btn {
			color: white;
			margin-top: 0px;
		}
		
		.btn:hover {
			background-color:  #1ee1b9;
			color: white;
			margin-top: 0px;
		}
		
		
		
	</style>
</head>
<body>
	<!-- 헤더 영역 -->  
	<jsp:include page="header.jsp" />
	
	<form action="noticeInsert" method="post">
			<table>
				<tr>
					<td><h3>공지사항 쓰기</h3></td>
				</tr>
				<tr>
					<td><input type="text" name="n_title" placeholder="글 제목"/></td>
				</tr>
				<tr>
					<td><textarea rows="20" cols="100" name="n_content" style="resize: none;" placeholder="글 내용"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn"  value="글작성"/>
						<input type="reset"  class="btn" value="취소"/>
						<input type="button" class="btn" onClick="location.href='./goNotice'" value="리스트 보기"/>
					</td>
				</tr>
				
			</table>
		</form>
	
		
	<div class="row"></div>
	<!-- 푸터 영역 -->  
	<jsp:include page="footer.jsp" />


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
	
</body>
</html>






