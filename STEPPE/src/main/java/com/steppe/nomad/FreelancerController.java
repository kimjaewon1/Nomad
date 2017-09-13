package com.steppe.nomad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Career;
import com.steppe.nomad.bean.Portfolio;
import com.steppe.nomad.bean.Profile;
import com.steppe.nomad.bean.Project;
import com.steppe.nomad.bean.Skill;
import com.steppe.nomad.bean.Volunteer;
import com.steppe.nomad.service.FreelancerManagement;

@Controller
public class FreelancerController {
	
	@Autowired
	private FreelancerManagement fm;
	private ModelAndView mav;
	
	@RequestMapping(value = "/goMyCareer")
	public ModelAndView goMyCareer() {
		mav = new ModelAndView();
		mav.setViewName("careerInfo");
		return mav;
	}
	
	@RequestMapping(value = "/goMyProfile")
	public ModelAndView goMyProfile() {
		mav = new ModelAndView();
		mav = fm.executeProfile(1);
	      return mav;
	}
	
	@RequestMapping(value = "/goMySkill")
	public ModelAndView goMySKill() {
		mav = new ModelAndView();
		mav.setViewName("skillInfo");
		return mav;
	}
	
	@RequestMapping(value = "/goMyPortfolio")
	public ModelAndView portfolio() {
		mav=new ModelAndView();
		mav.setViewName("portfolio");
		return mav;
	}
	
	@RequestMapping(value = "/addCareerInfo")
	public @ResponseBody String addCareerInfo(Career career) {
		String jsonStr=fm.executeAjax(career, 1);
		return jsonStr;
	}
	
	@RequestMapping(value = "/showMyCareer")
	public @ResponseBody String showMyCareer(Career career) {
		String jsonStr=fm.executeAjax(career, 2);
		return jsonStr;
	}
	
	@RequestMapping(value = "/deleteCareerInfo")
	public @ResponseBody String deleteCareerInfo(Career career) {
		String jsonStr=fm.executeAjax(career, 3);
		return jsonStr;
	}
	
	@RequestMapping(value = "/insertProfile")
	public @ResponseBody String insertProfile(Profile profile) {
		String jsonStr=fm.executeAjax(profile, 1);
		return jsonStr;
	}
	
	@RequestMapping(value = "/showMyProfile")
	public @ResponseBody String showMyProfile(Profile profile) {
		String jsonStr=fm.executeAjax(profile, 2);
		return jsonStr;
	}
	
	@RequestMapping(value = "/deleteProfile")
	public @ResponseBody String deleteProfile(Profile profile) {
		String jsonStr=fm.executeAjax(profile, 3);
		return jsonStr;
	}
	
	@RequestMapping(value = "/addSkill")
	public @ResponseBody String addSkill(Skill skill) {
		String jsonStr=fm.executeAjax(skill, 1);
		return jsonStr;
	}
	
	@RequestMapping(value = "/showMySkill")
	public @ResponseBody String showMySkill(Skill skill) {
		String jsonStr=fm.executeAjax(skill, 2);
		return jsonStr;
	}
	
	@RequestMapping(value = "/deleteSkill")
	public @ResponseBody String deleteSkill(Skill skill) {
		String jsonStr=fm.executeAjax(skill, 3);
		return jsonStr;
	}
	
	@RequestMapping(value = "/addPortfolio")
	   public ModelAndView portFolioInsert(MultipartHttpServletRequest multi, @RequestParam("pf_image[]") MultipartFile[] files){
	      System.out.println("실행2");
	      mav = fm.execute(1, multi, files);
	      return mav;
	   }
	
	@RequestMapping(value = "/showPortfolioList")
	public @ResponseBody String showPortfolioList(Portfolio portfolio) {
		String jsonStr=fm.executeAjax(portfolio, 1);
		return jsonStr;
	}
	
	@RequestMapping(value = "/showPortfolioDetail")
	public ModelAndView showPortfolioDetail(Portfolio portfolio) {
		System.out.println("쇼포폴디");
		mav = fm.execute(portfolio, 1);
		return mav;
	}
	
	@RequestMapping(value = "/goPortfolioUpdate")
	public ModelAndView goPortfolioUpdate(Portfolio portfolio) {
		mav = fm.execute(portfolio, 2);
		return mav;
	}
	
	@RequestMapping(value = "/updatePortfolio")
	public ModelAndView updatePortfolio(Portfolio portfolio){
		mav = fm.execute(portfolio, 3);
		return mav;
	}
	
	@RequestMapping(value = "/deletePortfolio")
	public ModelAndView deletePortfolio(Portfolio portfolio){
		mav = fm.execute(portfolio, 4);
		return mav;
	}
	
	@RequestMapping(value = "/insertVolunteer")
	public ModelAndView insertVolunteer(Volunteer volunteer){
		System.out.println("지원자 인서투");
		mav = fm.execute(volunteer, 1);
		return mav;
	}
	
	@RequestMapping(value = "/goMyPageFr")
	public ModelAndView goMyPageFr(Project project) {
		System.out.println("go");
		mav = fm.execute(project, 1);
		return mav;
	}
	
	@RequestMapping(value = "/getCashflow")//현금흐름 보기
	public ModelAndView getCashflow() {
		System.out.println("getCashflow");
		mav = fm.getCashflow();
		return mav;
	}
	
	@RequestMapping(value = "/getCashflowfinish")//최종 현금흐름 보기
	public ModelAndView getCashflowfinish() {
		System.out.println("getCashflowfinish");
		mav = fm.getCashflowfinish();
		return mav;
	}
	
	//프리랜서 검색
	@RequestMapping(value ="/searchKeywordFr")
	public ModelAndView searchFreelancer(){
		mav=new ModelAndView();
		mav=fm.searchFreelancer();
		return mav;
	}
	
	//지원 취소
		@RequestMapping(value ="/goVolunteerdelete")
		public ModelAndView goVolunteerdelete(){
			mav=new ModelAndView();
			mav=fm.deleteVolunteer();
			return mav;
		}
	@RequestMapping(value = "/portView", method = RequestMethod.GET)
	public ModelAndView portView() {
		//DB에서 게시판 리스트를 가져옴
		System.out.println("portView");
		mav=new ModelAndView();
		mav=fm.LightBox(1);
		return mav;
	}

}
