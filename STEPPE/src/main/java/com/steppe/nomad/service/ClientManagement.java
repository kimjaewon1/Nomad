package com.steppe.nomad.service;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Accounting;
import com.steppe.nomad.bean.Evaluate;
import com.steppe.nomad.bean.Project;
import com.steppe.nomad.bean.Purchase_detail;
import com.steppe.nomad.bean.Required_Skill;
import com.steppe.nomad.bean.Volunteer;
import com.steppe.nomad.dao.AccountingDao;
import com.steppe.nomad.dao.CatagoryDao;
import com.steppe.nomad.dao.ClientDao;
import com.steppe.nomad.dao.ProjectDao;
import com.steppe.nomad.dao.Project_bookmarkDao;
import com.steppe.nomad.dao.VolunteerDao;
import com.steppe.nomad.userClass.UploadFile;

@Component

public class ClientManagement {

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest req;

	@Autowired
	private HttpServletResponse res;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired	
	private CatagoryDao cDao;

	@Autowired	
	private ProjectDao pDao;

	@Autowired	
	private VolunteerDao vDao;

	@Autowired	
	private Project_bookmarkDao pbDao;
	
	@Autowired	
	private AccountingDao aDao;

	private ModelAndView mav;
	private String jsonStr;
	
	@Autowired
	private ClientDao clDao;
	


	public ModelAndView execute(int cmd) {
		switch(cmd){
		case 1:
			goAddProject();
			break;
		case 2:
			setRequired_Skill();
			break;
		case 3:
			goMyPageCI();
			break;
		case 4:
			showApplyList();
			break;
		case 5:
			pickMember();
			break;
		case 6:
			deleteProject();
			break;
		case 7:
			purchase();
			break;
		case 8:
			goClientPurchase();
			break;
		case 9:
			payRequest();
			break;
		case 10:
			payMent();
			break;
		}
		return mav;
	}
	private void payMent() {//결제하기
		mav=new ModelAndView();
		String view=null;
		int p_num=Integer.parseInt(req.getParameter("p_num"));
		if(session!=null && session.getAttribute("m_id")!=null){
			List<Volunteer> vList=null;
			System.out.println(p_num);
			vList=vDao.showApplyList(p_num);
			System.out.println(vList);
			for(int i=0; i<vList.size(); i++){
				Volunteer vl=vList.get(i);
				int v_pnum=vl.getV_pnum();
				int rownum=vl.getRownum();
				int v_num=vl.getV_num();
				String v_mid=vl.getV_mid();
				int v_bid=vl.getV_bid();
				System.out.println(rownum);
				System.out.println(v_num);
				System.out.println(v_mid);
				System.out.println(v_bid);
				Volunteer vL=new Volunteer(rownum,v_num,v_mid,v_bid);
				List<Volunteer> vList2=null;
				vList2=vDao.showApplyList2(vL);
				System.out.println(vList2);
				
				if(vList2!=null){
					StringBuilder sb = new StringBuilder();
					for(int a=0; a<vList2.size(); a++){
						System.out.println("ddddd");
						Volunteer v=vList2.get(a);
						//sb.append("<tr><td><input type='hidden' value='"+vl.getV_pnum()+"' name='v_pnum'/>"+v.getV_pnum()+"</td>");
						sb.append("<tr><td>"+v.getV_num()+"</td>");
						sb.append("<td>"+v.getV_mid()+"</td>");
						sb.append("<td>"+v.getV_bid()+"</td>");
						sb.append("<td><input type='checkbox' value='"+v.getV_mid()+"' name='v_mid' id='vmid'" 
								+ " onClick='CountChecked(this)'/></td></tr>");
					}
					mav.addObject("vList", sb.toString());
				}
				view="applyList";
			}
		}else{
				view="home";
			}
			mav.setViewName(view);
	}
			/*
			if(vList!=null){
				StringBuilder sb = new StringBuilder();
				for(int i=0; i<vList.size(); i++){
					System.out.println("ddddd");
					Volunteer vl=vList.get(i);
					//sb.append("<td><input type='hidden' value='"+vl.getV_pnum()+"' name='v_pnum'/>"+vl.getV_pnum()+"</td>");
					sb.append("<tr><td>"+vl.getV_num()+"</td>");
					sb.append("<td>"+vl.getV_mid()+"</td>");
					sb.append("<td>"+vl.getV_bid()+"</td>");
					sb.append("<td><input type='checkbox' value='"+vl.getV_mid()+"' name='v_mid' id='vmid'" 
							+ " onClick='CountChecked(this)'/></td></tr>");
				}
				mav.addObject("vList", sb.toString());
			}
			view="applyList";
		}else{
			view="home";
		}
		mav.setViewName(view);

	}*/
	private void showApplyList() {//지원자 리스트롤 보기 위한 ajax
		mav=new ModelAndView();
		String view=null;
		int v_pnum=Integer.parseInt(req.getParameter("p_num"));

		List<Volunteer> vList=null;

		vList=vDao.getVolunteerList(v_pnum);
		System.out.println(vList);
		if(!vList.equals(" ")){
			StringBuilder sb = new StringBuilder();
			sb.append("<table class='table table-responsive' align='center'>");
			sb.append("<tr><th>지원자번호</th><th>지원자아이디</th><th>입찰가격</th><th>입찰시간</th></tr>");
			for(int i=0; i<vList.size(); i++){
				System.out.println("ddddd");
				Volunteer v=vList.get(i);
				sb.append("<tr><td>"+v.getV_num()+"</td>");
				sb.append("<td><a href='goFreelancerDetail?m_id="+v.getV_mid()+"'>"+v.getV_mid()+"</td>");//누르면 프리랜서 상세페이지로 이동
				//sb.append("<td><input type='hidden' value='"+vl.getV_pnum()+"' name='v_pnum'/>"+v.getV_bid()+"</td>");
				sb.append("<td>"+v.getV_bid()+"만 원"+"</td>");
				sb.append("<td>"+v.getV_time()+"</td></tr>");
				//sb.append("<tr><td><input type='hidden' value='"+vl.getV_pnum()+"' name='v_pnum'/>"+vl.getV_pnum()+"</td>");
			}
			sb.append("<tr><td colspan='4'><a href='./goMyPageCI'><button class='btn'>닫기</button></a></tr></td>");
			sb.append("</table>");

			System.out.println(sb);
			mav.addObject("vList", sb.toString());
		}else{
			view="errorAjax";
		}
		view="volunteerWatch";//라이트 박스에서 지원자 리스트 보여주기 위한 jsp
		mav.setViewName(view);

	}

