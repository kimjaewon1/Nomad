<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      <link href="resources/css/heroic-features.css" rel="stylesheet" />
      <style>
      	
         body{
            padding-top: 0px;
         }
         input{
            color: black;
         }
         input#search{
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
      <jsp:include page="header.jsp" />
      
      <!--메인페이지 영역-->
      
         
            
            ${flist}
            ${slist}               
      <hr>
   
      <!--푸터 영역 시작-->
      <jsp:include page="footer.jsp" />
      <!--푸터 영역 끝-->
   
   
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="resources/js/bootstrap.min.js"></script>
      <script src="resources/js/wow.min.js"></script>
      <script>wow = new WOW({}).init();</script>
      
   </body>
   <script>
   
      $("#search").click(function(){
         var keyword=$("#keyword").val();
         if(keyword=="" || keyword==null){
            alert("프리랜서의 이름을 입력하세요.");
         }
         if(keyword!="" && keyword!=null){
            $("#searchForm").submit();
         }
      });
      
      
   </script>
   
</html>