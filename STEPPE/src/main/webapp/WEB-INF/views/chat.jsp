<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/css/custom.css" rel="stylesheet" type="text/css">
</head>

<body style="background-color:#fff;">

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <jsp:include page="pmsHeader.jsp"></jsp:include>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="goPms"><i class="fa fa-fw fa-dashboard"></i>대시보드</a>
                    </li>
                    <li class="active">
                       <a href="goLiveChat"><i class="fa fa-fw fa-desktop"></i>실시간 채팅</a>
                    </li>
                    <li>
                        <a href="goProjectMemberMM"><i class="fa fa-fw fa-table"></i>멤버 관리</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid" style="height:100%;">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            PMS <small>Project Management Service</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i><span>작업량 확인 팀원간 채팅 멤버관리를 해주세요.</span>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row" >
                	 <div class="panel-body" style="float:left;" >
                        <div class="col-lg-12">
							${makeList}
			            </div>
                     </div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <i class="fa fa-long-arrow-right fa-fw"></i>
                       			       	실시간 채팅
                                </h3>
							</div>
                         
                            <div id="chatPrint" class='panel panel-default'>
				            		
				            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
    <!-- jQuery -->
    <script src="resources/js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

</body>
<script>
			function Ajax(url, position){
				$.ajax({
					type: 'get',
					url: url,
					success: function(html){
						//alert('확인');
						$(position).html(html);
					},
					error: function(error){
						console.log(error);
					}
				});
			}
			function Ajax2(url, position, progId){
				//alert(progId);
				var num = document.getElementById(progId).options[document.getElementById(progId).selectedIndex].value;
				//alert('num='+num);
				console.log('num='+num);
				var url2 = url + num;
				$.ajax({
					type: 'get',
					url: url2,
					success: function(html){
						//alert('확인');
						$(position).html(html);
					},
					error: function(error){
						console.log(error);
					}
				});
				location.reload();
			}
			function chatStart(pnum){
				//alert(pnum);
				$.ajax({
					type: 'post',
					url: "startChat",
					data: {pnum:pnum},
					success: function(data){
						$('#chatPrint').html(data);
					},
					error: function(error){
						console.log(error);
					}
				});
				//chatListFunction('ten');
			}
			var chatNum = 0;
			/* function submitFunction(pnum){
				var chatContent = $('#chatContent').val();
				$.ajax({
					type: 'post',
					url: 'sendChat',
					data: {chatContent:chatContent, pnum:pnum},
					dataType: 'json',
					success: function(data){
						if(data == ""){return;}
						var parsed = JSON.parse(data);
						var result = parsed.result;
						for(var i=0; i<result.length; i++){
							addChat(result[i][0].value, result[i][1].value, result[i][2].value);
							alert(result[i][0].value);
						}
						chatNum = Number(parsed.last);
					}
				});	
				$('#chatContent').val('');
			} */
			/* function addChat(chatName, chatContent, chatTime){
				$('#chatList').append('<div class="row"'+
						'<div class="col-lg-12">'+
						'<div class="media">'+
						'<a class="pull-left" href="#">'+
						'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">'+
						'</a>' +
						'<div class="media-body">'+
						'<h4 class="media-heading">'+
						chatName +
						'<span class="small pull-right">'+
						chatTime +
						'</span>' +
						'</h4>'+
						'<p>'+
						chatContent +
						'</p>' +
						'</div>'+
						'</div>'+
						'</div>'+
						'</div>'+
						'<hr>');	
			
				$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
			}
			function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(chatNum);
				}, 3000);
			}
			$(document).ready(function(){
				chatListFunction('ten');
				getInfiniteChat();
			}); */
		</script>
</html>
