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
<title>steppe 샘플페이지</title>
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
.container {
   color: black;
}

table {
   text-align: center;
   vertical-align: middle;
}
#complete {
   width: 100%;
   height: 40px;
   background: cornflowerblue;
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
</style>
</head>
<body>
   <!--상단 메뉴바-->
   <header id="header">
      <nav class="navbar navbar-default navbar-static-top" role="banner">
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
                     <li role="presentation"><a href="intro">steppe?</a></li>
                     <li role="presentation"><a href="project">프로젝트</a></li>
                     <li role="presentation"><a href="freelancer">프리랜서</a></li>
                     <li role="presentation"><a href="manual">이용방법</a></li>
                     <li role="presentation"><a href="pms">프로젝트 관리</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </nav>
   </header>

   <div class="container">
      <!--style="height:-webkit-fill-available;"-->
      <form action="" method="post" id="carrier">
         <table class="table">
            <tr>
               <td><p>경력 기간</p></td>
               <td colspan="2"><input style="width: 40%;" type="text"
                  placeholder="경력기간을 입력해주세요" name="ca_term" id="term"></td>
            </tr>
            <tr>
               <td><p>회사명</p></td>
               <td colspan="2"><input style="width: 40%;" type="text"
                  placeholder="회사명을 입력해주세요" name="ca_company" id="company"></td>
            </tr>
            <tr>
               <td><p>근무직급</p></td>
               <td colspan="2"><input style="width: 40%;" type="text"
                  placeholder="근무 직급을 입력해주세요" name="ca_rank" id="rank"></td>
            </tr>
            <tr rowspan="3" colspan="3">
               <td colspan="3"><input type="button" id="complete"
                  value="작성완료" /></td>
            </tr>
         </table>
      </form>
   </div>

   <hr>
   <div class="container">
      <!--style="height:-webkit-fill-available;"-->
      <h1 style="text-align: center;">경력정보 출력 영역으로 사용예정</h1>
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


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <!--<script src="js/jquery.js"></script>-->
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/wow.min.js"></script>
   <script>wow = new WOW({}).init();</script>
</body>
<script>
    $("#complete").click(function(){
        var term = $("#term").val();
        var company = $("#company").val();
        var rank= $("#rank").val();
        console.log(term);
        console.log(company);
        if(term == "" || company == "" || rank == ""){
          alert("빈항목이 존재합니다!");      
        } 
          
        if(term != "" && company != "" && rank != ""){
            $("#carrier").submit();
        }    
    });
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
            $("#carrier").submit();
        }    
   }*/
</script>
</html>