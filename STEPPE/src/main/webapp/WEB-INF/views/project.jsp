<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			.thumbnail img {
				width: 100%;
			}
			
			input {
				color: black;
				border-radius: 5px;
				border: 1px solid grey;
			}
			
			input#searchBtn {
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
			
			input#insertBtn {
				background: #0f1c34;
				box-sizing: border-box;
				border-radius: 5px;
				border: 1px solid white;
				color: #fff;
				font-weight: bold;
				font-size: 14px;
				outline: none;
				cursor: pointer;
				float: right;
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
			#btnbox{
				margin-left:80px;
				
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		
		<!--메인페이지 영역-->
		
			<div class="about">
				<div id="btnbox">
					<a href="developList"><input type="button" id=btn1 class="btn" value="개발 보기"/></a>
					<a href="designList"><input type="button" id=btn2 class="btn" value="디자인 보기"/></a>
				</div>
				${plist}
				${plist2}
				${plist3}
				<c:set var="m_kind" value="${m_kind}" />
				<c:if test="${m_kind eq 'C'}">
					<a href="goAddProject"><input type="button" id="insertBtn" value="프로젝트 등록"/></a>
				</c:if>
				${splist}
			</div>
		
		<hr>
	
		<!-- 푸터 영역 -->  
		<jsp:include page="footer.jsp" />
	
	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="resources/js/jquery-3.2.1.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<!-- <script src="resources/js/bootstrap.min.js"></script> -->
		<script src="resources/js/wow.min.js"></script>
		<script>wow = new WOW({}).init();</script>
	
	</body>
	<script>
		$("#searchBtn").click(function(){
			var keyword=$("#keyword").val();
			if(keyword==null || keyword==""){
				alert("검색어를 입력하시오");
			}
			else{
				$("#search").submit();
			}
		});
		function bookmarkOn(num){
			var bmNum = num;
			//alert(bmNum);
			
			$.ajax({
				type:'post',
				url: 'bookmarkOnOff',
				data: {bmNum:bmNum},
				success: function(data){
					console.log(data);
					if(data != 0){
						$("#bookmarkImg"+num).attr("src","resources/img/on.png");							
					}else{
						$("#bookmarkImg"+num).attr("src","resources/img/off.png");
					}
				}
			});
		}
		function bookmarkOff(num){
			alert(num);
		}
	</script>
</html>