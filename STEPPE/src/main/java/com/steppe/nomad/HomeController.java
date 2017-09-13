package com.steppe.nomad;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Member;
import com.steppe.nomad.service.AdminManagement;
import com.steppe.nomad.service.ClientManagement;
import com.steppe.nomad.service.FreelancerManagement;
import com.steppe.nomad.service.MemberManagement;
import com.steppe.nomad.service.ReportManagement;
@Controller
@SessionAttributes("member")
public class HomeController {

	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;

	@Autowired
	private AdminManagement am;
	
	@Autowired
	private MemberManagement mm;	//페이지 처음 진입용
	
	@Autowired
	private ClientManagement cm;	
	
	@Autowired
	 private ReportManagement rm;

	@Autowired
	 private FreelancerManagement fm;

	@RequestMapping(value = "/")
	public ModelAndView home(Model model) {
		mav = new ModelAndView();
		mav=rm.showHomeList();
		return mav;
	}
	//상단 헤더메뉴의 메인페이지 링크용
	@RequestMapping(value = "/main")
	public ModelAndView home2(Model model) {
		mav = new ModelAndView();
		mav=rm.showHomeList();
		return mav;
	}

	//회원가입용
	@RequestMapping(value = "/goJoin")
	public ModelAndView goJoin() {
		mav = new ModelAndView();
		mav.setViewName("join"); //join.jsp �쉶�썝媛��엯 �럹�씠吏�
		return mav;
	}
	//프로젝트 페이지로 이동
    @RequestMapping(value="/goProject", method = RequestMethod.GET)
    public ModelAndView goProject(){
       //프로젝트 리스트 추출후 표기를 위한 서비스로 이동
       mav=rm.showProjectList();
       return mav;
    }
   @RequestMapping(value="/goProjectDetail", method = RequestMethod.GET)
   public ModelAndView goProjectDetail(){
      mav=rm.showProjcetDetail();
      return mav;
   }
   /*
	@RequestMapping(value="/goProjectDetail", method = RequestMethod.GET)
	public ModelAndView goProjectDetail(){
		mav = new ModelAndView();
		mav.setViewName("projectDetail"); //projectDetail.jsp �봽濡쒖젥�듃 �긽�꽭蹂닿린 �럹�씠吏�
		return mav;
	}

	@RequestMapping(value="/goAddProject")
	public ModelAndView goAddProject(){
		mav = new ModelAndView();

		mav.setViewName("projectInsert"); //projectDetail.jsp �봽濡쒖젥�듃 �긽�꽭蹂닿린 �럹�씠吏�
		return mav;
	}

	//이메일 인증
	}*/

	//이메일 인증
	@RequestMapping(value = "/sendCode")
	public ModelAndView sendCode() {
		System.out.println("ModelAndView sendCode �떆�옉");
		mav = new ModelAndView(); 
		try {
			mm.sendCode();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//공지사항 페이지 이동
	@RequestMapping(value = "/goNotice", method = RequestMethod.GET)
	public ModelAndView goNotice() {
		System.out.println("공지사항 페이지로 이동");
		mav = new ModelAndView();
		//mav.setViewName("notice"); //notice.jsp 로그인 페이지
		mav = am.execute(1);
		return mav;
	}
	
	//공지사항쓰기 페이지 이동
	@RequestMapping(value = "/noticeWrite")
	public ModelAndView noticeWrite() {
		System.out.println("공지사항 페이지로 이동");
		if(session!=null && session.getAttribute("m_id")!=null&&session.getAttribute("m_id").equals("admin")){
		mav = new ModelAndView();
		mav.setViewName("noticeWrite"); //noticeWrite.jsp 로그인 페이지
		}
		return mav;
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
	public ModelAndView goLogin() {
		System.out.println("로그인 페이지로 이동");
		mav = new ModelAndView();
		mav.setViewName("login"); //login.jsp 로그인 페이지
		return mav;
	}

	//로그인
	@RequestMapping(value = "/access", method = RequestMethod.POST)
	public ModelAndView access(Member mb) {
		System.out.println("mb="+mb.getM_id());
		mav = mm.execute(mb,1);
		return mav;
	}

	//로그아웃
	@RequestMapping(value = "/logout")
	public ModelAndView logout(Member mb) {
		System.out.println("로그아웃");
		mav = mm.execute(mb,2);
		return mav;
	}

	//회원가입
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(MultipartHttpServletRequest multi) {
		mav = mm.execute(multi,1);
		return mav;
	}

	@RequestMapping(value = "/fstMm", method = RequestMethod.GET)
	public String fstMm(Model model) {
		return "fstMm";
	}
	
	//이용방법 페이지로 이동
	@RequestMapping(value= "/goManual")
	public ModelAndView goManual(){
		System.out.println("이용방법 페이지로 이동");
		mav = new ModelAndView();
		mav.setViewName("manual");
		return mav;
	}
	
	@RequestMapping(value= "/goMyPage")
	public ModelAndView goMyPageCI(){
		mav = new ModelAndView();
		mav=mm.execute(3); //projectDetail.jsp 프로젝트 상세보기 페이지
		return mav;
	}
 
   //이메일 인증 내정보 찾기에서
   @RequestMapping(value = "/sendCodes")
   public ModelAndView sendCodes() throws Exception {
      System.out.println("ModelAndView sendCodes");
      mav = new ModelAndView(); 
      mm.sendCodes();
      return mav;
   }

   //내정보 찾기 페이지로 이동
   @RequestMapping(value = "/goFindInfo")
   public ModelAndView goFindInfo() {
      System.out.println("로그아웃");
      mav.setViewName("findForm");
      return mav;
   }
   //아이디 찾기
   @RequestMapping(value = "/findId", method = RequestMethod.POST)
   public ModelAndView findId(String m_name, String m_email) {
      System.out.println("아이디 찾기");
      mav = mm.execute(m_name,m_email,1);
      return mav;
   }

   //비밀번호 찾기
   @RequestMapping(value = "/findPw", method = RequestMethod.POST)
   public ModelAndView findPw(String m_id, String m_email) {
      System.out.println("비밀번호 찾기");
      mav = mm.executes(m_id,m_email,1);
      return mav;
   }

/*
   @RequestMapping(value= "/goMyPageCI")
   public ModelAndView goMyPageCI(){
      System.out.println("마이 페이지로 이동");
      mav = new ModelAndView();
      mav.setViewName("myPageCI");
      return mav;
   }
*/
   //프리랜서 페이지로 이동
   @RequestMapping(value="/goFreelancer")
   public ModelAndView goFreelancer(){
      System.out.println("프리랜서 페이지로 이동");
      mav = new ModelAndView();
      mav=fm.showList();
      return mav;
   }
   //프리랜서 상세보기 페이지로 이동
   @RequestMapping(value="/goFreelancerDetail")
   public ModelAndView goFreelancerDetail(){
      System.out.println("프리랜서상세 페이지로 이동");
      mav = new ModelAndView();
      mav=fm.showDetail();
      return mav;
   }

   //좋아요
   @RequestMapping(value="/likeInsert")
   public ModelAndView likeInsert(){
	   System.out.println("좋냐?");
	   mav = new ModelAndView();
	   mav=fm.execute(1);
	   return mav;
   }
}
