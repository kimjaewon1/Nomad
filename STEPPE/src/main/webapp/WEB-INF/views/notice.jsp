<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			color:black;
			margin: 0 auto;
		}
		
		td,th {
			text-align: center;
			color:black;
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
		
		.radio {
			color: black;
		}
		
		label {
			color: black;
		}
		
		#image_preview img {
			width: 250px;
			height: 250px;
		}
		#userImage{
			margin:0 auto;
			width: 250px;
		}
		ui{
			width: 150px;
			list-style: none;
			
		}
		li{
			display: inline;
			
		}
		#choseClient{
			width: 150px;
		}
		
	</style>
</head>
<body>
	<!--상단 메뉴바-->
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h3>공지사항</h3><br/>
		<div class="container" style="height: -webkit-fill-available;">
			<table class="table table-responsive">
				${nlist}
				<tr>
					<td colspan="6" align="center">${paging}</td>
				</tr>
			</table>
				<br />
				
				<c:set var="m_kind" value="${member.m_id}"/>
			<c:if test="${m_kind eq 'admin'}">
	         <form action="noticeWrite">
	            <button class="btn" >글쓰기</button>
	         </form>
	        </c:if>
		</div>
	</div>

	<div class="row"></div>
	<!--푸터 영역 시작-->
	
	<jsp:include page="footer.jsp" />

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
	
</body>
</html>

