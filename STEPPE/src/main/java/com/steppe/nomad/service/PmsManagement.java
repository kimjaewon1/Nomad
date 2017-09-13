package com.steppe.nomad.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.steppe.nomad.bean.Chat;
import com.steppe.nomad.bean.Member;
import com.steppe.nomad.bean.Pms;
import com.steppe.nomad.bean.Project;
import com.steppe.nomad.bean.Volunteer;
import com.steppe.nomad.dao.ChatDao;
import com.steppe.nomad.dao.MemberDao;
import com.steppe.nomad.dao.ProjectDao;
import com.steppe.nomad.dao.VolunteerDao;

@Service
public class PmsManagement {
	private ModelAndView mav;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectDao pDao;
	@Autowired
	private VolunteerDao vDao;
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private MemberDao mDao;
	
	private String jsonStr;
	private Map<String, Integer> map = new HashMap<String, Integer>();
	
	public ModelAndView execute(int code, Project project) {
		if(code == 1){
			showProcess(project);
		}else if(code == 2){
		}
		return mav;
	}
	
	public ModelAndView execute(int code){
		if(code==1){
			progress();
		}else if(code==2){
			progressUpdate();
		}else if(code==3){
			showMyProjectList();
		}else if(code==4){
			deleteTeamMember();
		}else if(code==5){
			goLiveChat();
		}else if(code==6){
			startChat();
		}
		return mav;
	}

