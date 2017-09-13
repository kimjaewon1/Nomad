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
	</head>

  <body>
    <jsp:include page="header.jsp" />
    <!--carousel 영역-->
   <div class="slider">      
      <div id="about-slider">
         <div id="carousel-slider" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators visible-xs">
               <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
               <li data-target="#carousel-slider" data-slide-to="1"></li>
               <li data-target="#carousel-slider" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner">
               <div class="item active">                  
                  <img src="resources/img/slide.jpg" class="img-responsive" alt=""> 
                  <div class="carousel-caption">
                     <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.3s">                        
                        <h2><span>Steppe는 쉽고 빠릅니다.</span></h2>
                     </div>
                     <div class="col-md-10 col-md-offset-1">
                        <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">                        
                           <p style="font-size: 20px;">사용자에게 최적화된 검토 시스템을 통해 프로젝트 지원자의 견적과 프로필을 한눈에 비교하실 수 있습니다.</p>
                        </div>
                     </div>
                     <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.9s">                        
                        
                     </div>
                  </div>
                </div>
         
                <div class="item">
                  <img src="resources/img/slide.jpg" class="img-responsive" alt=""> 
                  <div class="carousel-caption">
                     <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.3s">                        
                        <h2>Steppe은 안전합니다.</h2>
                     </div>
                     <div class="col-md-10 col-md-offset-1">
                        <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">                        
                           <p style="font-size: 20px;">Steppe은 정보를 객관적으로 파악할 수 있도록 노력하고 있습니다.</p>
                        </div>
                     </div>
                     <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.9s">                        
                        
                     </div>
                  </div>
                </div> 
            </div>
            
            <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
               <i class="fa fa-angle-left"></i> 
            </a>
            
            <a class=" right carousel-control hidden-xs"href="#carousel-slider" data-slide="next">
               <i class="fa fa-angle-right"></i> 
            </a>
         </div> <!--/#carousel-slider-->
      </div><!--/#about-slider-->
   </div><!--/#slider-->
    <!--carousel 영역-->
    

	<!--메인페이지 영역-->
	<div class="about">
			${plist}
		 	${flist}
	</div>			
	<hr>
    <div class="row"></div>
     
    <!-- 푸터 영역 -->  
    <jsp:include page="footer.jsp" />
      
     
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="resources/js/jquery-3.2.1.min.js"></script>		
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
</body>
<script type="text/javascript"> 
var message = '${msg}';
if(message!=""){
alert(message); 
}
</script>
</html>