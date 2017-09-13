<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>steppe 샘플페이지</title>
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/css/style.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<style>
select {
	color: black;
}
table{
	color: black;
}
span{
	color:black;
}
input#complete {
	height:80px;
	width: 50%;
	background: #0f1c34;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid white;
	color: #fff;
	font-weight: bold;
	font-size: 14px;
	outline: none;
	cursor: pointer;
	text-align: center;
}
input#p_term{
	float:right;
	border-radius: 5px;
}
textarea{
	width: 100%;
	resize: none;
}
td.category{
	text-align: center;
    width: 5%;
}
</style>
</head>
<body>
	<!--상단 메뉴바-->
	<header id="header"> <nav
		class="navbar navbar-default navbar-static-top" role="banner">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="navbar-brand">
				<a href="main"><h1>steppe</h1></a>
			</div>
		</div>
		<div class="navbar-collapse collapse">
			<div class="menu">
				<ul class="nav nav-tabs" role="tablist">
					<ul class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="goIntro">steppe?</a></li>
							<li role="presentation"><a href="goProject">프로젝트</a></li>
							<li role="presentation"><a href="goFreelancer">프리랜서</a></li>
							<li role="presentation"><a href="goManual">이용방법</a></li>
                            <li role="presentation"><a href="goPms">프로젝트 관리</a></li>
					</ul>
				</ul>
			</div>
		</div>
	</div>
	</nav> 
	</header>
	<div class="row"></div>
	<div class="container">
		<form action="" method="post" id="insertForm">
			
			<div class="container">
				<table class="table table-responsive">
					<tr>
						<td style="vertical-align: bottom;">
							<select name="pc1_name">
									<option value="내용고치시오">1차카테고리</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
							</select> 
							<select name="pc2_name">
									<option value="">2차카테고리</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
									<option value="내용고치시오">내용고치시오</option>
							</select>
							<td>
							<span style="float: right;">기간</span><br/>
							<input type="text" name="p_term" id="p_term" placeholder="기간을 입력하시오" />
						</td>
					</tr>
					<tr>
						<td class="category">
							<span>제목</span>
						</td>
						<td>
							<input type="text" style="width:100%;" placeholder="제목을 입력하여 주세요" />
						</td>
					</tr>
					<tr>
						<td class="category" style="vertical-align: middle;">
							<span>내용</span>
						</td>
						<td><textarea name="p_content"
								id="p_content" rows="30"></textarea></td>
					</tr>
					<tr>
						<td class="category">
							<span>첨부 파일</span>
						</td>
						<td>
							<input type="file" name="p_filename" id="p_filename" style="width: 100%;"/>
						</td>
					</tr>
					<tr>
						<td class="category">
							<span>입찰 마감</span>
						</td>
						<td>
							<input type="text" name="p_deadline" id="p_deadline" />
						</td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="button" id="complete" value="프로젝트 등록" style="height: 80px;"/>
						</td>
					</tr>
				</table>
			</div>		
		</form>
	</div>
		
	<div class="row"></div>

	<!--푸터 영역 시작-->
	<div class="sub-footer">
		<div class="container">
			<div class="social-icon">
				<div class="col-md-4"></div>
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
						<a href="https://bootstrapmade.com/">BootstrapMade</a> <br /> <a
							href="#">공지사항</a>&nbsp;&nbsp;&nbsp; <a href="#">faq</a>&nbsp;&nbsp;&nbsp;
						<a href="#">이용약관</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--푸터 영역 끝-->



	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
</body>
<script>
    $("#check").click(function(){
        var price = $("#price").val();
        
        
        if(price == "" ){
          alert("입찰가를 입력하세요!");      
        } 
          
        if(price != ""){
            $("#priceForm").submit();
        }    
    });
    $("#replyInsert").click(function(){
    	var r_content  = $("#r_content").val();
    	
    	if(r_content == ""){
    		alert("댓글을 입력하세요!");
    	}
    	if(r_content != ""){
    		$("#replyForm").submit();
    	}
    });
</script>
</html>