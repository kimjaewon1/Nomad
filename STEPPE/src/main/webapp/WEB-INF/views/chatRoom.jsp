<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Steppe</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="resources/css/custom.css" rel="stylesheet" type="text/css">
</head>
<body>
	${chatRoomHtml}
</body>
<script>
	var lastID = 0;
	function submitFunction(pnum){
		var chatContent = $('#chatContent').val();
		$.ajax({
			type: 'post',
			url: 'sendChat',
			data: {chatContent:chatContent, pnum:pnum},
			dataType: 'json',
			success: function(data){
				//alert('전송완료');
			}
		});	
		$('#chatContent').val('');
	}
	function chatListFunction(type){
		var pNum = $('#pnum').val();
		//alert('pNum='+pNum)
		$.ajax({
			type: "post",
			url: 'chatList',
			data: {pnum:pNum, listType:type},
			success: function(data){
				//alert('parsed');
				if(data == ""){return;}
				//alert(data);
				var parsed = JSON.parse(data);
				var result = parsed.result;
				//alert('parsed2');
				for(var i=0; i<result.length; i++){
					/* if(reesult[i][0].value==fromID){
						result[i][0].value = '나';
					} */
					addChat(result[i][0].value, result[i][1].value, result[i][2].value);
				}
				lastID = Number(parsed.last);
			},
			error : function(error){
				//alert('에러');
				//console.log(error);
			}
		});
	}
	
	function addChat(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row" style="width: auto;">'+
				'<div class="col-lg-12" style="width: auto;">'+
				'<div class="media-body" style="width: 800px;">'+
				'<h4 class="media-heading">'+
				chatName +
				'<span class="small pull-right" style="text-align: right;">'+
				chatTime +
				
				'</span>' +
				'</h4>'+
				'<p>'+
				chatContent +
				'</p>' +
				'</div>'+
				'</div>'+
				'</div>'+
				'<hr>');	
	
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		}, 2000);
	}
	$(document).ready(function(){
		//alert('실행');
		chatListFunction('ten');
		getInfiniteChat();
	});
</script>
</html>