package com.steppe.nomad.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Member;
import com.steppe.nomad.dao.MemberDao;
import com.steppe.nomad.dao.ProjectDao;
import com.steppe.nomad.dao.VolunteerDao;
import com.steppe.nomad.userClass.UploadFile;

@Service
public class MemberManagement {

	int code;

	@Autowired
	private HttpSession session;//request.getSession();

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;

	//싱글톤
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private VolunteerDao vDao;

	private ModelAndView mav;

	public ModelAndView execute(Member mb, int cmd){
		switch (cmd) {
		case 1:
			memberAccess(mb);//로그인
			break;
		case 2:
			logout(mb);//로그아웃
			break;
		case 3:
			updateInfo(mb);
			break;
		default:
			break;
		}
		return mav;

	}
	public ModelAndView execute(String m_name,String m_email, int cmd){
		switch (cmd) {
		case 1:
			findId(m_name,m_email);//아이디 찾기
			break;
		default:
			break;
		}
		return mav;
	}
	public ModelAndView executes(String m_id,String m_email, int cmd){
		switch (cmd) {
		case 1:
			findPw(m_id,m_email);//아이디 찾기
			break;
		default:
			break;
		}
		return mav;
	}


	private void updateInfo(Member mb) {
		mav = new ModelAndView();
		String view = null;
		String m_id = session.getAttribute("m_id").toString();
		System.out.println("아이디는="+m_id);
		if(m_id!=null&&!m_id.equals(" ")){
			Member mbUpdate = mDao.getMemberInfo(m_id);
			mav.addObject("mbUpdate",mbUpdate);
			view = "updateUserInfo";
		}else{
			view = "main";
		}
		mav.setViewName(view);
	}


	public ModelAndView execute(MultipartHttpServletRequest multi, int cmd){
		switch (cmd) {
		case 1:
			memberInsert(multi);//회원가입
			break;
		case 2:
			memberUpdate(multi);
			break;
		default:
			break;
		}
		return mav;

	}
	
	public ModelAndView execute(int cmd) {
		switch(cmd){
		case 1:
			deleteMember();//회원 탈퇴 조건 검색
			break;
		case 2:
			deleteMemberMake();//회원 탈퇴 실행
			break;
		case 3:
			goMyPage();//마이페이지로 이동
			break;
		}
		return mav;
	}


	private void goMyPage() {//회원의 종류에 따라 다른 URL발생해 마이페이지로 이동
		String view=null;
		mav=new ModelAndView();
		String m_kind=session.getAttribute("m_kind").toString();
		if(session!=null && session.getAttribute("m_id")!= "" && m_kind.equals("C")){
			view="redirect:goMyPageCI";
		}else if(session!=null && session.getAttribute("m_id")!= "" && m_kind.equals("F")){
			view="redirect:goMyPageFr";
		}else{
			view="home";
		}
		mav.setViewName(view);
		
	}
	private void memberUpdate(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		String m_id = session.getAttribute("m_id").toString();
		System.out.println("엠아이디="+m_id);
		String view = null;
		Map<String, String> map = null;
		if(session!=null && session.getAttribute("m_id")!=null){
			Member mb = new Member();
			UploadFile upload = new UploadFile();
			map = upload.fileUppr(multi);
			String userPw = multi.getParameter("pw");
			String userName = multi.getParameter("userName");
			String userEmail = multi.getParameter("userEmail");
			mb.setM_id(m_id);
			mb.setM_pw(userPw);
			mb.setM_name(userName);
			mb.setM_email(userEmail);
			mDao.updateInfo(mb, map);
			view = "home";
		}else{
			view = "updateUserInfo";
		}
		mav.setViewName(view);
	}

	private void memberInsert(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		String view = null;
		String message = null;

		//BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

		String id = multi.getParameter("userId");
		System.out.println("id="+id);
		String pw = multi.getParameter("pw");
		System.out.println("pw="+pw);
		String name = multi.getParameter("userName");
		System.out.println("name="+name);
		String email = multi.getParameter("userEmail");
		System.out.println("email="+email);
		String kind = multi.getParameter("m_kind");
		System.out.println("m_kind="+kind);
		String userCode = multi.getParameter("userCode");
		System.out.println("userCode= "+userCode);

		int check = Integer.parseInt(multi.getParameter("fileCheck"));
		System.out.println("check="+check);

		Map<String, String> fMap = null;

		if(check==1){
			UploadFile upload = new UploadFile();//교수님이 나줘준다.
			//서버에 파일을 업로드 한뒤, 오리지널 파일명, 시스템파일명을 리턴후 맵에 저장
			fMap = upload.fileUppr(multi);
		}

		if(Integer.parseInt(userCode) == code){
			Member member = new Member();
			member.setM_id(id);
			member.setM_pw(pw);
			member.setM_name(name);
			member.setM_email(email);
			member.setM_kind(kind);
			member.setMf_file(fMap.get("sysFileName"));

			if(mDao.memberInsert(member,fMap)!=0){//true 성공하면
				view = "home";//성공하면 로그인 페이지
				mav.addObject("check",1);//회원가입 성공
			}else{//false 실패시
				view = "join";
			}
			mav.setViewName("home");
		}else{
			message = "인증 번호가 틀립니다";
			view = "join";
		}
		mav.setViewName("home");

	}

