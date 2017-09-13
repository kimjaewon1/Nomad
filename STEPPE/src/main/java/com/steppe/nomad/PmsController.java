package com.steppe.nomad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Project;
import com.steppe.nomad.service.PmsManagement;

@Controller
public class PmsController {
	private ModelAndView mav;
	@Autowired
	private PmsManagement pmm;
	@RequestMapping(value = "/goPms")
	public ModelAndView goPms(Project project){
		mav=pmm.execute(1, project);
		return mav;
	}
	@RequestMapping(value = "/showProcessAll", method = RequestMethod.GET)
	public ModelAndView showProcessAll(Project project){
		System.out.println("showProcessAll() 메소드 실행");
		mav = pmm.execute(1, project);
		return mav;
	}
	@RequestMapping(value = "/progress", method = RequestMethod.GET)
	public ModelAndView progress(){
		System.out.println("progress() 메소드 실행");
		mav = pmm.execute(1);
		return mav;
	}
	@RequestMapping(value = "/progressUpdate", method = RequestMethod.GET)
	public ModelAndView progressUpdate(){
		mav = pmm.execute(2);
		return mav;
	}
	@RequestMapping(value = "/goProjectMemberMM")
	public ModelAndView goProjectMemberMM(){
		mav = pmm.execute(3);
		//mav.setViewName("team");
		return mav;
	}
	@RequestMapping(value = "/showMyProjectList")
	public ModelAndView showMyProjectList(){
		mav = pmm.execute(3);
		return mav;
	}
	@RequestMapping(value = "/showMyMemberList")
	public @ResponseBody String showMyMemberList(){
		String jsonStr = pmm.executeAjax(1);
		return jsonStr;
	}
	@RequestMapping(value = "/deleteTeamMember")
	public ModelAndView deleteTeamMember(){
		mav = pmm.execute(4);
		return mav;
	}
	@RequestMapping(value = "/goLiveChat")
	public ModelAndView goLiveChat(){
		mav = pmm.execute(5);
		return mav;
	}
	@RequestMapping(value = "/startChat")
	public ModelAndView startChat(){
		mav = pmm.execute(6);
		return mav;
	}
		
	@RequestMapping(value = "/sendChat")
	public @ResponseBody String sendChat(){
		String jsonStr = pmm.executeAjax(2);
		return jsonStr;
	}
	@RequestMapping(value = "/chatList", produces = "application/text; charset=utf8")
	public @ResponseBody String chatList(){
		String jsonStr = pmm.executeAjax(3);
		return jsonStr;
	}
}