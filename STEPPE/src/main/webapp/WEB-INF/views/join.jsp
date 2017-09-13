<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<!-- =======================================================
        Theme Name: Day
        Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
	<style>
		.navbar-header {
			/*background-color: dimgrey;*/
			
		}
		
		#join {
			/* width: 300px; */
			/* background-color: lightgrey; */
			text-align: center;
		}
		
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
			background-color: #1ee1b9;
			color: white;
			margin-top: 0px;
		}
		
		.radio {
			color: black;
		}
		
		label {
			color: black;
		}
		
		#image_preview img {
			width: 250px;
			height: 250px;
		}
		#userImage{
			margin:0 auto;
			width: 250px;
		}
		ui{
			list-style: none;
			
		}
		li{
			display: inline;
			
		}
		#choseClient{
			width: 100px;
		}
		#choseFreelancer{
			width: 100px;
		}
		
	</style>
</head>
<body>
	<!-- 헤더 영역 -->  
	<jsp:include page="header.jsp" />
	<div class="about">
		<div class="container">
			<div id="join">
				<h3 style="color: black;">회원 가입</h3>
				<!-- <form name="join" action ="memberInsert" method="post" enctype="multipart/form-data"> -->
				<form action ="memberInsert" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>
								<ul>
									<li><input type="radio" id="choseClient" class="radio" name="m_kind" value="C" /></li>
									<li><label for="choseClient">클라이언트</label></li>
								</ul>
							</td>
							<td>
								<ul>
									<li><input type="radio" id="choseFreelancer" class="radio" name="m_kind" value="F" /></li>
									<li><label for="choseFreelancer">프리랜서</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" id="userId" name="userId" placeholder="아이디" /> 
								<span id="notiId"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="password" id="userPassword" name="pw" placeholder="비밀번호" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="password" id="passwordCheck" name="pw" onkeyup="passwordCheckk()" placeholder="비밀번호 확인" /> 
								<span id="notiPw"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2" id="passwordCheckText"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="file" id="userImage" name="userImage" onchange="fileChk(this)"/>
								<input type="hidden" id="fileCheck" name="fileCheck"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="image_preview">
									<img src="resources/img/user.png" />
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" id="userName" name="userName" placeholder="이름" /> 
								<span id="notiName"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" id="userEmail" name="userEmail" placeholder="이메일" />
							</td>
						</tr>
						<tr>
							<td colspan="2" id="notiEmail" style="color: red"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" class="btn" onClick="sendCode()" value="인증번호 발송" /> 
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
								<!-- <input type="button" class="btn" onClick="join()" value="회원가입" /> -->
								<input type="submit" class="btn" value="회원가입" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" class="btn" onClick="location.href='./'" value="돌아가기" />
								
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
	<hr>

	<div class="row"></div>
	<jsp:include page="footer.jsp" />


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>

</body>

<script language="javascript">
		/* 비밀번호 중복 검사 */
		function passwordCheckk(){
			var password = document.getElementById("userPassword").value;
			var passwordCheck = document.getElementById("passwordCheck").value;
	
			if (passwordCheck == "") {
				document.getElementById("passwordCheckText").innerHTML = ""
			} else if (password != passwordCheck) {
				document.getElementById("passwordCheckText").innerHTML = "<span><font color=red size=2pt>비밀 번호가 틀립니다.</font></span>"
			} else {
				document.getElementById("passwordCheckText").innerHTML = "<span><font color=red size=2pt>비밀 번호가 일치 합니다.</font></span>"
			}
		}
		
		/* 이메일 인증 */
		function sendCode(){
			var flag = 1;
			var email = $('#userEmail').val();
			
			if(email!=''){
				$.ajax({
					type: 'POST',
					url: './sendCode',
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
		
		//파일업로드 
		function fileChk(elem){ //파일 엘리먼트를 파라미터로 받았다.
			//파라미터로 잘 가져 왔는지 확인
			console.log(elem.value);
			if(elem.value==""){
				console.log("empty");
				//jquery 
				$("#fileCheck").val(0);//파일 첨부 안함
			}else{
				$("#fileCheck").val(1);//파일 첨부 함
			}
			
		}//function end 
		
				
		$('#userImage').on('change', function() {
	        
	        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	        
	        //배열에 추출한 확장자가 존재하는지 체크
	        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	            resetFormElement($(this)); //폼 초기화
	            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	        } else {
	            file = $('#userImage').prop("files")[0];
	            blobURL = window.URL.createObjectURL(file);
	            $('#image_preview img').attr('src', blobURL);
	            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
	            $(this).slideUp(); //파일 양식 감춤
	        }
	    });

	    
	    $('#image_preview a').bind('click', function() {
	        resetFormElement($('#userImage')); //전달한 양식 초기화
	        $('#image').slideDown(); //파일 양식 보여줌
	        $(this).parent().slideUp(); //미리 보기 영역 감춤
	        return false; //기본 이벤트 막음
	    });
		
	</script>


</html>