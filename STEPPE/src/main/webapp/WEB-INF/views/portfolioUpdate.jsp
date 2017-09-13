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
input{
color:black;
}
</style>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container" style="height:-webkit-fill-available;;">
		<!--style="height:-webkit-fill-available;"-->
		<form action="updatePortfolio" method="post" id="portfolio">
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
				<tr rowspan="3" colspan="3">
					<td colspan="3"><input type="submit" id="complete"
						value="수정완료" /></td>
				</tr>
			</table>
			<input type="hidden" name="pfnum" value="${pf_num}" />
		</form>
		<table>
			<tr align="center" height="25">
				<td width="200"></td>
				<td width="200"></td>
			</tr>
		</table>
		<div class="row"></div>
		
	</div>
	<jsp:include page="footer.jsp"/>
	
	
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!--<script src="js/jquery.js"></script>-->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>
		wow = new WOW({}).init();
	</script>
</body>
</html>