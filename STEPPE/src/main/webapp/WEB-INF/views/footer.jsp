<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sub-footer">

      <div class="container">
         <div class="social-icon">
            <div class="col-md-4">
            
                  <c:if test="${m_id eq 'admin'}">
                     <a href="goMemberMM" style="color: white;">
                        	회원관리         
                     </a>&nbsp;&nbsp;&nbsp;
                     
                  </c:if>
                  <c:if test="${m_id eq 'admin'}">
                     <a href="goProjectMM" style="color: white;">
                        	프로젝트 관리
                     </a>&nbsp;&nbsp;&nbsp;
                  </c:if>
                  <c:if test="${m_id eq 'admin'}">
                     <a href="goReportList" style="color: white;">
                       		 신고 관리
                     </a>
                  </c:if>
                  <br/>
                  <c:if test="${m_id eq 'admin'}">
                     <a href="goFstMM" style="color: white;">
                        	자격 시험 관리
                     </a>&nbsp;&nbsp;&nbsp;
                  </c:if>
                  <c:if test="${m_id eq 'admin'}">
                     <a href="goPurchaseMM" style="color: white;">
                       		 결제 관리
                     </a>
                  </c:if>
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

                        <a href="goNotice">공지사항</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">faq</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">이용약관</a>
                    </div>
            </div>
				<div class="social-icon">
				<div class="col-md-4">
				
						
				</div>
				</div>
			</div>
			                
      </div>            
   </div>
  

</body>
</html>