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
		<script src="resources/js/jquery-3.2.1.min.js"></script>
		<style>
			 #articleView_layer {
   					display:none;
   					position:fixed;
   					position:absolute;
  					top:0;
   					left:0;
   					width:100%;
   					height:100%
   				}

  			#articleView_layer.open {
  					display:block;
  					color:red
  				}

  			#articleView_layer #bg_layer {
      				position:absolute;
      				top:0;
      				left:0;
      				width:100%;
      				height:130%;
      				background:#000;
      				opacity:.5;
      				filter:alpha(opacity=50);
      				z-index:100
      		}

 			 #contents_layer { 
  					position:absolute;
  					top:50%;
  					left:50%;
    				width:400px;
    				height:400px;
    				margin:-150px 0 0 -194px;
   					padding:28px 28px 0 28px;
    				border:2px solid #555;
    				background:#fff;
    				font-size:12px;
    				z-index:200;
    				color:#767676;
    				line-height:normal;
    				white-space:normal;
    				overflow:scroll
     		}
     		table {
				text-align: center;
				color: black;
				margin: 0 auto;
			}
			
			td,th {
				text-align: center;
				color: black;
				padding: 3px;
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
			<div class="container" style="height: -webkit-fill-available;" align="center">
				<button id="showProcessAll" class="btn" name="showProcessAll" onclick="location.href='./showProcessAll ' ">프로젝트 관리</button>
				<button  id="pinsert" class="btn" name="pinsert" onclick="location.href='./goAddProject' ">프로젝트 등록</button>
				<button  id="updateUserInfo" class="btn" name="updateUserInfo" onclick="location.href='./goUpdateUserInfo' ">회원정보 수정</button>
				<button  id="deleteMember" class="btn" name="deleteMember" onclick="location.href='./deleteMember' ">회원탈퇴</button>
				<h2>프로젝트 목록</h2>
				${plist}
	
			</div>
		</div>
		<hr>
		<div class="row"></div>
		 
		<!-- 푸터 영역 -->  
		<jsp:include page="footer.jsp" />
	<script>
	function P_teamCheck(p_status2){
		alert(p_status2);
	}
	
	function articleView(p_num){//지원자들 라이트 박스 띄우기 위한 ajax
		$('#articleView_layer').addClass('open');
		$.ajax({
			type:'get',
			url: 'showApplyList',
			data:{p_num:p_num},
			timeout:3000,
			success:function(data){
				$('#contents_layer').html(data);
			},
			error:function(error){
				alert("error");
				console.log(error);
			}
		});
	}

			
	</script>

</body>
<div id="articleView_layer">
	<div id="bg_layer"></div>
	<div id="contents_layer"></div>
</div>
</html>