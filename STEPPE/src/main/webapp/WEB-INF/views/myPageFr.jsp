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
<style>
			.about {
				color: black;
			}
			input{
			color:black;
			}
			table {
				color: black;
			}
			
			.category {
				width: 10%;
			}
			
			input#complete {
				width: 75px;
				background: #0f1c34;
				box-sizing: border-box;
				border-radius: 5px;
				border: 1px solid white;
				color: #fff;
				font-weight: bold;
				font-size: 14px;
				outline: none;
				cursor: pointer;
			}
			.proimg{
				width: auto;
				height: 400px;
			}
			.btn {
				color: white;
				margin-top: 0px;
				width:80px;
			}
						
			.btn:hover {
				background-color:  #1ee1b9;
				color: white;
				/* margin-top: 0px; */
			}
			
</style>
</head>
  <body>
    <jsp:include page="header.jsp" />
   	<jsp:include page="mypagefrmenu.jsp" />
	<!--메인페이지 영역-->
	<div class="about">
         <div class="container" style="height: 100%;">
            <hr/>
            <%-- <h3>즐겨찾기 프로젝트 리스트</h3>
            ${plist4} --%>
            <h3>대기중 프로젝트 리스트</h3>
            ${plist1}	
            <hr/>
            <h3>진행중 프로젝트 리스트</h3>
            ${plist2}
            <hr/>
            <h3>완료된 프로젝트 리스트</h3>
            ${plist3}
            <hr/>
         </div>
   </div>      
   <hr>
   
      
    <!-- 푸터 영역 -->  
	<jsp:include page="footer.jsp" />
	
    <script src="resources/js/jquery-3.2.1.min.js"></script>		
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
    
</body>

</html>