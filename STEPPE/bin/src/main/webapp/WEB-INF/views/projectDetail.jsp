<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<style>
		#body{
			margin-top: 50px;
		}
        table{
            color: black;
        }
       	textarea{
       		resize: none;
       		white-space: pre-line;
       	}
       	#priceForm{
       		margin-bottom:50px;
       	}
       	input{
       		color:black;
       	}
       	input#check{
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
       	#replyForm{
       		margin-bottom: 50px;
       	}
       	input#replyInsert{
       		background: #0f1c34;
		   	box-sizing: border-box;
		   	border-radius: 5px;
		   	border: 1px solid white;
		   	color: #fff;
		   	font-weight: bold;
		   	font-size: 14px;
		   	outline: none;
		   	cursor: pointer;
		   	float: right;
       	}
       	input#list{
       		background: #0f1c34;
		   	box-sizing: border-box;
		   	border-radius: 5px;
		   	border: 1px solid white;
		   	color: #fff;
		   	font-weight: bold;
		   	font-size: 14px;
		   	outline: none;
		   	cursor: pointer;
		   	float: right;
       	}
       	#r_content{
       		color:black;
       		width: 100%;
       	}
    </style>
  </head>
  <body>
    <!--상단 메뉴바-->
	<header id="header">
        <nav class="navbar navbar-default navbar-static-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                   <div class="navbar-brand">
						<a href="main"><h1>steppe</h1></a>
					</div>
                </div>				
                <div class="navbar-collapse collapse">							
					<div class="menu">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="goIntro">steppe?</a></li>
							<li role="presentation"><a href="goProject">프로젝트</a></li>
							<li role="presentation"><a href="goFreelancer">프리랜서</a></li>
							<li role="presentation"><a href="goManual">이용방법</a></li>
                            <li role="presentation"><a href="goPms">프로젝트 관리</a></li>
  						</ul>
					</div>
				</div>		
            </div>
        </nav>	
    </header>
    
		<div class="col-md-12 col-xs-12 col-lg-12 col-sm-12" id="body">
            <table class="table table-responsive">
                <tr>
                    <td>제목</td>
                    <td colspan="3">홈페이지 제작</td>
                </tr>
                <tr>
                    <td>프로젝트 기간</td>
                    <td>예상 기간</td>
                    
                    <td colspan="2">지원자</td>
                </tr>
                <tr>
                    <td>프로젝트기간 표기 영역</td>
                    <td>예상기간 표기 영역</td>
                    <td>지원자 수 표기 영역</td>
                </tr>
                <tr>
                    <td>필요언어</td>
                    <td>필요언어 표기 영역</td>
                    <td>
                        <form action="" method="post" id="priceForm">
                            <input type="text" placeholder="입찰가격을 입력하세요." id="price" name="price">
                            <input type="button" value="입찰 가격 결정" id="check"/>
                        </form>
                    </td>
                    <td><a href="goProject"><input type="button" value="목록보기" id="list"></a></td>
                </tr>
            
            </table>
        </div>
    
	<hr>
    <div class="container">
            <h1 style="text-align:center; color:black;">프로젝트 상세 설명 영역</h1>
            <p>
                ※ 프로젝트 진행 방식
                - 초기 오프라인 미팅 1회 
                - 원격 / 재택근무 
                - PMS 관리 / 이메일,유선 소통
            </p>
            <p>
                ※프로젝트의 현재 상황

                - 스타트업 기업 팀구축 완료된 상태로 서비스 시작을 위한 초기 단계 

                - 화면 설계 문서는 아직 없으며, 대략적인 기능 정의 정도 있음
            </p>

            <p>
                ※상세한 업무 내용

                [ 일용직 중개 웹서비스 1차모델 개발 ]

                - 개발 분류 : 서버 및 웹관리자 , 클라이언트 ( PC WEB ) , 디자인

                + 서비스 간략 소개 

                   - 역경매 방식으로 돌봄이 시터, 가사도우미와 의뢰인을 연결하는 중개 웹서비스 
            </p>
            <p>
                + 개발 내용 

                   - 회원가입, 로그인 ( 실명인증 ) 

                   - 구인공고 등록 , 상세 페이지 

                   - 지역별, 카테고리별, 급여별 검색 

                   - 역경매 방식의 지원하기 / 지원내역 보기 

                   - 의뢰인 도우미 선택 , 연락처 열람 

                   - 초기에는 결제 기능 없음 ( 무료 ) 추후 BM 모델 탑재 

                     :: 추후 회원제 모델로 고려중 

                   - 전체 메일 ,SMS 발송 

                   - 특정 영역 광고 배너 등록, 관리 

                   - 가사/육아 관련 컨텐츠 게시판 

                - 초기 PC 웹 버전으로 시작하여 추후 앱으로 고도화 진행 예정 

                - 사업자등록증이 있는 개인 / 팀 단위 지원 희망 ( 일반 개인 불가 ) 

                - 개발 언어 무관
            </p>
            <p>

                # 킥오프일정 : 8월 4째주 

                # IT 개발이 처음이기에 많은 조언/컨설팅 부탁드립니다.
            </p>    
           
    </div>
    <hr/>
    <div class="container">
        <h1 style="color:black; text-align:center;">댓글 영역으로 활용</h1>
        <div class="row"></div>
        <table class="table table-responsive">
            <tr>
                <td>작성자</td>
                <td colspan="5">작성 내용</td>
            </tr>
            <tr>
                <td><p>핫산</p></td>
                <td colspan="5"><p>싸잔님 월급 주쎄오 쩨발</p></td>
            </tr>
            <tr>
                <td><p>핫산</p></td>
                <td colspan="5"><p>3달째 밀렸어오 싸잔님</p></td>
            </tr>
            <tr>
                <td><p>핫산</p></td>
                <td colspan="5"><p>가족들 굶어요 싸잔님</p></td>
            </tr>
        </table>
        <form action="insertComment" method="post" id="replyForm">
        	<textarea name="r_content" id="r_content"></textarea><br/>
        	<input type="button" id="replyInsert" value="댓글작성"/>
        </form>
    </div>
    <div class="row"></div>
    <!--푸터 영역 시작-->
	<div class="sub-footer">
		<div class="container">
			<div class="social-icon">
				<div class="col-md-4">
						
				</div>
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
                        <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        <br/>
                        <a href="#">공지사항</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">faq</a>&nbsp;&nbsp;&nbsp;
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
    $("#check").click(function(){
        var price = $("#price").val();
        
        
        if(price == "" ){
          alert("입찰가를 입력하세요!");      
        } 
          
        if(price != ""){
            $("#priceForm").submit();
        }    
    });
    $("#replyInsert").click(function(){
    	var r_content  = $("#r_content").val();
    	
    	if(r_content == ""){
    		alert("댓글을 입력하세요!");
    	}
    	if(r_content != ""){
    		$("#replyForm").submit();
    	}
    });
</script>
</html>