	private void payRequest() {//관리자에게 최종 결제 신청
		mav=new ModelAndView();
		String view=null;
		System.out.println("결제신청하러 옴");

		int p_num=Integer.valueOf(req.getParameter("p_num"));

		if(pDao.CheckStatus(p_num)==4){
			System.out.println("결제신청할 수 있어");
			int statusUp=pDao.StatusUpdate(p_num);
			System.out.println(statusUp);
			if(statusUp!=0){
				view="redirect:goMyPageCI";

			}

		}else{//프로젝트 상태가 작업완료가 아니면 돌아가야 함
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;

			try {
				out = res.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('결제 신청할 수 없습니다.');");
				out.println("history.back(-1)");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		mav.setViewName(view);
	}
	private void goClientPurchase() {//클라이언트 결제 내역 페이지로 이동
		mav=new ModelAndView();
		String view=null;
		System.out.println("결제");
		int pu_pnum=Integer.valueOf(req.getParameter("p_num"));

		String pd_mid=session.getAttribute("m_id").toString();
		
		if(aDao.CheckPurchase(pu_pnum)!=0){//해당 프로젝트에 대한 결제가 있는지 체크
			System.out.println("결제내역 보러 가자");	
			int pd_punum=aDao.getPu_num(pu_pnum);//결제번호 받아오기
			Purchase_detail pd= new Purchase_detail();
			pd.setPd_mid(pd_mid);
			pd.setPd_punum(pd_punum);
			List<Purchase_detail> pdList=null;
			pdList=aDao.selectPurchase_detail(pd);//결제 내역 가져오기
			//pdList=aDao.selectPurchase_detail(pu_num);//결제 내역 가져오기

			if(pdList!=null){//결제내역을 불러 오면
				StringBuilder sb = new StringBuilder();

				for(int i=0; i<pdList.size(); i++){
					System.out.println("ddddd");
					Purchase_detail pd1=pdList.get(i);
					sb.append("<tr><td>"+pd1.getPd_punum()+"</td>");
					sb.append("<td>"+pd1.getPd_num()+"</td>");
					sb.append("<td>"+pd1.getPd_catagory2()+"</td>");
					sb.append("<td>"+pd1.getPd_money()+"</td></tr>");
				}
				
				System.out.println(sb);
				mav.addObject("pdList", sb.toString());
			}
			view="clientPurchase";
			mav.setViewName(view);
		}else{//결제룰 하지 않았으면
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;
			try {
				out = res.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('결제를 하셔야만 합니다');");
				out.println("history.back(-1)");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void purchase() {
		mav=new ModelAndView();
		String view=null;
		int pu_num=aDao.getPurchaseMaxNum()+1;
		double pu_money=Double.parseDouble(req.getParameter("sum"));
		String pu_mid=session.getAttribute("m_id").toString();
		int pu_pnum=Integer.valueOf(req.getParameter("v_pnum"));
		int p_num=Integer.valueOf(req.getParameter("v_pnum"));
		
		Accounting accounting = new Accounting(pu_num,pu_money,pu_mid,pu_pnum);
			if(aDao.insertPurchase(accounting)!=0){
				
				int pd_num=aDao.getPurchase_detailMaxNum()+1;
				int pd_punum=pu_num;
				String pd_mid=session.getAttribute("m_id").toString();
				double pd_money=Double.parseDouble(req.getParameter("sum"));
				String pd_catagory="P";
				
				System.out.println(pd_num);
				System.out.println(pd_punum);
				System.out.println(pd_mid);
				System.out.println(pd_money);
				System.out.println(pd_catagory);
				
				//int uState=pDao.StatusUpdateIng(p_num);//프로젝트 상태 업데이트 
				//System.out.println(uState);
                Accounting accounting2 = new Accounting(pd_num,pd_punum,pd_mid,pd_money,pd_catagory);
				if(aDao.insertPurchase_detail(accounting2)!=0){
					int v_pnum1=vDao.UpdateVolunteer(pu_pnum);//지원자 업데이트
					System.out.println(v_pnum1);
					int v_pnum2=pDao.UpdateProject(pu_pnum);//프로젝트 업데이트
					System.out.println(v_pnum2);
					view="redirect:goMyPageCI";
				}else{
					view="home";
				}
				mav.setViewName(view);
			}else
				view="home";
	}
	private void deleteProject() {
		mav=new ModelAndView();
		String view=null;
		System.out.println("삭제하러 왔어");
		int p_num=Integer.parseInt(req.getParameter("p_num"));
		System.out.println("확인합니다:"+p_num);
		int check=pDao.checkedProject(p_num);
		System.out.println(check);
		if(check!=1){
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;
			try {
				out = res.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('대기중일때만 삭제가 가능합니다.');");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}else{
			int pDelete=pDao.deleteProject(p_num);
			System.out.println("확인합니다2:"+p_num);
			view="redirect:goMyPageCI";
			mav.setViewName(view);
		}
	}

	private void pickMember() {//결제하기로
		mav=new ModelAndView();
		String view=null;
		System.out.println("왔어");
		int v_pnum=Integer.valueOf(req.getParameter("v_pnum"));
		
		System.out.println(v_pnum);
		int p_person=pDao.getPerson(v_pnum);//프로젝트 인원 받아 오기
		System.out.println(p_person);
		int v_mid=vDao.getPerson(v_pnum);//지원자 수 받아오기
		System.out.println(v_mid);

		if(aDao.Countpunum(v_pnum)!=0 || p_person > v_mid){//이미 결제가 되었는지 확인//그리고 프로젝트 인원에 맞게 지원했는지 확인
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out;
			try {
				out = res.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('결제할 수 없습니다.');");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{//결제 가능
			System.out.println("결제하자");
			int Maxbid=0;
			int person=0;
			System.out.println(v_pnum);
			Maxbid=aDao.getPrice(v_pnum);//최대 금액 가져오기
			person=pDao.getPerson(v_pnum);//프로젝트 인원 가져오기
			int sumbid=Maxbid * person;//입찰 가격의 합
			
			double com=Maxbid*0.05;//수수료
			
			double sum=sumbid+com;//입찰가의 합+수수료
			
			
			mav.addObject("sumbid",sumbid);
			mav.addObject("com",com);
			mav.addObject("sum",sum);
			mav.addObject("v_pnum",v_pnum);
			
		}

		view="purchase";
		mav.setViewName(view);
		
	}

	private void goMyPageCI() {
		String view=null;
		mav=new ModelAndView();
		String m_kind=session.getAttribute("m_kind").toString();
		System.out.println(m_kind);
		if(session!=null && session.getAttribute("m_id")!= "" && m_kind.equals("C")){
			List<Project> plist=null;
			//if(session!=null && session.getAttribute("m_id")!=null ){
			//plist=pDao.getProjectList(session.getAttribute("m_id"));//합치면 이것으로
			String m_id=session.getAttribute("m_id").toString();
			plist=pDao.getProjectList2(m_id);
			System.out.println(plist);
			if(plist!=null){
				StringBuilder sb = new StringBuilder();

				sb.append("<form id='showList' name='showList'>");
				sb.append("<table class='table table-responsive' align='center'>");
				sb.append("<tr><th>번호</th><th>제목</th><th>지원자 수</th><th>상태</th></tr>");
				for(int i=0; i<plist.size(); i++){
					Project p=plist.get(i);
					System.out.println("ddddd");
					sb.append("<tr><td>"+p.getP_num()+"</td>");
					sb.append("<td><a href='#contents_layer' onclick='articleView("+p.getP_num()+")'>"+p.getP_title()+"</a></td>");
					sb.append("<td>"+p.getP_vol()+"</td>");
					sb.append("<td>"+p.getP_status2()+"</td></tr>");
					if(p.getP_status2().equals("대기중")){//대기중일때만 삭제버튼 보여줌
						sb.append("<tr><td colspan=4><a href='deleteProject?p_num="+p.getP_num()+"' class='btn'>"+"삭제"+"</a></td></tr>");
					}
					if(p.getP_vol()>=p.getP_person() && p.getP_status2().equals("대기중") ){
						sb.append("<tr><td colspan=4><a href='payMent?p_num="+p.getP_num()+"' class='btn'>"+"결제"+"</a></td></tr>");
					}
					if(p.getP_status2().equals("작업전") || p.getP_status2().equals("작업중") || p.getP_status2().equals("작업완료")
							|| p.getP_status2().equals("결제완료")){//대기중이 아닐 때 만 삭제 버튼 보여 줌
						sb.append("<tr><td colspan=4><a href='goClientPurchase?p_num="+p.getP_num()+"' class='btn'>"+"결제내역"+"</a></td></tr>");
					}
					if(p.getP_status2().equals("작업완료")){
						sb.append("<tr><td colspan=4><a href='payRequest?p_num="+p.getP_num()+"' class='btn'>"+"결제신청"+"</a></td></tr>");
					}
					if(p.getP_status2().equals("결제완료")){
						sb.append("<tr><td colspan=4><a href='goProjectEvalute?p_num="+p.getP_num()+"' class='btn'>"+"평가"+"</a></td></tr>");
					}

				}
				sb.append("</table>");
				sb.append("</div>");
				sb.append("</form>");
				mav.addObject("plist", sb.toString());
			}
			view="myPageCI";
		}else{
			view="home";
		}
		mav.setViewName(view);
	}


	private void setRequired_Skill() {
		String view=null;
		mav=new ModelAndView();
		List<Required_Skill> slist=null;
		slist=pDao.getRequired_SkillList();
		System.out.println(slist);

		if(slist!=null){
			StringBuilder sb = new StringBuilder();
				sb.append("<input type='hidden' value='' name='p_plnum[]' onClick='CountChecked(this)' id='inter'/>");
			for(int i=0; i<slist.size(); i++){
				Required_Skill rs=slist.get(i);
				System.out.println(rs.getRs_plnum());
				sb.append("<input type='checkbox' value='"+rs.getRs_plnum()+"' name='p_plnum[]' id='inter' onClick='CountChecked(this)' />"+rs.getRs_plnum());
				sb.append("/");
			}
			mav.addObject("slist", sb.toString());
		}
		view="projectInsert";
		mav.setViewName(view);
	}


	private void goAddProject() {
		String view=null;
		mav=new ModelAndView();
		view="redirect:/firstCatagory";
		mav.setViewName(view);

	}

	public ModelAndView execute(MultipartHttpServletRequest multi, int cmd) {
		switch(cmd){
		case 1:
			insertProject(multi);
			break;

		}
		return mav;
	}

	private void insertProject(MultipartHttpServletRequest multi) {
	      String mid = session.getAttribute("m_id").toString();
	      String pc1_name=multi.getParameter("pc1_name");
	      String pc2_name=multi.getParameter("pc2_name");
	      //String p_mid="client";
	      //String p_mid=session.getAttribute("m_id").toString();
	      int p_budget=Integer.parseInt(multi.getParameter("p_budget"));
	      String p_term=multi.getParameter("p_term");
	      String p_title=multi.getParameter("p_title");
	      String p_content=multi.getParameter("p_content");
	      int check=Integer.parseInt(multi.getParameter("fileCheck"));//확인
	      String p_deadline=multi.getParameter("p_deadline");
	      String p_plnum0=multi.getParameter("p_plnum0");
	      String p_plnum1=multi.getParameter("p_plnum1");
	      String p_plnum2=multi.getParameter("p_plnum2");
	      int p_person=Integer.parseInt(multi.getParameter("p_person"));
	      System.out.println("check="+check);//1이면 첨부됨
	      Map<String, Object> fMap=new HashMap<String, Object>();
	      Map<String, String> bmMap = new HashMap<String, String>();
	      int bookmarkNum = 0;
	      if(pbDao.bookmarkCount()!=0){
	         bookmarkNum = pbDao.bookmarkMaxNum()+1;
	      }else{
	         bookmarkNum = 1;
	      }
	      if(check==1){
	         UploadFile upload=new UploadFile();
	         //서버에 파일을 업로드 한 뒤, 

	         //오리지널 파일명, 시스템 파일명을 리턴 후 Map에 저장

	         fMap=upload.fileUp(multi);

	         System.out.println(fMap);
	      }
	      Project project=new Project();
	      if(pDao.getProjectCount() != 0){
	         project.setP_num(pDao.getProjectMaxNum()+1);         
	      }else{
	         project.setP_num(1);
	      }
	      project.setP_pc1name(pc1_name);
	      project.setP_pc2name(pc2_name);
	      project.setP_mid(session.getAttribute("m_id").toString());
	      project.setP_budget(p_budget);
	      project.setP_term(p_term);
	      project.setP_title(p_title);
	      project.setP_content(p_content);
	      project.setP_deadline(p_deadline);
	      project.setP_plnum0(p_plnum0);
	      project.setP_plnum1(p_plnum1);
	      project.setP_plnum2(p_plnum2);
	      project.setP_person(p_person);
	      project.setP_status(1);

	      fMap.put("p_num", project.getP_num());
	      fMap.put("pc1_name", project.getP_pc1name());
	      fMap.put("pc2_name", project.getP_pc2name());
	      fMap.put("p_mid",project.getP_mid());
	      fMap.put("p_budget",project.getP_budget());
	      fMap.put("p_term", project.getP_term());
	      fMap.put("p_title", project.getP_title());
	      fMap.put("p_content", project.getP_content());
	      fMap.put("p_deadline", project.getP_deadline());
	      fMap.put("p_plnum0", project.getP_plnum0());
	      fMap.put("p_plnum1", project.getP_plnum1());
	      fMap.put("p_plnum2", project.getP_plnum2());
	      fMap.put("p_person", project.getP_person());
	      fMap.put("p_status", project.getP_status());
	      
	      bmMap.put("pb_num", String.valueOf(bookmarkNum));
	      bmMap.put("pb_pnum", String.valueOf(project.getP_num()));
	      bmMap.put("pb_mid", mid);
	      
	      mav=new ModelAndView();
	      String view=null;

	      System.out.println(fMap);
	      
	      if(pDao.insertProject(fMap)!=0){
	         System.out.println("북마크 db실행1");
	         pbDao.bookmarkInsert(bmMap);
	         System.out.println("북마크 db실행2");
	         view="redirect:goMyPageCI";
	      }else{
	         view="redirect:goAddProject";
	      }
	      mav.setViewName(view);
	   }

	private void purchase(Accounting ac) {
		mav=new ModelAndView();
		String view=null;

	}

	public ModelAndView execute(String mid, int cmd) {
		switch(cmd){
		case 1:
			goInsertEstimate(mid);
			break;
		default:
			break;
		}
		return mav;
	}

	private void goInsertEstimate(String mid) {
		mav = new ModelAndView();

		String reciver_mid = req.getParameter("mid");

		mav.addObject("mid",reciver_mid);
		mav.setViewName("estimate");
	}

	public ModelAndView execute(String mid, String e_title, String e_content, int cmd) {
		switch(cmd){
		case 1:
			sendEstimate(mid,e_title,e_content);
			break;
		default:
			break;
		}
		return mav;
	}

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	private void sendEstimate(String mid, String e_title, String e_content) {
		mav = new ModelAndView();

		String sender = (String) session.getAttribute("m_id");
		System.out.println("sender="+sender);
		String reciver = req.getParameter("mid");
		System.out.println("reciver="+reciver);
		String title = req.getParameter("e_title");
		String content = req.getParameter("e_content");

		String sendEmail = clDao.getSenderEmail(sender);
		String reciveEmail = clDao.getReciverEmail(reciver);

		//일반 텍스트메일
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom(sendEmail);
		simpleMailMessage.setTo(reciveEmail);
		simpleMailMessage.setSubject("Steppe: "+sender+"의 견적요청 입니다.");
		simpleMailMessage.setText("제목: "+title+"\n\n"+"보낸이: "+sendEmail+"\n\n"+content);

		javaMailSenderImpl.send(simpleMailMessage);
		
		mav.setViewName("redirect:/");
	}

	public ModelAndView execute(int pnum, int cmd) {
		switch(cmd){
		case 1:
			goProjectEvalute(pnum);
			break;
		case 2:
			insertProjectEvaluate(pnum);
			break;
		default:
			break;
		}
		return mav;
	}


	private void goProjectEvalute(int p_num) {
		mav = new ModelAndView();

		int pnum = Integer.parseInt(req.getParameter("p_num"));

		mav.addObject("pnum", p_num);
		System.out.println("pnum="+pnum);
		mav.setViewName("projectEvaluate");

	}

	private void insertProjectEvaluate(int pnum) {
		mav = new ModelAndView();

		String mid = (String) session.getAttribute("m_id");
		System.out.println("mid="+mid);
		pnum = Integer.parseInt(req.getParameter("pnum"));
		System.out.println("pnum="+pnum);
		int escore = Integer.parseInt(req.getParameter("e_score"));
		System.out.println("e_score="+escore);
		String econtent = req.getParameter("e_content");
		System.out.println("e_content="+econtent);

		Evaluate eva = new Evaluate();
		if(clDao.getEVCount() != 0){
		eva.setE_num(clDao.getEVMaxNum()+1);
		}else{
			eva.setE_num(1);
		}
		eva.setE_mid(mid);
		eva.setE_pnum(pnum);
		eva.setE_score(escore);
		eva.setE_content(econtent);

		clDao.insertProjectEvaluate(eva);
		mav.setViewName("home");

	}



}
