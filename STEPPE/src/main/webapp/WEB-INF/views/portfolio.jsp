<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.form.min.js"></script>
</head>
<style>
input,table,tr,td{
color:black;
}
#otd{
background-color: pink;
}
#ttd{
background-color: skyblue;
}
#t1{
margin-left: 25%;
}
html, body{height:100%;margin:0}
  #articleView_layer {
   display:none;position:fixed;
   position:absolute;top:0;left:0;
   width:100%;height:100%}
  #articleView_layer.open {display:block;color:red}
  #articleView_layer #bg_layer {
      position:absolute;top:0;left:0;
      width:100%;height:100%;background:#000;
      opacity:.5;filter:alpha(opacity=50);z-index:100}
  #contents_layer { position:absolute;top:40%;left:40%;
     width:450px;height:600px;margin:-150px 0 0 -194px;
      padding:28px 28px 0 28px;border:2px solid #555;
        background:#fff;font-size:12px;z-index:200;
     color:#767676;line-height:normal;white-space:normal;
     overflow:scroll}
     .center{
		margin-left: 25%;     
     }
     #complete{
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
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="mypagefrmenu.jsp"/>
   	<jsp:include page="profilemenu.jsp" />
	<div class="row"></div>
	<div class="container">
		<!--style="height:-webkit-fill-available;"-->
		<form method="post" id="portfolio" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td><p>제목</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="포트폴리오 제목을 입력해주세요" name="pf_title" id="title"></td>
				</tr>
				<tr>
					<td><p>기간</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="포트폴리오 기간을 입력해주세요" name="pf_term" id="term"></td>
				</tr>
				<tr>
					<td><p>기여도</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="포트폴리오 기여도를 입력해주세요" name="pf_contribute"
						id="contribute"></td>
				</tr>
				<tr>
					<td><p>내용</p></td>
					<td colspan="2"><input style="width: 40%;" type="text"
						placeholder="포트폴리오 내용을 입력해주세요" name="pf_content" id="content"></td>
				</tr>
				<tr>
					<td><p>포트폴리오 첨부</p></td>
					<td><input type="file" name="pf_image[]" multiple="multiple" />
				</tr>
				<tr rowspan="3" colspan="3">
					<td colspan="3"><input type="button" id="complete" value="작성완료" /></td>
				</tr>
			</table>
		</form>
		<table>
			<tr align="center" height="25">
				<td width="200"></td>
			</tr>
			<tr>
				<td width="200"></td>
			</tr>
		</table>
		<div class="center">
		<table id="pfTable">
			<c:forEach var="portfolio" items="${pflist}">
				<tr align="center" height="25">
					<td width="200">님의 포트폴리오 입니다.</td>
					<td width="200">우억</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>

	<hr>
	<div class="container">
		<!--style="height:-webkit-fill-available;"-->
		<h1 style="text-align: center;"></h1>
	</div>
	<div class="row"></div>
	<jsp:include page="footer.jsp" />

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!--<script src="js/jquery.js"></script>-->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>
		wow = new WOW({}).init();
	</script>
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
		var pflist=''; 	
		$.ajax({
			type : 'get',
			url : 'showPortfolioList',
			data : $('#portfolio').serialize(),
			//$('#rForm').serialize(), 폼 전체 데이터 전송
			dataType : 'json',
			success : function(data) { //댓글 리스트 json형태 반환
				console.log(data); //json 구조파악
				for(var i=0;i<data.length;i++){
					pflist+='<tr height="25" align="center">'
					+'<td width="200">'+data[i].pf_mid+"님의 포트폴리오 입니다"+'</td></tr>'
					+"<tr><td width='200'><a href='showPortfolioDetail?pfnum="+data[i].pf_num+"'><img src='resources/upload/"+data[i].pt_sysname+"' style='width:400px; height:400px;'/></a></td></tr>"
			}
			$('#pfTable').html(pflist);
			},
			error : function(error) {
				console.log(error);
			}
		}); 

	    $("#complete").click(function() {
	    	var formdata = new FormData(document.getElementById('portfolio'));
				var pflist='';
		$('#portfolio').ajaxForm({
			type : 'post',
			url : 'addPortfolio',
			enctype: "multipart/form-data",
			//data : $('#portfolio').serialize(),
			//data: formdata,
			//$('#rForm').serialize(), 폼 전체 데이터 전송
			dataType : 'json',
			success : function(data) { //댓글 리스트 json형태 반환
				console.log(data); //json 구조파악
				for(var i=0;i<data.length;i++){
					pflist+='<tr height="25" align="center">'
					+'<td width="200">'+data[i].pf_title+'</td>'
					+'<td width="200">'+data[i].pf_term+'</td>'
					+'<td width="200">'+data[i].pf_contribute+'</td>'
					+'<td width="200">'+data[i].pf_content+'</td></tr>'
					/* +'<td width="200">'+data[i].pt_sysname+'</td></tr>' */
			}
			$('#pfTable').html(pflist);
			},
			error : function(error) {
				console.log(error);
			}
		});
		$('#portfolio').submit();
		location.reload();
	    });
	 });
</script>
</html>