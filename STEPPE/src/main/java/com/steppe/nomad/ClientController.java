package com.steppe.nomad;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Accounting;
import com.steppe.nomad.bean.Evaluate;
import com.steppe.nomad.bean.Project;
import com.steppe.nomad.service.ClientManagement;
import com.steppe.nomad.service.PmsManagement;


@Controller
public class ClientController {

	private ModelAndView mav;
	@Autowired
	private ClientManagement cm;

	@Autowired
	private PmsManagement pmm;

	@RequestMapping(value="/goAddProject", method = RequestMethod.GET)
	public ModelAndView goAddProject(){
		mav = new ModelAndView();
		mav=cm.execute(1); //projectDetail.jsp 프로젝트 상세보기 페이지
		return mav;
	}

	@RequestMapping(value="/firstCatagory", method = RequestMethod.GET)
	public ModelAndView firstCatagory(){
		mav = new ModelAndView();
		mav=cm.execute(2); //projectDetail.jsp 프로젝트 상세보기 페이지
		return mav;
	}

	@RequestMapping(value="/goMyPageCI")//클라이언트의 마이페이지로 가기
	public ModelAndView goMyPageCI(){
		mav = new ModelAndView();
		mav=cm.execute(3); 
		return mav;
	}


	@RequestMapping(value="/insertProject", method = RequestMethod.POST)//프로젝트 등록
	public ModelAndView insertProject(MultipartHttpServletRequest multi){
		System.out.println("insertProject");
		mav = new ModelAndView();
		mav=cm.execute(multi,1);
		return mav;
	}

	@RequestMapping(value="/showProcessAll")
	public ModelAndView goPms(Project project){
		System.out.println("showProcessAll() 메서드 실행");
		mav = new ModelAndView();
		mav=pmm.execute(1, project); 
		return mav;
	}

	@RequestMapping(value="/showApplyList")
	public ModelAndView showApplyList(){
		System.out.println("showApplyList 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(4);
		return mav;
	}

	@RequestMapping(value="/pickMember")
	public ModelAndView pickMember(){
		System.out.println("pickMember 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(5);
		return mav;
	}

	@RequestMapping(value="/deleteProject")
	public ModelAndView deleteProject(){
		System.out.println("deleteProject 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(6);
		return mav;
	}

	@RequestMapping(value="/purchase")
	public ModelAndView purchase(){
		System.out.println("Purchase 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(7);
		return mav;
	}

	@RequestMapping(value="/goClientPurchase")
	public ModelAndView goClientPurchase(){
		System.out.println("goClientPurchase 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(8);
		return mav;
	}

	@RequestMapping(value="/payRequest")
	public ModelAndView payRequest(){
		System.out.println("payRequest 메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(9);
		return mav;
	}
	
	@RequestMapping(value="/payMent")//결제하기
	public ModelAndView payMent(){
		System.out.println("payMent메서드 실행");
		mav = new ModelAndView();
		mav=cm.execute(10);
		return mav;
	}
	

	//견적문의 페이지로 이동
	@RequestMapping(value="/goInsertEstimate")
	public ModelAndView goInsertEstimate(String mid){
		System.out.println("견적 문의 페이지로 이동");
		mav=new ModelAndView(mid);
		mav=cm.execute(mid,1);
		/*mav.setViewName("estimate");*/
		return mav;
	}

	//견적 문의 요청
	@RequestMapping(value="/sendEstimate")
	public ModelAndView sendEstimate(String mid,String e_title, String e_content){
		System.out.println("견적 문의 보내기");
		mav=new ModelAndView();
		mav=cm.execute(mid, e_title, e_content,1);
		return mav;
	}

	//평가서입력 페이지로 이동
	@RequestMapping(value="/goProjectEvalute")
	public ModelAndView goProjectEvalute(int p_num){
		System.out.println("평가서입력 페이지로 이동");
		mav=new ModelAndView();
		mav=cm.execute(p_num, 1);
		return mav;
	}

	//평가서입력
	@RequestMapping(value="/insertProjectEvaluate")
	public ModelAndView insertProjectEvaluate(int pnum){
		System.out.println("평가서입력 보내기");
		mav=new ModelAndView();
		mav=cm.execute(pnum,2);
		return mav;
	}
	
}
