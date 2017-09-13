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
	<div class="container" style="height:100%;">
		<!--style="height:-webkit-fill-available;"-->
		${portfolio}
			<table class="table">
				<tr>
					<td colspan="3">
					<!-- <input type="button" id="complete" onclick="go()"
						value="포트폴리오수정" /> -->
					<button><a href="goPortfolioUpdate?pf_num=${pf_num}">포트폴리오 수정</a></button>
					</td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" id="delete"
						value="삭제" /></td>
				</tr>
			</table>
		</form>
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
</html>