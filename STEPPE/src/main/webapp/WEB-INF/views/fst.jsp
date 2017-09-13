<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       <style>
          table{
             color: black;
          }
       </style>
  </head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="mypagefrmenu.jsp" />
	<div class="about" style="height: -webkit-fill-available;">
		<table class="table table-striped" style="width: 80%; margin-left: 10%; text-align: center;">
			<tr>
				<td colspan = "3">
					<h2>합격한 시험</h2>
				</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>퍼센트</td>
				<td>합격여부</td>
			</tr>
			${rslist}
		</table>
		<div class="row">
			<hr style="width: 80%; color: grey;"/>
		</div>
		<table class="table table-striped" style="width: 80%; margin-left: 10%; text-align: center;">
			<tr>
				<th colspan="2">
					<h2 style="text-align: center;">자격시험 목록</h2>
				</th>
			</tr>
			<tr>
				<td>JAVA</td><td style="text-align: right;"><a href = "selectTest?t_name=java">보러가기</a></td>
			</tr>
			<tr>
				<td>HTML</td><td style="text-align: right;"><a href = "selectTest?t_name=html">보러가기</a></td>
			</tr>
			<tr>
				<td>JSP</td><td style="text-align: right;"><a href = "selectTest?t_name=jsp">보러가기</a></td>
			</tr>
			<tr>
				<td>C</td><td style="text-align: right;"><a href = "selectTest?t_name=c">보러가기</a></td>
			</tr>
			<tr>
				<td>Android</td><td style="text-align: right;"><a href = "selectTest?t_name=android">보러가기</a></td>
			</tr>
		</table>
	</div>
	<hr/>
	<div class="row"></div>
		 
		<!-- 푸터 영역 -->  
		<jsp:include page="footer.jsp" />
</body>
   <script src="resources/js/jquery-3.2.1.min.js"></script>      
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>   
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
</html>