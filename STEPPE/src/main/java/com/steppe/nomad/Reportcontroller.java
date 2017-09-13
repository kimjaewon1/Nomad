package com.steppe.nomad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Reply;
import com.steppe.nomad.bean.Report;
import com.steppe.nomad.service.ReportManagement;

@Controller
public class Reportcontroller {
	private ModelAndView mav;

	@Autowired
	private HttpSession session;

	@Autowired
	ReportManagement rm;

	@Autowired
	private HttpServletRequest request;


	//신고작성 페이지로 이동
	@RequestMapping(value ="/goReportWrite")
	public ModelAndView goReportWrite(){
		mav=rm.goReportWrite();
		return mav;
	}
	
	//신고 작성
	@RequestMapping(value="/InsertReport")
	public ModelAndView InsertReport(Report report){
		mav=rm.InsertReport(report);
		return mav;		
	}
	
	//신고글 리스트 페이지로 이동
	@RequestMapping(value="/goReportList")
	public ModelAndView goReportList(){
		mav=rm.showReportList();
		return mav;
	}
	//신고리스트 삭제
	@RequestMapping(value="/deleteReport")
	public ModelAndView deleteReport(){
		mav=rm.deleteReport();
		return mav;
		
	}
	//프로젝트 검색
	@RequestMapping(value="/searchProjectList")
	public ModelAndView searchProjectList(){
		mav=rm.searchProjectList();
		return mav;
	}
	//프로젝트 댓글 삽입
	@RequestMapping(value="/insertComment")
	public ModelAndView insertComment(Reply reply){
		mav=rm.insertComment(reply);
		return mav;
	}
	//프로젝트에 포함된 댓글 삭제
	@RequestMapping(value="/deleteReply")
	public ModelAndView deleteReply(){
		mav=rm.deleteReply();
		return mav;
	}
	
	//Intro(더미)
	@RequestMapping(value="/goIntro")
	public ModelAndView goIntro(){
		mav =new ModelAndView();
		mav.setViewName("intro");
		return mav;
	}
	
	//개발,디자인 버튼 리스트 다르게나오기
	@RequestMapping(value="/developList")
	public ModelAndView delelopList(){
		mav = new ModelAndView();
		mav = rm.execute(1);
		return mav;
	}
	
	@RequestMapping(value="/designList")
	public ModelAndView designList(){
		mav = new ModelAndView();
		mav = rm.execute(2);
		return mav;
	}
	
	@RequestMapping(value = "/bookmarkOnOff")
	public @ResponseBody String bookmarkOnOff(){
		String jsonStr = rm.bookmarkOnOff();
		return jsonStr;
	}

}
