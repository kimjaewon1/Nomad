<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
      <style>
         .about{
            color:black;
            height: -webkit-fill-available;
            width:90%; 
            margin: 5%; 
            margin-top: 0% ; 
            margin-bottom: 20%;
            padding-top: 5%;
         }
         table{
            text-align: center;
         }
         .insertButton{
            margin-left: 80%;
         }
         .buttonB,.buttonA{
            width:85px;
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
         .AA{
            color:#fff;
         }
         .t1,.t3,.t4{
         	width: 10%;
         }
         .t2{
         	width: 70%;
         }
         .a4{
         	color: #9497e8;
         }
         .a2{
         	color: #2d31af;
         }
      </style>   
       <!-- =======================================================
           Theme Name: Day
           Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
           Author: BootstrapMade
           Author URL: https://bootstrapmade.com
       ======================================================= -->
  </head>
<body>
   <jsp:include page="header.jsp" />
    <div class="about">
      <form  action="showFstList">
         <select name = "FstList">
            <option value="java">JAVA</option>
            <option value="html">HTML</option>
            <option value="jsp">JSP</option>
            <option value="c">C</option>
            <option value="android">Android</option>
         </select>
         <input type = "submit" value="확인" class="buttonB">
      </form>
      <br/><br/>
         <h3>${tname}</h3>
            <div style="overflow:scroll; width:100%; height:850px;">
               <table class="table table-striped">
               <tr><td class = 't1'>문제 번호</td><td class = 't2'>문제 내용</td><td class = 't3'>답</td><td class = 't4'>수정 & 삭제</td></tr>
               ${tlist}
               </table>
            </div>
            <br/>
            <div class = "insertButton">
            <button class='buttonA'><a href="goInsertFst" class='AA'>문제 추가</a></button>
            </div>
      <br/><br/>
   </div>
   <div class="row"></div>
   <!-- 푸터 영역 -->  
      <jsp:include page="footer.jsp" />
</body>
<script type="text/javascript"> 
var message = '${msg}';
if(message!=""){
alert(message); 
}
</script>
   <script src="resources/js/jquery-3.2.1.min.js"></script>      
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>   
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
</html>