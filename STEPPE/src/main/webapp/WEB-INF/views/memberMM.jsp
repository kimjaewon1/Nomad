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
				text-align: center;
				color: black;
				margin: 0 auto;
			}
			
			td,th {
				text-align: center;
				color: black;
				padding: 3px;
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
			input#search{
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
		</style>   
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<!--메인페이지 영역-->
		<div class="about" style="color:black;">
			<div class="container" style="height: -webkit-fill-available;" align="center">
				<table class="table table-responsive" >
					<h3>회원 리스트</h3><br/>
					<tr>
						<td><input type="button" class="btn" onclick="location.href='getClientList'" value="클라이언트 리스트 보기"/></td>
						<td><input type="button" class="btn" onclick="location.href='getFreeLancerList'" value="프리랜서 리스트 보기"/></td>
						<td><input type="button" class="btn" onclick="location.href='goBlack'" value="블랙 리스트 보기"/></td>
						<td colspan="2"></td>
						<td colspan="2">
							<form action="searchMemberId" id="searchForm" method="get">
							   <input type="text" id="keyword" name="keyword" placeholder="회원 검색"/>
							   <input type="button" id="search" value="검색"> 
							</form>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>회원종류</th>
						<th>회원상태</th>
						<th>삭제</th>
						<th>블랙</th>
					</tr>
					${mlist}
					${clist}
					${flist}
					${slist}
					<tr>
						<td colspan="7" align="center">${paging}</td>
					</tr>
					<tr>
						<td colspan="7"><input type="button" class="btn" onclick="location.href='goMemberMM'" value="돌아가기"/></td>
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
	<script>
	
    $("#search").click(function(){
    	var keyword=$("#keyword").val();
		if(keyword=="" || keyword==null){
		   alert("검색어를 입력하세요.");
		}
		if(keyword!="" && keyword!=null){
		   $("#searchForm").submit();
		}
    });
   </script>
</html>