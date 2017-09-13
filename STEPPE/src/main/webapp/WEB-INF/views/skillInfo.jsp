<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
<script src="resources/js/jquery-3.2.1.min.js"></script>
<!-- =======================================================
        Theme Name: Day
        Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
<style>
.container {
   color: black;
}
input{
color:black;
}
table {
color:black;
   text-align: center;
   vertical-align: middle;
}
#cTable{
   color: black;
}
#complete {
   width: 100%;
   height: 40px;
   background: #0f1c34;
   box-sizing: border-box;
   border-radius: 5px;
   border: 1px solid white;
   color: #fff;
   font-weight: bold;
   font-size: 14px;
   outline: none;
   cursor: pointer;
}

input {
   border-radius: 5px;
}
#deleteBtn{
	height: 40px;
   background: #0f1c34;
   box-sizing: border-box;
   border-radius: 5px;
   border: 1px solid white;
   color: #fff;
   font-weight: bold;
   font-size: 14px;
   outline: none;
   cursor: pointer;
}
</style>
</head>
<body>
   <!-- 헤더 영역 -->  
	<jsp:include page="header.jsp" />
	<jsp:include page="mypagefrmenu.jsp" />
   	<jsp:include page="profilemenu.jsp" />
   <div class="container" style="height:-webkit-fill-available;">
      <!--style="height:-webkit-fill-available;"-->
      <form action="addSkill" method="post" id="skill">
      	 <h3 align="center">기술 정보</h3>		
         <table class="table">
         <tr>
            <th>
               <select name="sk_name">
                  <option value="">언어 선택</option>
                  <option value="JAVA">JAVA</option>
                  <option value="HTML">HTML</option>
                  <option value="CSS">CSS</option>
               </select>
            </th>
            <th>
               <select name="sk_grade">
                  <option value="">등급 선택</option>
                  <option value="초급">초급</option>
                  <option value="중급">중급</option>
                  <option value="상급">상급</option>
               </select>
            </th>
            <th>
               <input type="text" name="sk_career" placeholder="경력"/>
            </th>
            <th>
               <input type="button" id="complete" value="추가"/>
            </th>
         </tr>
      </table>      
      </form>
      <table>
			<tr align="center" height="25">
				<td width="130">사용언어</td>
				<td width="320">등급</td>
				<td width="300">경력기간</td>
			</tr>
		</table>
		<table id="skTable" style="width: 100%;">
			<c:forEach var="skill" items="${sklist}">
				<tr align="center" height="25">
					<td width="200">${data[i].sk_name}</td>
					<td width="200">${data[i].sk_grade}</td>
					<td width="200">${data[i].sk_career}</td>
				</tr>
			</c:forEach>
		</table>
   </div>

   <hr>
   <div class="container">
      <!--style="height:-webkit-fill-available;"-->
      <h1 style="text-align: center;"></h1>
   </div>
   <div class="row"></div>
   <!-- 푸터 영역 -->  
	<jsp:include page="footer.jsp" />


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!--<script src="js/jquery.js"></script>-->
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/wow.min.js"></script>
   <script>
      wow = new WOW({}).init();
   </script>
</body>
<script>
   /* $("#complete").click(function(){
       var term = $("#term").val();
       var company = $("#company").val();
       var rank= $("#rank").val();
       console.log(term);
       console.log(company);
       if(term == "" || company == "" || rank == ""){
         alert("빈항목이 존재합니다!");      
       } 
         
       if(term != "" && company != "" && rank != ""){
           $("#career").submit();
       }
   }); */
   $(document).ready(function(){
      var sklist='';    
      $.ajax({
         type : 'get',
         url : 'showMySkill',
         data : $('#skill').serialize(),
         //$('#rForm').serialize(), 폼 전체 데이터 전송
         dataType : 'json',
         success : function(data) { //댓글 리스트 json형태 반환
            console.log(data); //json 구조파악
            for(var i=0;i<data.length;i++){
               sklist+='<tr height="25" align="center">'
               +'<td width="130">'+data[i].sk_name+'</td>'
               +'<td width="320">'+data[i].sk_grade+'</td>'
               +'<td width="300">'+data[i].sk_career+'</td>'
               +"<td style='text-align:right;'><input type='button' id='deleteBtn' value='삭제' onclick='memberDelete("+data[i].sk_num+")'/></td></tr>"
         }
         $('#skTable').html(sklist);
         },
         error : function(error) {
            alert("error");
            console.log(error);
         }
      });

   $("#complete").click(function() {
            var sklist='';
      $.ajax({
         type : 'get',
         url : 'addSkill',
         data : $('#skill').serialize(),
         //$('#rForm').serialize(), 폼 전체 데이터 전송
         dataType : 'json',
         success : function(data) { //댓글 리스트 json형태 반환
            console.log(data); //json 구조파악
            for(var i=0;i<data.length;i++){
               sklist+='<tr height="25" align="center">'
               +'<td width="130">'+data[i].sk_name+'</td>'
               +'<td width="320">'+data[i].sk_grade+'</td>'
               +'<td width="300">'+data[i].sk_career+'</td>'
               +"<td style='text-align:right;'><input type='button' value='삭제' onclick='memberDelete("+data[i].sk_num+")'/></td></tr>"
         }
         $('#skTable').html(sklist);
         },
         error : function(error) {
            alert("error");
            console.log(error);
         }
      });
   });
   });
   function memberDelete(num){
      var number = num;
      var sklist='';
      $.ajax({
         type : 'get',
         url : 'deleteSkill',
         data : {num:num},
         //$('#rForm').serialize(), 폼 전체 데이터 전송
         dataType : 'json',
         success : function(data) { //댓글 리스트 json형태 반환
            console.log(data); //json 구조파악
            for(var i=0;i<data.length;i++){
               sklist+='<tr height="25" align="center">'
               +'<td width="130">'+data[i].sk_name+'</td>'
               +'<td width="320">'+data[i].sk_grade+'</td>'
               +'<td width="300">'+data[i].sk_career+'</td>'
               +"<td><input type='button' value='삭제' onclick='memberDelete("+data[i].sk_num+")'/></td></tr>"
         }
         $('#skTable').html(sklist);
         },
         error : function(error) {
            console.log(error);
         } 
   });
      location.reload();
   }
   

   /* function(){
      
   } */
   /*function complete(){
       var term = $("#term").val();
       var company = $("#company").val();
       var rank= $("#rank").val();
       console.log(term);
       console.log(company);
       if(term == "" || company == "" || rank == ""){
         alert("빈항목이 존재합니다!");      
       } 
         
       if(term != "" && company != "" && rank != ""){
           $("#career").submit();
       }    
   }*/
</script>
</html>