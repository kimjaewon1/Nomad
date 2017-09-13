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
			
				margin: 0 auto;
			}
			
			td {
				padding: 3px;
			}
			
			input {
				color: black;
				width: 250px;
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
		</style>   
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<!--메인페이지 영역-->
		<div class="about">

	<!-- 
>>>>>>> 7c495fb382ade8e50076fe94a993f44797a79af1
			<form action="findId" method="post">
				<table>
					<tr>
						<td></td>
					</tr>
				</table>
			</form>
			
			<form action="findPw" method="post">
				<table>
					<tr>
						<td></td>
<<<<<<< HEAD
					</tr>
				</table>
			</form>
		
		</div>
		<hr>
		<div class="row"></div>
		 
=======
-->
			<h4 align="center">아이디 찾기</h4>
			<form action="findId" method="post">
				<table>
					<tr>
						<td colspan="2">
							<input type="text" id="userName" name="m_name" placeholder="이름" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="m_email" placeholder="이메일" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn" value="아이디 찾기" /> 
						</td>
					</tr>
				</table>
			</form>
			<br/>
			<h4 align="center">비밀번호 찾기</h4>
			<form action="findPw" method="post">
				<table>
					<tr>
						<td colspan="2">
							<input type="text" id="userId" name="m_id" placeholder="아이디" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" id="userEmail" name="m_email" placeholder="이메일" />
						</td>
					</tr>
					<tr>
						<td colspan="2" id="notiEmail" style="color: red"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" class="btn" onClick="sendCodes()" value="인증번호 발송" /> 
						</td>
					</tr>
					<tr>
						<td>
							<span id="notiCode"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" id="userCode" name="userCode" placeholder="인증번호" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn" value="비밀번호 찾기" /> 
						</td>
					</tr>
				</table>
			</form>
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
		/* 이메일 인증 */
		function sendCodes(){
			var flag = 1;
			var email = $('#userEmail').val();
			
			if(email!=''){
				$.ajax({
					type: 'POST',
					url: './sendCodes',
					data: {flag:flag, userEmail:email},
					
					success:function(data){
						var msg = data.split(",");
						console.log(data);
						$('#notiEmail').html(msg[0]);
						$('#notiCode').html(msg[1]);
						console.log('flag');
					},
					
					error:function(error){
						console.log(error);
					}
				}); 	
			}
			else
			{
				$('#notiEmail').html("이메일을 입력해주세요");
			}
		}
	</script>
</html>