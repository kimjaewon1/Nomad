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
<style>
	.sbtn{
			background: #0f1c34;
		   	box-sizing: border-box;
		   	border-radius: 5px;
		   	border: 1px solid white;
		   	color: #fff;
		   	font-weight: bold;
		   	font-size: 14px;
		   	outline: none;
		   	cursor: pointer;
		   	width: 15%;
		}
</style>
</head>
<body>
	<div class="row">
		<div class="container" style="text-align: center; padding-bottom: 30px;">
			<a href="goMyPageFr"><input type="button" class="sbtn" value="프로젝트 현황"/></a>&nbsp;&nbsp;
			<a href="goMyProfile"><input type="button" class="sbtn" value="프로필 관리"/></a>&nbsp;&nbsp;
			<a href="fst"><input type="button" class="sbtn" value="자격시험 보러가기"/></a>&nbsp;&nbsp;
			<a href="deleteMember"><input type="button" class="sbtn" value="회원탈퇴"/></a>
		</div>
	</div>
</body>
</html>