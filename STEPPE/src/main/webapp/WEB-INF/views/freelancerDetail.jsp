<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
   <link rel="stylesheet" href="resources/css/freelancerDetail.css"/> 
   <link href="resources/css/semantic.min.css" rel="stylesheet" /> 
  </head>
  <body>
     <jsp:include page="header.jsp" />
    
   <div class="about" style="height:-webkit-fill-available;">
         <div class="container" style="height: 100%;">
         <div class="row">
            <form action="goReportWrite" method="get">
               <input type="hidden" name="m_id" value="${member.m_id}"/>
               <c:set var="m_id" value="${m_id}"/>
               
               <c:if test="${!empty m_id}">
                   <input id="report" type="submit" value="신고하기"/>
               </c:if>
             </form>
             <c:set var="m_kind" value="${m_kind}"/>
             <%-- <form action="goInsertEstimate" method="get">
	             <c:if test="${m_kind eq 'C'}">
	             	<input type="hidden" name="m_id" value="${member.m_id}"/>
	                <input id="estimate" type="submit" value="견적 요청"/>
	             </c:if>
             </form> --%>
             <c:if test="${m_kind eq 'C'}">
                <a href="goInsertEstimate?mid=${freelancer.m_id}"><input id="estimate" type="button" value="견적 요청"/></a>
             </c:if>
             
            </div>
            <table class="table table-striped" style="color: black; text-align: center;">
               <tr style="text-align:center;">
                  <td colspan="3">
                     <img style="width: 400px; height: 250px;" src="resources/upload/${photo}"/>
                  </td>
               </tr>
               <tr>
					<td>이름</td>
					<td>이메일 주소</td>
					<td rowspan="2"  style="vertical-align: bottom;">
						<div class="ui labeled button" tabindex="0" style="background-color: white;">
							<div class="ui blue button">
								<i><a style="color: white;" href="likeInsert?getid=${freelancer.m_id}">Like　♡</a></i>
							</div>
							<a class="ui basic gray left pointing label"> ${like} </a>
						</div>
					</td>
				</tr>
				<tr>
					<td>${freelancer.m_name}</td>
					<td>${freelancer.m_email}</td>
				</tr>
               
               
            </table>
            <hr/>
            ${career}
            <hr/>
            ${skill}
            <hr/>
            ${port}
         </div>
        
         <jsp:include page="footer.jsp" />
         <div id = "articleView_layer">
			<div id = "bg_layer"></div>
			<div id = "contents_layer"></div>
			
		</div>
   </div>         
    <script src="resources/js/jquery-3.2.1.min.js"></script>      
    <script src="resources/js/bootstrap.min.js"></script>   
   <script src="resources/js/wow.min.js"></script>
   <script src="resources/js/semantic.min.js"></script>
   <script>wow = new WOW({}).init();</script>   
</body>

<script>
function articleView(PFNUM){
	$('#articleView_layer').addClass('open');
	$.ajax({
			type : 'get',
			url : 'portView',
			data : {pf_num:PFNUM},
			timeout:3000, //대기시간이 지날경우 에러 상태(3초)
		//dataType : html,json
		success:function(data){
			//alert(data); //test용
			$('#contents_layer').html(data);
		},
		error:function(error){
			alert("error");
			console.log(error);
		}
	}); //ajax End
} //function End
//LightBox 해제
$(function(){	//$(document).ready(function(){})
	var layerWindow = $('#articleView_layer');
	layerWindow.find('#bg_layer').mousedown(
		function(event){
			layerWindow.removeClass('open');
			return;
		});
	$(document).keydown(function(event){
		console.log(event);
		if(event.keyCode!=27) return;
		if(layerWindow.hasClass('open')){
			layerWindow.removeClass('open');
		}
	}); //keydown End
});
var message = '${msg}';
if(message!=""){
	alert(message); 
}
</script>
</html>