	private void logout(Member mb) {
		mav = new ModelAndView();
		String view = null;
		System.out.println(session.getAttribute("m_id"));
		if(session !=null){
			session.invalidate();
			System.out.println("session="+session);
			System.out.println("세션 제거 완료");
			System.out.println(session.getAttribute("m_id"));
		}	
		view = "redirect:/";
		mav.setViewName(view);
		
	}

	private ModelAndView memberAccess(Member mb) {
	      mav=new ModelAndView();
	      String view=null;

	      String m_id=request.getParameter("m_id");
	      String m_pass=request.getParameter("m_pw");

	      String passC=mDao.getPwd(m_id);

	      if(m_pass!=null){
	         
	         
	         if(m_pass.equals(passC)){
	            String black="B";
	            String status=mDao.getStatus(m_id);
	            System.out.println(status);
	            if(status==null){
	               String m_kind=mDao.getKind(m_id);
	               session.setAttribute("m_kind", m_kind);
	               session.getAttribute("m_kind");
	   
	               System.out.println("로그인성공");
	               session.setAttribute("m_id",m_id);
	               session.getAttribute("m_id");
	   
	               session.setAttribute("m_pw", m_pass);
	               session.getAttribute("m_pw");
	   
	               session.setAttribute("member", mb);
	               session.getAttribute("member");
	   
	               System.out.println(mDao.getKind(m_id));
	               //System.out.println("아이디:"+session.getAttribute("m_id"));
	               //System.out.println("패스워드:"+session.getAttribute("m_pw"));
	               //System.out.println("회원종류:"+session.getAttribute("m_kind"));
	               //System.out.println("세션:"+session.getId());
	               //System.out.println("상태:"+status);
	               view="redirect:/";
	               mav.setViewName(view);
	            }
	         
	            else{
	               mav.addObject("msg","로그인시도한 계정은 블랙리스트입니다.");
	               mav.setViewName("login");
	            }
	            
	         }
	         if(passC==null){
	            mav.addObject("msg","존재하지 않는 계정입니다.");
	            mav.setViewName("login");
	         }

	      } 
	      if(!m_pass.equals(passC)){
	    	  mav.addObject("msg","아이디 혹은 비밀번호가 일치하지않습니다.");
	    	  mav.setViewName("login");
	      }
	      return mav;
	   }
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	public String sendCode() throws Exception{

		int flag = Integer.valueOf(request.getParameter("flag"));
		System.out.println("flag: "+flag);
		String email = request.getParameter("userEmail");
		System.out.println("userEmail="+ email);
		String msgEmail;
		String msgSend = "";

		if(flag == 1)
		{
			// 중복 이메일 체크
			System.out.println("중복 이메일 체크 시작 email="+email);
			if(email.equals(mDao.isEmail(email))){
				System.out.println("사용중인 EMAIL");
				msgEmail = "중복된 이메일이 있습니다.";
			}else{
				System.out.println("사용 할 수 있는 EMAIL");
				msgEmail = "";
				msgSend = "이메일의 인증번호를 확인해주세요.";

				// 인증번호 생성

				Random random = new Random();
				code = random.nextInt(10000) + 1000;

				if(code > 10000)
					code = code - 1000;

				// 메일 보내기


				HttpSession session = request.getSession();
				session.setAttribute("code", code);

				//일반 텍스트메일
				SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
				simpleMailMessage.setFrom("emailtest20170314@gmail.com");
				simpleMailMessage.setTo(email);
				simpleMailMessage.setSubject("Steppe 이메일 인증 코드 입니다.");
				simpleMailMessage.setText("인증 코드는 "+code+"입니다.");

				javaMailSenderImpl.send(simpleMailMessage);
			}
		}
		else
		{
			if(!email.equals(mDao.isEmail(email))){
				msgEmail = "가입된 이메일 정보가 없습니다.";
			}else{
				msgEmail = "";
				msgSend = "이메일의 인증번호를 확인해주세요.";

				// 인증번호 생성

				Random random = new Random();
				int code = random.nextInt(10000) + 1000;

				if(code > 10000)
					code = code - 1000;

				// 메일 보내기


				HttpSession session = request.getSession();
				session.setAttribute("code", code);

				//일반 텍스트메일
				SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
				simpleMailMessage.setFrom("emailtest20170314@gmail.com");
				simpleMailMessage.setTo(email);
				simpleMailMessage.setSubject("Steppe 이메일 인증 코드 입니다.");
				simpleMailMessage.setText("인증 코드는 "+code+"입니다.");

				javaMailSenderImpl.send(simpleMailMessage);
			}
		}

		try 
		{
			response.getWriter().write(msgEmail + msgSend);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();

		}
		return null;

		/*//HTML 메일

			MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
			mimeMessage.setFrom(new InternetAddress("emailtest20170314@gmail.com"));
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress("jiwon.ha0513@gamil.com"));
			mimeMessage.setSubject("Mime 테스트 메일");
			mimeMessage.setText("<b>메일 내용입니다.</b>", "UTF-8", "html");

			javaMailSenderImpl.send(mimeMessage);
		 */
		//return null;

	}

