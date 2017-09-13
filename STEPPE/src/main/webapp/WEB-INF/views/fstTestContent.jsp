<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Steppe</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="resources/css/font-awesome.min.css">
      <link rel="stylesheet" href="resources/css/animate.css">
      <link href="resources/css/animate.min.css" rel="stylesheet"> 
      <link href="resources/css/style.css" rel="stylesheet" />   
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<style>
	#Test{
		height: 10%;
	}
	#a_tname{
		border: 1px solid white;
		text-align: center;
		font-size:25px;
		width: 100px;
	}
	#a_tnum{
		display: none;
	}
	
	.about{
		padding-top: 50px;
	    padding-bottom: 50px;
	    color:black;
	}
	.tableFst{
		width: 90%;
		margin-left: 5%;
		margin-right: 5%;
	}
	.fstContent{
		text-align: center;
		font-size:30px;
		height: 200px;
	}
	.tdName{
		background-color: white;
		text-align: center;
		font-size:25px;
		width: 10%;
		color: black;
	}
	.td00{
		text-align: center;
		font-size:20px;
		width: 10%;
	}
	.td01{
		width: 5%;
		font-size:20px;
		text-align: center;
	}
	.td02{
		width: 70%;
		font-size:20px;
		text-align: center;
	}
	.td03{
		width: 10%;
	}
	tr{
		height: 80px;
	}
	.tr01{
		background-color: #c9c9c9;
	}
	#check{
		width: 100px;
		height: 50px;
		font-size:20px;
		background: #0f1c34;
		box-sizing: border-box;
		border-radius: 5px;
		border: 1px solid white;
		color: #fff;
		font-weight: bold;
		outline: none;
		cursor: pointer;
		text-align: center;
	}
	.lastTd{
		height: 400px;
		text-align: center;
		font-size:30px;
	}
	.lastA{
		height: 200px;
		text-align: right;
		font-size:20px;
	}
	.endButton{
		width: 100px;
		height: 50px;
		background: #0f1c34;
		box-sizing: border-box;
		border-radius: 5px;
		border: 1px solid white;
		color: #fff;
		font-weight: bold;
		outline: none;
		cursor: pointer;
		text-align: center;
	}
	.AA{
		color: white;
	}
	#ViewTimer{
		font-size: 25px;
		margin-left: 15%;
	}
	#answer1,#answer2,#answer3,#answer4{
		width: 35px;
		height: 35px;
	}
</style>
<body>
	<div id = "Test">
	<header id="header">
        <nav class="navbar navbar-default navbar-static-top" role="banner">
            <div class="container" style="width: 100%; padding-bottom: 30px;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                   <div class="navbar-brand">
						<a href="main"><h1>steppe</h1></a>
					</div>
                </div>				
                <div class="navbar-collapse collapse">							
				</div>		
            </div>
        </nav>	
    </header>
    	<div class="about">
	    	<div class = "textFst">
				<form action = "ajax(checkTest)" name = "checkTest" id = "checkTest" method="post">
						${tlist}
				</form>
			</div>
		</div>
		<div class="row"></div>
		<div class="sub-footer">
      <div class="container">
         <div class="social-icon">
            <div class="col-md-4">
                  
            </div>
         </div>
         
         <div class="col-md-4 col-md-offset-4">
            <div class="copyright">
               &copy; Day Theme. All Rights Reserved.
                    <div class="credits">
                        <!-- 
                            All the links in the footer should remain intact. 
                            You can delete the links only if you purchased the pro version.
                            Licensing information: https://bootstrapmade.com/license/
                            Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Day
                        -->
                        <a href="https://bootstrapmade.com/">Free Bootstrap Themes</a> by 
                        <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        <br/>
                        <a href="#">공지사항</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">faq</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">이용약관</a>
                    </div>
            </div>
         </div>                  
      </div>            
   </div>
	</div>	
</body>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>   
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
<script>
	function ajax(url) {
		var FormData = $('#checkTest').serialize();
		$.ajax({
			url : 'checkTest',
			type : 'post',
			data : FormData,
		success : function(data) {
			$('#Test').html(data);
			},
		error : function(error) {
			console.log(error);
			}
		});//ajax End
	}
	$("#check").click(function(){
		if ( $("input[type=radio]:checked").length < 1 ) {
		    alert('정답을 입력하시오');
		}else if ( $("input[type=radio]:checked").length = 1 ) {
			$(ajax(checkTest)).submit;
		}
	});
	$("#goFst").click(function(){
		$("goFst").submit;
	});
</script>
<script>
	
		var SetTime = 10;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime % 60) + "초";	// 남은 시간 계산
			
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				$(ajax(checkTest)).submit;
				alert("시간초과");
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
	</script>
</html>