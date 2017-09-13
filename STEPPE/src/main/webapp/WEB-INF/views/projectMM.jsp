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
					<h3>프로젝트 리스트</h3><br/>
					<tr>
						<td colspan="3">
							<input type="button" class="btn" onclick="location.href='getDevelopList'" value="개발 리스트 보기"/>
						</td>
						<td colspan="3">
							<input type="button" class="btn" onclick="location.href='getDesignList'" value="디자인 리스트 보기"/>
						</td>
						<td colspan="5"></td>
						<td colspan="4">
							<form action="searchProject" id="searchForm" method="get">
							   <input type="text" id="keyword" name="keyword" placeholder="프로젝트 검색"/>
							   <input type="button" id="search" value="검색"> 
							</form>
						</td>
					</tr>
					<tr>
						<th>NO.</th>
						<th>1차카테</th>
						<th>2차카테</th>
						<th>아이디</th>
						<th>예산</th>
						<th>기간</th>
						<th>제목</th>
						<th>입찰마감일</th>
						<th>필요기술1</th>
						<th>필요기술2</th>
						<th>필요기술3</th>
						<th>제한인원 </th>
						<th>상태 </th>
						<th>지원자 </th>
						<th>삭제</th>
					</tr>
					${plist}
					${vlist}
					${dlist}
					${slist}
					<tr>
						<td colspan="14" align="center">${paging}</td>
					</tr>
					<tr>
						<td colspan="14"><input type="button" class="btn" onclick="location.href='goProjectMM'" value="돌아가기"/></td>
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