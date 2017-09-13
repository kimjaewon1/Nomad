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
</head>
<style>
	#tname{
		border: 1px solid white;
		font-size: xx-large;
	}
	.fstTest{
		margin-top: 3%;
		margin-left: 35%;
	}
	.StartButton{
		margin-left: 15%;
		width: 150px;
		height: 70px;
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
	.about{
		padding-top: 10px;
	    padding-bottom: 110px;
	    color:black;
	}
</style>
<body>
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
		<div class="fstTest">
			<form action="doTest" method="post">
				<input type = "text" readonly="readonly" name = "t_name" id="tname" value = "${test}"/><br/><br/>
				<h3 style ="color: red;">시험을 치루기에 앞서 꼭 읽어주세요</h4><br/><br/>
				<h4>1. 모든문제는 객관식 입니다.</h4><br/>
				<h4>2. 모든문제는 단수 정답입니다.</h4><br/>
				<h4>3. 이전 문제로 되돌아갈수 없습니다.</h4><br/>
				<h4>4. 합격은 60%이상의 정답을 맞춰야 합니다.</h4><br/>
				<h4>5. 문제를 다 풀면 맞은 %만을 알려드립니다.</h4><br/><br/><br/>
				<button class="StartButton">시험 시작</button>
			</form>
		</div>
	</div>
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
</body>
 <script src="resources/js/jquery-3.2.1.min.js"></script>      
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>   
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
</html>