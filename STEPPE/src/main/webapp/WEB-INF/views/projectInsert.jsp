<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      height:100%;
      background:#000;
      opacity:.5;
      filter:alpha(opacity=50);
      z-index:100
      }

  #contents_layer { .
  
  	position:absolute;
  	top:40%;
  	left:40%;
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
		<form action="insertProject" method="post" id="insertForm" name="form1" enctype="multipart/form-data" onsubmit="return check()">
			<div class="container">
				<table class="table table-responsive">
					<tr>
						<td style="vertical-align: bottom;">
							<select name="pc1_name" id="pc1_name" onchange="firstChange();">
							<option value="1차 카테고리">1차 카테고리</option>
							<option value="개발">개발</option>
							<option value="디자인">디자인</option>
							</select> 
							<select name="pc2_name" id="pc2_name">
									<option value="">2차 카테고리</option>
									
							</select>
							<td>
							<span style="float: right;">기간(일)</span><br/>
							<input type="text" name="p_term" id="p_term" placeholder="기간을 입력하시오" 
							onkeydown="inputOnlyNumber(this);" onkeyup="typing()" value=0 />
							</td>
					</tr>
					<tr>
						<td class="category">
							<span>제목</span>
						</td>
						<td>
							<input type="text" style="width:100%;" placeholder="제목을 입력하여 주세요" name="p_title" />
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
							<span>파일 첨부</span>
						</td>
						<td>
							<input type="file" name="p_filename" onChange="fileChk(this)" style="width: 100%;"/>
							<input id="p_filename" type="hidden" name="fileCheck"/>
						</td>
					</tr>
					<tr>
						<td class="category">
							<span>입찰 마감</span>
						</td>
						<td>
							<input type="date" name="p_deadline" id="p_deadline" />
						</td>
					</tr>
					<tr>
                  		<td class="category">
                     	<span>예상비용</span>
                  		</td>
                  		<td>
                     		<input type="text" name="p_budget" id="p_budget" 
                     		onkeydown="inputBudget(this)" onkeyup="typing2()" value=0 /><span>        만원</span>
                  		</td>
               		</tr>
               		<tr>
                  		<td class="category">
                     	<span>세부기술</span>
                  		</td>
                  		<td>
                     		<fieldset name="p_plnum" id="p_plnum">
                     			<legend>세부기술 선택(최대3개)</legend>
                     				${slist}
                     		</fieldset>
                     		<input id="p_plnum0" type="hidden" name="p_plnum0"/>
                     		<input id="p_plnum1" type="hidden" name="p_plnum1"/>
                     		<input id="p_plnum2" type="hidden" name="p_plnum2"/>
                  		</td>
               		</tr>

               		<tr>
               			<td class="category">
                     	<span>필요인원</span>
                  		</td>
                 		<td>
                     		<input type="text" name="p_person" id="p_person"
                     		onkeydown="inputPerson(this)" onkeyup="typing3()" /><span>                 명</span>
                  		</td>
               		</tr>
               		
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="submit" id="complete" value="프로젝트 등록" style="height: 80px;"/>
						</td>
					</tr>
				</table>
			</div>		
		</form>
	</div>
		
	<div class="row"></div>

	<!-- 푸터 영역 -->  
	<jsp:include page="footer.jsp" />



	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>
</body>
<div id="articleView_layer">
	<div id="bg_layer"></div>
	<div id="contents_layer"></div>
</div>

<script>