	private void findId(String m_name,String m_email) {
		mav = new ModelAndView();

		String name = request.getParameter("m_name");
		String email = request.getParameter("m_email");

		System.out.println("name="+name);
		System.out.println("email="+email);

		Member member = new Member();
		member.setM_name(name);
		member.setM_email(email);

		// 메일 보내기
		String id = mDao.getId(member);

		//일반 텍스트메일
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("emailtest20170314@gmail.com");
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("Steppe 아이디 찾기 입니다.");
		simpleMailMessage.setText("귀하의 아이디는 "+id+"입니다.");

		javaMailSenderImpl.send(simpleMailMessage);

		mav.setViewName("findForm");
	}

	private void findPw(String m_id, String m_email) {
		mav = new ModelAndView();

		String id = request.getParameter("m_id");
		String email = request.getParameter("m_email");

		Member member = new Member();
		member.setM_id(id);
		member.setM_email(email);

		// 메일 보내기
		String password = mDao.getPwds(member);

		//일반 텍스트메일
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("emailtest20170314@gmail.com");
		simpleMailMessage.setTo(email);
		simpleMailMessage.setSubject("Steppe 비밀번호 찾기 입니다.");
		simpleMailMessage.setText("현재 비밀 번호는 "+password+"입니다.");
		
		javaMailSenderImpl.send(simpleMailMessage);

		mav.setViewName("findForm");

	}

	//이메일 인증 내정보 찾기에서
	public String sendCodes() throws Exception{

		int flag = Integer.valueOf(request.getParameter("flag"));
		System.out.println("flag: "+flag);
		String email = request.getParameter("userEmail");
		System.out.println("userEmail="+ email);

		if(flag == 1){
			// 인증번호 생성

			Random random = new Random();
			code = random.nextInt(10000) + 1000;

			if(code > 10000)
				code = code - 1000;

			// 메일 보내기
			HttpSession session = request.getSession();
			session.setAttribute("code", code);

			//일반 텍스트메일
			SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
			simpleMailMessage.setFrom("emailtest20170314@gmail.com");
			simpleMailMessage.setTo(email);
			simpleMailMessage.setSubject("Steppe 이메일 인증 코드 입니다.");
			simpleMailMessage.setText("인증 코드는 "+code+"입니다.");

			javaMailSenderImpl.send(simpleMailMessage);
		}
		return null;

	}
	
	private void deleteMemberMake() {//회원 탈퇴 싫행
		mav = new ModelAndView();
		String view=null;
		String m_id=request.getParameter("m_id");
		String m_pw=request.getParameter("password");
		
		if(mDao.CheckPw(m_id).equals(m_pw)){//비밀번호 체크
			int delete=mDao.deleteMemberMake(m_id);
			System.out.println(delete);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('그동안 감사했습니다.');");
				session.invalidate();
				out.println("window.location.href='/nomad'");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			String Check="비밀번호가 일치하지 않습니다.";
			mav.addObject("Check",Check);
			view="delete";
		}
		mav.setViewName(view);
	}
	private void deleteMember() {//회원 탈퇴 위한 조건검색
		mav = new ModelAndView();
		String view=null;
		// 회원탈퇴
		String p_mid=session.getAttribute("m_id").toString();

		int midCheckC=pDao.projectCheck(p_mid);//클라이언트가 제안한 프로젝트가 있는지 검사
		int midCheckF=vDao.volunteerCheck(p_mid);//프리랜서가 참여신청한 프로젝트가 있는지 검사
		
		if(session!=null && session.getAttribute("m_id")!= null && midCheckC==0 && midCheckF==0){
			String m_id=p_mid;
			mav.addObject("m_id",m_id);
			view="delete";
		}else{
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('지원 중에는 탈퇴가 불가능 합니다.');");
				out.println("history.back(-1)");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		mav.setViewName(view);
	}
}






