<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link rel="stylesheet" href="resources/css/projectDetail.css"/>
    <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
  </head>
  <body>
    <jsp:include page="header.jsp" />
    	<div class="about">
    		<div class="container">
	           	<div class="container">
            <table class="table table-responsive">
                <tr>
                    <td>제목</td>
                    <td colspan="3" style="text-align: center;">${project.p_title}</td>
                </tr>
                <tr>
                	<td>작성자</td>
                	<td colspan="3" style="text-align: center;">${project.p_mid}</td>
                </tr>
                <tr>
                    <td>프로젝트 기간</td>
                    <td style="text-align: center;">지원자 (필요인원)</td>
                    <td style="text-align: center;">예산 금액</td>
                    <td style="text-align: right;">마감일</td>
                </tr>
                <tr>
                    <td>${project.p_term}일</td>
                    <td style="text-align: center;">${project.p_vol}명 (${project.p_person}명)</td>
                    <td style="text-align: center;">${project.p_budget}만원</td>
                    <td style="text-align: right;">${project.p_deadline}</td>
                </tr>
                <tr>
                    <td>필요언어</td>
                    <td>${project.p_plnum0}　${project.p_plnum1}　${project.p_plnum2}</td>
                    <td colspan="2" style="text-align: center;">
        				<c:set var="m_kind" value="${m_kind}" />
						<c:if test="${m_kind eq 'F'}">
                        <form action="insertVolunteer" method="post" id="priceForm">
                        <input type="hidden" name="v_pnum" value="${project.p_num}" />
                            <input type="text" placeholder="입찰가 (만원단위 ex)200)" id="price" name="v_bid">
                            <input type="button" value="결정" id="check"/>
                            <a href="goProject"><input type="button" value="목록보기" id="list"></a>
                        </form>
                        </c:if>
                        
                    </td>
                    
                </tr>
            
            </table>
            <div id="text1"></div>
        </div>
		            <div class="container">
		            <h1 style="text-align:center; color:black;">프로젝트 설명</h1>
		                <p>${project.p_content}</p>
		                <br/>
		                <img style="width: 80%; height: 100%;" src="resources/upload/${project.p_filename}"/>
		            </div>    
		           <hr/>
		           
		           <div class="container" id="reply">
		           <h1 style="color:black; text-align:center;">댓글</h1>
		           <form name="replyForm" method="post">
		           <table class="table table-striped">
		           <tr>
		           <th style="text-align:center; width:20%;">작성자</th>
		           <th colspan="5" style="text-align:center;">작성내용</th>
		           <th colspan="2" style="text-align:center; width:20%;">작성날짜</th>
		           </tr>
		           ${reply}
		           </table>
		           <input type="hidden" name="p_num" value="${p_num }" />
		           <input type="hidden" name="r_num" id="r_num" />
		           <input type="hidden" name="r_mid" value="${r_mid}"/>
		           </form>
		           <form action="insertComment" method="post" id="insertReplyForm">
						<input name="p_num" type="hidden" value="${project.p_num}"/>
						<textarea name="r_content" id="r_content"></textarea><br/>
						<input type="button" id="replyInsert" value="댓글작성"/>
						</form>
		           </div>
			        </div>
			        
			        <div class="row"></div>
		      </div>
    <!-- 푸터 영역 -->  
	<jsp:include page="footer.jsp" />

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="js/jquery.js"></script>-->		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>	
	<script src="resources/js/wow.min.js"></script>
	<script>wow = new WOW({}).init();</script>	
</body>
<script>
	
   $("#check").click(function(){
        var price = $("#price").val();
        var person=${project.p_person};
        var vol=${project.p_vol};
        var budget=${project.p_budget};
        console.log(person);
        var money=(budget/person)+(budget%person);
        console.log(money);
        if(price == ""){
          alert("입찰가를 입력하세요!");      
        }
        if(price>money){
        	alert("1인당 지급가능 금액을 초과하였습니다.");
        	$("#price").val("최대금액은 : "+money+"만원 입니다");
        }
          
        if(price != "" && price<=money){
        	//console.log(price);
            $("#priceForm").submit();
        }    
    });
    $("#replyInsert").click(function(){
    	var r_content  = $("#r_content").val();
    	
    	if(r_content == ""){
    		alert("댓글을 입력하세요!");
    	}
    	if(r_content != ""){
    		$("#insertReplyForm").submit();
    	}
    });
    
    function deleteReply(num) {
    	$('#r_num').val(num);
    	document.replyForm.action="./deleteReply";
    	document.replyForm.submit();
    }
</script>
<script type="text/javascript">
 	
    var date;
    date = new Date();
    var yyyy = "${project.p_deadline}".substring(0,4);
    var mm = "${project.p_deadline}".substring(5,7);
    var dd = "${project.p_deadline}".substring(8,10);
    lastDate = new Date(mm+"/"+dd+"/"+yyyy+" 23:59:59");
    //임시 시간 mm/dd/yyyy hh:mm:ss
    /* lastDate = new Date(mm+"/23/"+yyyy+" 11:05:30"); */
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);
    var lastTime = lastDate.getTime();
 
    // 남은 시간 카운터
    function remain(){
        var now = new Date();
        var person=${project.p_person};
        var vol=${project.p_vol};
        var budget=${project.p_budget};
        var money=Math.floor(budget/person);
        var gap = Math.round((lastTime - now.getTime()) / 1000);
 
        var D = Math.floor(gap / 86400);
        var H = Math.floor((gap - D * 86400) / 3600 % 3600);
        var M = Math.floor((gap - H * 3600) / 60 % 60);
        var S = Math.floor((gap - M * 60) % 60);
        if(D<0 || H<0 || M<0 || S<0){
        	if(vol<person){
        		document.getElementById('text1').innerHTML = '지원자가 부족합니다.';
        		$("#price").val(money);
        	}else if(vol>=person){
        		document.getElementById('text1').innerHTML = '입찰이 마감 되었습니다.';
        		$("#check").hide();
        		$("#price").hide();
        	}
        }else{
        	document.getElementById('text1').innerHTML = '입찰 마감 시간이 ' + D + '일 ' + H + '시간 ' + M + '분 ' + S + '초 남았습니다.';	
        }
    }
    remain();
    setInterval(remain, 1000);
    var message = '${msg}';
    if(message!=""){
    	alert(message); 
    }
</script>
</html>