	private void startChat() {
		mav = new ModelAndView();
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String chatRoom = chatRoomMake(pnum); 
		mav.addObject("chatRoomHtml", chatRoom);
		mav.setViewName("chatRoom");
	}
	private String chatRoomMake(int pnum) {
		StringBuilder sb = new StringBuilder();
		sb.append("<div id='chat' class='panel-collapse collapse in'>");
		sb.append("<div id='chatList' class='portlet-body chat-widget' style='overflow-y:auto; overflow-x:hidden; width:auto; height:400px;'>");
		sb.append("</div></div>");
		sb.append("<div class='portlet-footer'>");
		sb.append("<div class='row' style='height: 90px;'>");
		sb.append("<div class='form-group col-xs-10'>");
		sb.append("<textarea style='height:80px;' id='chatContent' class='form-control' placeholder='메시지를 입력하세요' maxlength='100'></textarea>");
		sb.append("</div>");
		sb.append("<div class='form-group col-xs-2'>");
		sb.append("<button type='button' class='btn btn-default pull-right' onclick='submitFunction("+pnum+")' style='width: 150px; height:80px;'>전송</button>");
		sb.append("<input type='hidden' id='pnum' value='"+pnum+"'>");
		sb.append("</div>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}

	//채팅방리스트
	private void goLiveChat() {
		System.out.println("chatRoom실행");
		mav = new ModelAndView();
		String m_id = session.getAttribute("m_id").toString();
		if(session.getAttribute("m_id")!=null && session != null){
			List<Volunteer> chatRoomList = vDao.chatRoomList(m_id);
			String chatRoomListMake = chatRoomListMake(chatRoomList); 
			mav.addObject("makeList", chatRoomListMake);
		}
		mav.setViewName("chat");
	}

	private String chatRoomListMake(List<Volunteer> chatRoomList) {
		StringBuilder sb = new StringBuilder();
		Volunteer volunteer = null;
		for(int i=0; i<chatRoomList.size(); i++){
			volunteer = chatRoomList.get(i);
			sb.append("<div class='panel panel-default' style='width:250px; float: left; margin: 5px'>");
			sb.append("<h4 class='panel-heading' style='text-align:center;'>"+volunteer.getP_title()+"</h4><br/>");
			sb.append("<div style='text-align:center;'><input type='button' class='btn btn-default' onclick='chatStart(\""+volunteer.getV_pnum()+"\")' value='채팅하기' /></div>");
			sb.append("</div>");
		}
		return sb.toString();
	}

	private void deleteTeamMember() {
		mav = new ModelAndView();
		String mid = request.getParameter("mid");
		pDao.deleteTeamMember(mid);
		mav.setViewName("redirect:showMyProjectList");
	}
	public String executeAjax(int code){
		if(code==1){
			showMyMemberList();
		}else if(code==2){
			sendChat();
		}else if(code==3){
			chatList();
		}
		return jsonStr;
	}

	private void sendChat() {
		String chatContent = request.getParameter("chatContent");
		System.out.println("chatContent:"+chatContent);
		String pnum = request.getParameter("pnum");
		System.out.println("pnum:"+pnum);
		String mid = session.getAttribute("m_id").toString();
		Gson jsonObj = new Gson();
		Map<String, String> map = new HashMap<String, String>();
		List<Chat> chatList = null;
		int chatNum = 0;
		if(mid == null || mid.equals("") || chatContent == null || chatContent.equals("")
				|| pnum == null || pnum.equals("")){
			jsonStr = "0";
		}else{
			if(chatDao.chatCount()!=0){
				chatNum = chatDao.chatMaxNum()+1;				
			}else{
				chatNum = 1;
			}
			System.out.println("chatNum:"+chatNum);
			try {
				map.put("pnum", pnum);
				map.put("chatContent", URLDecoder.decode(chatContent,"UTF-8"));
				map.put("mid", mid);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("chatNum", String.valueOf(chatNum));
			jsonStr=String.valueOf(chatDao.chatSubmit(map));
			//chatList = chatDao.chatPrint(map);
					//chatPrint(chatList);
			
		}
		//jsonStr = jsonObj.toJson();
	}

	private void chatList(){
		String pnum = request.getParameter("pnum");
		String mid = session.getAttribute("m_id").toString();
		String listType = request.getParameter("listType");
		System.out.println("listType="+listType);
		Map<String, String> map = new HashMap<String, String>();
		try {
			map.put("mid", URLDecoder.decode(mid,"UTF-8"));
			map.put("pnum", URLDecoder.decode(pnum,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("pnum:"+pnum);
		//Gson jsonObj = new Gson();
		if(mid == null || mid.equals("") || pnum == null || pnum.equals("") 
				|| listType == null || listType.equals("")){
			System.out.println("무한루프");
			jsonStr = "";
		}else if(listType.equals("ten")){
			System.out.println("실행2");
			try {
				map.put("listType", URLDecoder.decode(String.valueOf(10),"UTF-8"));
				List<Chat> tenList = chatDao.getTenList(map);
				jsonStr = chatTenList(tenList);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			map.put("listType", listType);
			List<Chat> chatList = chatDao.getChatList(map);
			jsonStr = chatList(chatList);
		}
		
	}
	private String chatTenList(List<Chat> chatList){
		StringBuilder sb = new StringBuilder();
		sb.append("{\"result\":[");
		if(chatList.size() == 0){return "";}
		for(int i=0; i<chatList.size(); i++){
			sb.append("[{\"value\": \""+chatList.get(i).getC_mid()+"\"},");
			sb.append("{\"value\": \""+chatList.get(i).getC_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")+"\"},");
			sb.append("{\"value\": \""+chatList.get(i).getC_date()+"\"}]");
			if(i != chatList.size()-1){
				sb.append(",");
			}
			
		}
		sb.append("], \"last\":\""+chatList.get(chatList.size()-1).getC_id()+"\"}");
		return sb.toString();
	}
	
	private String chatList(List<Chat> chatList){
		StringBuilder sb = new StringBuilder();
		sb.append("{\"result\":[");
		if(chatList.size() == 0){return "";}
		for(int i=0; i<chatList.size(); i++){
			sb.append("[{\"value\": \""+chatList.get(i).getC_mid().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")+"\"},");
			sb.append("{\"value\": \""+chatList.get(i).getC_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")+"\"},");
			System.out.println("채팅내용="+chatList.get(i).getC_content());
			System.out.println("날짜:"+chatList.get(i).getC_date());
			sb.append("{\"value\": \""+chatList.get(i).getC_date()+"\"}]");
			if(i != chatList.size()-1){
				sb.append(",");
			}
			
		}
		sb.append("], \"last\":\""+chatList.get(chatList.size()-1).getC_id()+"\"}");
		return sb.toString();
	}
	private void showMyMemberList() {
		Map<Object, Object> mapList = new HashMap<Object, Object>();
		String title = request.getParameter("title");
		String pNum = request.getParameter("pNum");
		System.out.println("pNum="+pNum);
		mapList.put("title", title);
		mapList.put("pNum", pNum);
		List<Member> memberList = pDao.showMyMemberList(mapList);
	
		Gson jsonObj = new Gson();
		jsonStr = jsonObj.toJson(memberList);
	
	}

	private void showMyProjectList() {
		//session.getAttribute("id");
		String view = null;
		mav = new ModelAndView();
		//session.getAttribute("");
		if(session!=null && session.getAttribute("m_id")!=null){
			List<Project> list = pDao.showMyProjectList(session.getAttribute("m_id").toString());
			String makeList = makeMyProjectList(list);
			mav.addObject("makeList", makeList);
			view = "team";
		}else{
			view = "redirect:/main";
		}
		mav.setViewName(view);
	}

	private String makeMyProjectList(List<Project> list) {
		StringBuilder sb = new StringBuilder();
		Project project = null;
		sb.append("<select id='sBox' onchange='Ajax(this)'> ");
		sb.append("<option>선택해 주세요.</option>");
		for(int i=0; i<list.size(); i++){
			project = list.get(i);
			sb.append("<option value='"+project.getP_num()+"'>"+project.getP_title()+"</option>");
		}
		sb.append("</select>");
		return sb.toString();
	}

	private void progressUpdate(){
		System.out.println("progressUpdate() 실행");
		mav = new ModelAndView();
		int progNum = Integer.valueOf(request.getParameter("code"));
		int btnNum = Integer.valueOf(request.getParameter("num"));
		System.out.println("progNum:"+progNum);
		System.out.println("btnNum:"+btnNum);
		String view = null;
		//pDao.progressSelect();
		//수정할 때 프로젝트 번호를 넣어야 한다.
		map.put("progNum", progNum);
		map.put("btnNum", btnNum);
		pDao.progressUpdate(map);
		
		mav.setViewName("showProcessAll");
	}
	
	private void progress() {
	      String m_id = session.getAttribute("m_id").toString();
	      Member member = mDao.getMemberInfo(m_id);
	      System.out.println("실행");
	      mav = new ModelAndView();
	      String view = null;
	      List<Project> list = null;
	      List<Pms> list2 = null;
	      int value = Integer.valueOf(request.getParameter("prog"));   
	      int code = 0;
	      int progNum;
	      if(member.getM_kind().equals("F")){
	         if(value==0){
	            progNum = 30;
	            code = 0;         
	         }else if(value==1){
	            progNum = 30; 
	            code = 1;
	         }else if(value==2){
	            progNum = 60;
	            code = 2;
	         }else if(value==3){
	            progNum = 100;
	            code = 3;
	         }else{
	            code = 4;
	         }
	         list2 = pDao.freeShowProcess(code,m_id);
	         String makeShowList = makeProjectListFree(list2, value);
	         mav.addObject("makeShowList", makeShowList);
	      }else{
	         if(value==0){
	            progNum = 30;
	            code = 0;         
	         }else if(value==1){
	            progNum = 30; 
	            code = 1;
	         }else if(value==2){
	            progNum = 60;
	            code = 2;
	         }else if(value==3){
	            progNum = 100;
	            code = 3;
	         }else{
	            code = 4;
	         }
	         list = pDao.showProcess(code,m_id);
	         String makeShowList = makeProjectList(list, value);
	         mav.addObject("makeShowList", makeShowList);
	      }
	      mav.setViewName("progress");
	   }

	private void showProcess(Project project) {
	      String view = null;
	      mav = new ModelAndView();
	      String m_id = session.getAttribute("m_id").toString();
	      Member member = mDao.getMemberInfo(m_id);
	      //List<Volunteer> volun = vDao.freeSelectVounteer(m_id);
	      //String id = (String) session.getAttribute("m_id");
	      if(session!=null && session.getAttribute("m_id")!=null){
	         System.out.println("showProcess() 실행");
	         List<Project> list = null;
	         List<Pms> list2 = null;
	         int progNum = 0;
	         String makeList = null;
	         String makeList2 = null;
	         if(member.getM_kind().equals("F")){
	            System.out.println("f실행?");
	            list2 = pDao.freeShowProcess(progNum,m_id);
	            makeList2 = makeProjectListFree(list2, progNum);
	            mav.addObject("makeList", makeList2);
	         }else{
	            System.out.println("c실행?");
	            list = pDao.showProcess(progNum,m_id);
	            makeList = makeProjectList(list, progNum);
	            mav.addObject("makeList", makeList);
	         }
	         
	         view = "pms";
	      }else{
	         view = "redirect:/main";
	      }
	      mav.setViewName(view);
	   }
	   public String makeProjectListFree(List<Pms> list, int value){
	      StringBuilder sb = new StringBuilder();
	      Pms pms = null;
	      int num = 0;
	      int progNum = 0;

	      int number = 0;
	      for(int i=0; i<list.size(); i++){
	         pms = list.get(i);
	         sb.append(pms.getP_title()+"<br/>");
	         progNum = pms.getP_status();
	      
	         sb.append("<div class='row'>"
	               + "<div class='col-lg-12'>");
	         sb.append("<progress value="+progNum+" max='4' style='height: 30px; width:400px;'></progress>&nbsp;&nbsp;&nbsp;");
	         sb.append("<div class='box'>");
	         sb.append("<select name='prog' id='prog"+number+"'>");
	         sb.append("<option value='0'>전체</option>");
	         sb.append("<option value='1'>대기</option>");
	         sb.append("<option value='2'>작업전</option>");
	         sb.append("<option value='3'>작업중</option>");
	         sb.append("<option value='4'>작업 완료</option>");
	         sb.append("</select>&nbsp;");
	         sb.append("</div>");
	         sb.append("<input type='button' class='btn btn-default' onclick=\"javascript:Ajax2('progressUpdate?num="+pms.getP_num()+"&code=', '#printP', 'prog"+number+"')\" id='progressSend' value='전송' />");
	         sb.append("</div>"
	               + "</div>");
	         number++;
	      }
	      number = 0;
	      return sb.toString();
	   }
	
	public String makeProjectList(List<Project> list, int value){
	      StringBuilder sb = new StringBuilder();
	      Project project = null;
	      String mid = session.getAttribute("m_id").toString();
	      Member member = mDao.getMemberInfo(mid);
	      int num = 0;
	      int progNum = 0;
	      int number = 0;
	      for(int i=0; i<list.size(); i++){
	         project = list.get(i);
	         sb.append(project.getP_title()+"<br/>");
	         progNum = project.getP_status();
	      
	         sb.append("<div class='row'>"
	               + "<div class='col-lg-12'>");
	         sb.append("<progress value="+progNum+" max='4' style='height: 30px; width:400px;'></progress>&nbsp;&nbsp;&nbsp;");
	         if(member.getM_kind().equals("F")){
	         sb.append("<div class='box'>");
	         sb.append("<select name='prog' id='prog"+number+"'>");
	         sb.append("<option value='0'>전체</option>");
	         sb.append("<option value='1'>대기</option>");
	         sb.append("<option value='2'>작업전</option>");
	         sb.append("<option value='3'>작업중</option>");
	         sb.append("<option value='4'>작업 완료</option>");
	         sb.append("</select>&nbsp;");
	         sb.append("</div>");
	            sb.append("<input type='button' class='btn btn-default' onclick=\"javascript:Ajax2('progressUpdate?num="+project.getP_num()+"&code=', '#printP', 'prog"+number+"')\" id='progressSend' value='전송' />");
	         }
	         sb.append("</div>"
	               + "</div>");
	         number++;
	      }
	      number = 0;
	      return sb.toString();
	   }
}