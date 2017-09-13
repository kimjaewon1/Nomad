<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>steppe</title>
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
.container {
   color: black;
}
table {
   text-align: center;
   vertical-align: middle;
}
#complete {
   width: 100%;
   height: 40px;
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

input {
	color: black;
   border-radius: 5px;
}
table, td, tr{
	color: black;
}
#deleteBtn{
	height: 40px;
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
   <jsp:include page="mypagefrmenu.jsp" />
   	<jsp:include page="profilemenu.jsp" />
   <div class="container" style="height: 100%;">
		<!--style="height:-webkit-fill-available;"-->
		<form action="addCareerInfo" method="post" id="career">
			<table class="table">
				<tr>
					<td><p>경력 기간</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="경력기간을 입력해주세요" name="ca_term" id="term"></td>
				</tr>
				<tr>
					<td><p>회사명</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="회사명을 입력해주세요" name="ca_company" id="company"></td>
				</tr>
				<tr>
					<td><p>근무직급</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="근무 직급을 입력해주세요" name="ca_rank" id="rank"></td>
				</tr>
				<tr rowspan="3" colspan="3">
					<td colspan="3"><input type="button" id="complete"
						value="작성완료" /></td>
				</tr>
			</table>
		</form>
		<table>
			<tr align="center" height="25">
				<td width="370">경력기간</td>
				<td width="350">회사명</td>
				<td width="380">직급</td>
			</tr>
		</table>
		<table id="cTable">
			<c:forEach var="career" items="${clist}">
				<tr align="center" height="25">
					<td width="200">${c.ca_term}</td>
					<td width="200">${c.ca_company}</td>
					<td width="200">${c.ca_rank}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
   <!--푸터 영역 시작-->
   <jsp:include page="footer.jsp" />
   <!--푸터 영역 끝-->


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!--<script src="js/jquery.js"></script>-->
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
</body>
<script>
    /* $("#complete").click(function(){
	    var term = $("#term").val();
	    var company = $("#company").val();
	    var rank= $("#rank").val();
	    console.log(term);
	    console.log(company);
	    if(term == "" || company == "" || rank == ""){
	      alert("빈항목이 존재합니다!");      
	    } 
	      
	    if(term != "" && company != "" && rank != ""){
	        $("#career").submit();
	    }
	}); */
	$(document).ready(function(){
		var clist=''; 	
		$.ajax({
			type : 'get',
			url : 'showMyCareer',
			data : $('#career').serialize(),
			//$('#rForm').serialize(), 폼 전체 데이터 전송
			dataType : 'json',
			success : function(data) { //댓글 리스트 json형태 반환
				console.log(data); //json 구조파악
				for(var i=0;i<data.length;i++){
					clist+='<tr height="25" align="center">'
					+'<td width="400">'+data[i].ca_term+'</td>'
					+'<td width="400">'+data[i].ca_company+'</td>'
					+'<td width="400">'+data[i].ca_rank+'</td>'
					+"<td><input type='button' id='deleteBtn' value='삭제' onclick='memberDelete("+data[i].ca_num+")'/></td></tr>"
			}
			$('#cTable').html(clist);
			},
			error : function(error) {
				alert("error");
				console.log(error);
			}
		});

	$("#complete").click(function() {
				var clist='';
		$.ajax({
			type : 'get',
			url : 'addCareerInfo',
			data : $('#career').serialize(),
			//$('#rForm').serialize(), 폼 전체 데이터 전송
			dataType : 'json',
			success : function(data) { //댓글 리스트 json형태 반환
				console.log(data); //json 구조파악
				for(var i=0;i<data.length;i++){
					clist+='<tr height="25" align="center">'
					+'<td width="400">'+data[i].ca_term+'</td>'
					+'<td width="400">'+data[i].ca_company+'</td>'
					+'<td width="400">'+data[i].ca_rank+'</td>'
				 	+"<td><input type='button' value='삭제' onclick='memberDelete("+data[i].ca_num+")'/></td></tr>"
			}
			$('#cTable').html(clist);
			},
			error : function(error) {
				alert("error");
				console.log(error);
			}
		});
	});
	});
	function memberDelete(num){
		var number = num;
		var clist='';
		$.ajax({
			type : 'get',
			url : 'deleteCareerInfo',
			data : {num:num},
			//$('#rForm').serialize(), 폼 전체 데이터 전송
			dataType : 'json',
			success : function(data) { //댓글 리스트 json형태 반환
				console.log(data); //json 구조파악
				for(var i=0;i<data.length;i++){
					clist+='<tr height="25" align="center">'
					+'<td width="400">'+data[i].ca_term+'</td>'
					+'<td width="400">'+data[i].ca_company+'</td>'
					+'<td width="400">'+data[i].ca_rank+'</td>'
					+"<td><input type='button' value='삭제' onclick='memberDelete("+data[i].ca_num+")'/></td></tr>"
			}
			$('#cTable').html(clist);
			},
			error : function(error) {
				console.log(error);
			} 
	});
		location.reload();
	}
	

	/* function(){
		
	} */
	/*function complete(){
	    var term = $("#term").val();
	    var company = $("#company").val();
	    var rank= $("#rank").val();
	    console.log(term);
	    console.log(company);
	    if(term == "" || company == "" || rank == ""){
	      alert("빈항목이 존재합니다!");      
	    } 
	      
	    if(term != "" && company != "" && rank != ""){
	        $("#career").submit();
	    }    
	}*/
</script>
</html>