/*
$("#inter").click(function(){
	$("input[name=p_plnum]:checked").each(function(idx){
		var value=$(this).val();
		var eqValue=$("input[name=p_plnum]:eq("+idx+")").val();
		console.log(value+":"+eqValue);
		//console.log(test);
		//$("#inter").attr({
			//"name":"test"	
		//});
	});
});*/
	$("input[name=p_plnum]:checked").each(function(){
		var test=$(this).val();
		console.log(test);
		$("#inter").attr({
			"name":"test"	
		});
		
	});
	
    function firstChange(){
    	var selectBox = document.getElementById("pc1_name");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		    alert(selectedValue + '을  선택하셨습니다.');
		    
    	var x = document.form1.pc1_name.options.selectedIndex;
    	var groups=document.form1.pc1_name.options.length;
    	var group=new Array(groups);
    	
    	 for (i=0; i<groups; i++) {
    		  group[i]=new Array();
    		 }//for
    	 // 옵션(<option>) 생성
    	  group[0][0]=new Option("2차 카테고리");
 		  group[1][0]=new Option("개발 선택");
 		  group[1][1]=new Option("Android앱");//결과 <option value="ss">삼성</option>
 		  group[1][2]=new Option("플랫폼서비스");
 		  group[1][3]=new Option("게임");
 		  group[1][4]=new Option("임베디드");
 		  group[1][5]=new Option("모바일앱");
 		  group[1][6]=new Option("IOS앱");
 		  group[1][7]=new Option("ERP");
 		  group[1][8]=new Option("퍼블리싱");
 		  group[1][9]=new Option("기타");
 		  group[2][0]=new Option("디자인 선택");
 		  group[2][1]=new Option("웹");
 		  group[2][2]=new Option("애플리케이션");
 		  group[2][3]=new Option("일러스트");
 		  group[2][4]=new Option("영상");
 		  group[2][5]=new Option("로고");
 		  group[2][6]=new Option("인쇄물");
 		  group[2][7]=new Option("그래픽");
 		  group[2][8]=new Option("3P");
 		  group[2][9]=new Option("PPT템플릿");
 		  group[2][10]=new Option("광고,배너");
 		  
 		 temp = document.form1.pc2_name;
 		 for (m = temp.options.length-1 ; m > 0 ; m--) {//현재 값 지우기
 		  temp.options[m]=null
 		 }
 		 for (i=0;i<group[x].length;i++){//값 셋팅
 		  //예) <option value="ss">삼성</option>
 		  temp.options[i]=new Option(group[x][i].text,group[x][i].value);
 		 }
 		 temp.options[0].selected=true//인덱스 0번째, 즉, 첫번째 선택
 		}//firstChange
 			
 	/*
 		function firstChange(){
 				var selectBox = document.getElementById("pc1_name");
 			    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
 			    alert(selectedValue + '을  선택하셨습니다.');
 			  if(selectedValue=="개발"){
 				 document.form1.action="secondCatagory1"
 	 			 document.form1.submit();
 			  }else if(selectedValue=="디자인"){
 				  document.form1.action="secondCatagory2"
 				  document.form1.submit();
 			  }
 				  
 		}
 		*/
    	function inputOnlyNumber(obj){
 			e=window.event;
 			
 			if((e.keyCode>=46 && e.keyCode<=57)||//숫자열
 			(e.keyCode>=96 && e.keyCode<=105) ||//키패드
 			e.keyCode==8||//BackSpace
 			e.keyCode==46||//Delete
 			//e.keyCode==110||//소수점: 문자키배열
 			//e.keyCode==190||//소수점: 키패브
 			e.keyCode==37||//좌 화살표
 			e.keyCode==39||//우 화살표
 			e.keyCode==35||//end키
 			e.keyCode==36||//home키
 			e.keyCode==9//tab키
 			){
 			if(e.keyCode==48 || e.keyCode==96){//0을 눌렀을 경우
 				if(obj.value=="" || obj.value=='0')//아무것도 없거나 현재값이 0일 경우에서 0을 눌렀을 경우
 					e.returnValue=false;//입력 안됨
 				else//다른 숫자뒤에 오는 0은
 					return;//입력
 			}
 			else//0이 아닌 숫자
 				return;//입력
 			}
 			else//숫자가 아니면 넣을수 없음
 				{
 				alert('숫자만 입력가능합니다');
 				e.returnValue=false;
 				
 				
 				}
 		}
 		
 		function fileChk(elem){
 			console.log(elem.value);
 			if(elem.value==""){
 				console.log("empty");
 				$("#p_filename").val(0);//파일첨부 않함
 			}else{
 				$("#p_filename").val(1);//파일첨부 함
 			}
 			
 		}
 		
 		function typing(){
 			  var val=document.getElementById("p_term").value;
 			  var value=document.getElementById("p_term");
 			  if(val>=184)
 				  alert("183일 까지 가능합니다");
 		}
 		
 		function inputBudget(obj){
			e=window.event;
 			
 			if((e.keyCode>=46 && e.keyCode<=57)||//숫자열
 			(e.keyCode>=96 && e.keyCode<=105) ||//키패드
 			e.keyCode==8||//BackSpace
 			e.keyCode==46||//Delete
 			//e.keyCode==110||//소수점: 문자키배열
 			//e.keyCode==190||//소수점: 키패브
 			e.keyCode==37||//좌 화살표
 			e.keyCode==39||//우 화살표
 			e.keyCode==35||//end키
 			e.keyCode==36||//home키
 			e.keyCode==9//tab키
 			){
 			if(e.keyCode==48 || e.keyCode==96){//0을 눌렀을 경우
 				if(obj.value=="" || obj.value=='0')//아무것도 없거나 현재값이 0일 경우에서 0을 눌렀을 경우
 					e.returnValue=false;//입력 안됨
 				else//다른 숫자뒤에 오는 0은
 					return;//입력
 			}
 			else//0이 아닌 숫자
 				return;//입력
 			}
 			else//숫자가 아니면 넣을수 없음
 				{
 				alert('숫자만 입력가능합니다');
 				e.returnValue=false;
 				
 				
 				}
 			
 		}
 		function typing2(){
 			 var val=document.getElementById("p_budget").value;
 			 if(val>=20001)
				  alert("2억원 까지 입력 가능 합니다.");
 		}
 		function inputPerson(obj){
 			e=window.event;
 			
 			if((e.keyCode>=46 && e.keyCode<=57)||//숫자열
 		 			(e.keyCode>=96 && e.keyCode<=105) ||//키패드
 		 			e.keyCode==8||//BackSpace
 		 			e.keyCode==46||//Delete
 		 			//e.keyCode==110||//소수점: 문자키배열
 		 			//e.keyCode==190||//소수점: 키패브
 		 			e.keyCode==37||//좌 화살표
 		 			e.keyCode==39||//우 화살표
 		 			e.keyCode==35||//end키
 		 			e.keyCode==36||//home키
 		 			e.keyCode==9//tab키
 		 			){
 		 			if(e.keyCode==48 || e.keyCode==96){//0을 눌렀을 경우
 		 				if(obj.value=="" || obj.value=='0')//아무것도 없거나 현재값이 0일 경우에서 0을 눌렀을 경우
 		 					e.returnValue=false;//입력 안됨
 		 				else//다른 숫자뒤에 오는 0은
 		 					return;//입력
 		 			}
 		 			else//0이 아닌 숫자
 		 				return;//입력
 		 			}
 		 			else//숫자가 아니면 넣을수 없음
 		 				{
 		 				alert('숫자만 입력가능합니다');
 		 				e.returnValue=false;
 		 				
 		 				
 		 				}
 		}
 		
 		
 		function typing3(){
 			 var val=document.getElementById("p_person").value;
 			 if(val>=11)
				  alert("10명 까지 입력 가능 합니다.");
 		}
 		
 		var maxChecked=3;
		var totalChecked=0;
 		function CountChecked(obj){
 			
 			if(obj.checked){
 				console.log(obj.value);
 				totalChecked+=1;
 			}			
 			else
 				totalChecked-=1;
 			console.log(totalChecked)
 			if(totalChecked>maxChecked){
 				alert("최대 3개 까지 가능합니다.");
 				obj.checked=false;
 				totalChecked-=1;
 			}
 			
 			var valueArr=[];
 	 		var list=document.getElementsByName("p_plnum[]");		
 	 		var listi=document.getElementById("inter");
 	 		var p_plnum0=document.getElementById("p_plnum0");
 	 		var p_plnum1=document.getElementById("p_plnum1");
 	 		var p_plnum2=document.getElementById("p_plnum2");
 	 		for(var i=0; i<list.length; i++){
 	 			if(list[i].checked){
 	 				valueArr.push(list[i].value);
 	 			}
 	 		}
 	 		var str='';
 	 		for(var i=0; i<valueArr.length; i++){
 	 			str+=valueArr[i]+",";
 			}
 	 		console.log(str); 
 	 		listi.setAttribute("value",str);
 	 		var newArr=str.split(",");
 	 		console.log(newArr);
 	 		console.log(newArr[0]);
 	 		p_plnum0.setAttribute("value",newArr[0]);
 	 		p_plnum1.setAttribute("value",newArr[1]);
 	 		//if(newArr[2] == undefined){
 	 			//p_plnum2.setAttribute("value",null);
 	 		//}else{
 	 			p_plnum2.setAttribute("value",newArr[2]);
 	 		//}
 	 		
 		}

		function CountChecked(obj){
	          
	          if(obj.checked){
	             console.log(obj.value);
	             totalChecked+=1;
	          }         
	          else
	             totalChecked-=1;
	          console.log(totalChecked)
	          if(totalChecked>maxChecked){
	             alert("최대 3개 까지 가능합니다.");
	             obj.checked=false;
	             totalChecked-=1;
	          }
	          
	          var valueArr=[];
	           var list=document.getElementsByName("p_plnum[]");      
	           var listi=document.getElementById("inter");
	           var p_plnum0=document.getElementById("p_plnum0");
	           var p_plnum1=document.getElementById("p_plnum1");
	           var p_plnum2=document.getElementById("p_plnum2");
	           for(var i=0; i<list.length; i++){
	              if(list[i].checked){
	                 valueArr.push(list[i].value);
	              }
	           }
	           var str='';
	           for(var i=0; i<valueArr.length; i++){
	              str+=valueArr[i]+",";
	          }
	           console.log(str); 
	           listi.setAttribute("value",str);
	           var newArr=str.split(",");
	           console.log(newArr);
	           console.log(newArr[0]);
	           p_plnum0.setAttribute("value",newArr[0]);
	           p_plnum1.setAttribute("value",newArr[1]);
	           p_plnum2.setAttribute("value",newArr[2]);
	           
	       }

 		/*
 		function check(){
 			var frm=document.form1;
 			var length=frm.length-1;//마지막 회원가입은 하면 않되어 -1을 함
 			for(var i=0; i<length; i++){//하나라도 빠지면 작동이 않되게 하기 위해 필요
 				if(frm[i].value=="" || frm[i]==null){
 					alert(frm[i].name="을 입력하세요");//빠진 부분이 경고창에 입력됨
 					frm[i].focus();
 					return false;//실패시//onsubmit에서는 꼭 필요
 				}
 			}
 			return true;//성공시
 		}*/
    //$("#complete").click(function(){
    	//	$("#replyForm").submit();
  //  });
</script>
</html>