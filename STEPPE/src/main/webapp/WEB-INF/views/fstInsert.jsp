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
	<script src="resources/js/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Steppe</title>
<style>
	.container{
		color: black;
	}
	.t_content{
		width:80%;
		height:300px;
		resize: none;
	}
	#submitC,button{
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
			a{
				color:#fff;
			}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="about" style="height: -webkit-fill-available;">
		<div class="container">
			<form  action="insertFst" method="post" id="insertFstForm">
				<select name = "t_name">
					<option value="java">JAVA</option>
					<option value="html">HTML</option>
					<option value="jsp">JSP</option>
					<option value="c">C</option>
					<option value="android">Android</option>
				</select>
				<table class="table table-striped">		
					<tr>
						<td width="100">문제내용</td>
						<td><textarea name="t_content" class="t_content" id="t_content">문제를 입력하시오.</textarea></td>
					</tr>
					<tr>
						<td width="100">1번</td>
						<td><input type="text" name="t_no1" id="t_no1"/></td>
					</tr>
					<tr>
						<td width="100">2번</td>
						<td><input type="text" name="t_no2" id="t_no2"/></td>
					</tr>
					<tr>
						<td width="100">3번</td>
						<td><input type="text" name="t_no3" id="t_no3"/></td>
					</tr>
					<tr>
						<td width="100">4번</td>
						<td><input type="text" name="t_no4" id="t_no4"/></td>
					</tr>
					<tr>
						<td width="100">정답번호</td>
						<td>
							<select name = "t_answer">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
					</tr>
				</table>
				<input type = "button" value="확인" id="submitC">
			<button><a href="javascript:history.go(-1)">뒤로가기</a></button>
			</form>
		</div>
	</div><div class="row"></div>
	<hr/>
		 
		<!-- 푸터 영역 -->  
		<jsp:include page="footer.jsp" />
</body>
<script>
	$("#submitC").click(function(){
		if($("#t_content").val() == "" || 
				$("#t_no1").val() == "" || 
				$("#t_no2").val() == "" || 
				$("#t_no3").val() == "" || 
				$("#t_no4").val() == ""){
		alert("빈 공간을 모두 채워주세요");	
	}else{
			$("#insertFstForm").submit();
		}
});
</script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
</html>