<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		table{
			color: black;
		}
		input#insert{
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
		input#url{
			border:1px solid white;
			width: 100%;
		}
	</style>	
  </head>
  <body>
  	<jsp:include page="header.jsp" />
   
    
	<!--메인페이지 영역-->
	<div class="about">
			
			<div class="container">
				<form action="InsertReport" method="post" id="reportWrite">
					<table class="table table-striped">
						<tr>
							<td style="text-align: center;">신고자</td>
							<td style="text-align: center;">${user2}</td>
						</tr>
						<tr>
							<td style="text-align: center;">신고 주소</td>
							<td style="text-align: center;">
								
								<input type="text" value="${reportUrl}" readonly="readonly" name="r_url" id="url">
							</td>
						</tr>
						<tr>
							<td style="text-align: center;">신고사유</td>
							<td style="text-align: center;">
								<select style="width: 50%;" name="r_kind" id="r_kind">
									<option value="">
										신고 사유를 선택해 주십시오.
									</option>
									<option value="음란물 및 사행성 조장">
										음란물 및 사행성 조장
									</option>
									<option value="업무태만">
										업무태만 
									</option>
									<option value="태도 불량">
										태도 불량
									</option>
									<option value="분야에 대한 이해도 부족">
										분야에 대한 이해도 부족
									</option>
									<option value="기타">
										기타
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:middle; text-align: center;">신고 내용</td>
							<td>
								<textarea id="r_contents" name="r_contents" rows="15" style="width: 100%; resize: none;"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="작성" id="insert"/>
								<input type="button" onclick="goBack()" value="돌아가기"/>
							</td>
						</tr>
					</table>
				</form>
			
			</div>
	</div>			
	<hr>
    <div class="row"></div>
    <jsp:include page="footer.jsp" />
    <script src="resources/js/jquery-3.2.1.min.js"></script>		
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
    
</body>
<script>
	function goBack() {
	    window.history.back();
	}
	$("#insert").click(function(){
		var url = $("#url").val();
		var r_kind = $("#r_kind").val();
		var r_contents = $("#r_contents").val();
		console.log(url);
		if(url==""||url==null||r_kind==""||r_kind==null||r_contents==""||r_contents==null){
			alert("입력 사항을 작성하지 않았습니다.");
		}
		if(url!=""&&url!=null && r_kind!=""&& r_kind!=null && r_contents!=""&&r_contents!=null){
			$("#reportWrite").submit();
		}
	});
	var message = '${msg}';
    if(message!=""){
    	alert(message); 
    }
</script>
</html>