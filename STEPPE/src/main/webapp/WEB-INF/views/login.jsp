<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
	<link href="resources/css/login.css" rel="stylesheet"/>
	<script src="http://code.jquery.com/jquery-3.2.1.js"></script>	
  </head>
  <body>
    <jsp:include page="header.jsp" />
    <div class="about">
		<div class="container" style="height:-webkit-fill-available;">
			<form action="access" method="post">
				
				<div class="logo"></div>
				<div class="login-block">
					<h1>Login</h1>
					<input type="text" name="m_id" id="username" placeholder="아이디"/>
					<input type="password" name="m_pw" id="password" placeholder="비밀번호"/>
					<input type="submit" class="btn" value="로그인"/>
					<input type="button" name="findInfo" onClick="location.href='./goFindInfo'"  class="btn" value="내정보 찾기"/>
					
				</div>
				<!-- <table>
					<tr>
						<td align="center">로그인</td>
					</tr>
					<tr>
						<td><input type="text" name="m_id" placeholder="아이디"/></td>
					</tr>
					<tr>
						<td><input type="password" name="m_pw" placeholder="비밀번호"/></td>
					</tr>
					<tr>
						
						<td>
							<input type="button" name="findInfo" onClick="location.href='./goFindInfo'"  class="btn" value="내정보 찾기"/>
						
							<input type="submit" class="btn" value="로그인"/>
						</td>
					</tr>
									
				</table> -->
			</form>
			
        </div>
    	<jsp:include page="footer.jsp" />
    </div>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
    
</body>
<script>
var message = '${msg}';
if(message!=""){
	alert(message); 
}
</script>
</html>