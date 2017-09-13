package com.steppe.nomad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Notice;
import com.steppe.nomad.service.AdminManagement;

@Controller
public class AdminController {

	private ModelAndView mav;

	@Autowired
	private AdminManagement am; //페이지 처음 진입용

	//공지사항 입력
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public ModelAndView noticeInsert(Notice nt) {
		mav = am.execute(nt, 1);
		return mav;
	}

	//공지사항 삭제
	@RequestMapping(value = "/noticeDelete")
	public ModelAndView noticeDelete(int nnum) {
		System.out.println("nnum=="+nnum);
		mav = am.execute(nnum, 1);
		return mav;
	}

	//공지사항 수정 페이지로 이동
	@RequestMapping(value = "/goNoticeUpdate")
	public ModelAndView goNoticeUpdate(int nnum) {
		mav = am.execute(nnum, 2);
		return mav;
	}

	//공지사항 수정
	@RequestMapping(value = "/noticeUpdate")
	public ModelAndView noticeUpdate(Notice notice) {
		mav = am.execute(notice, 2);
		return mav;
	}

	//공지사항 상세보기
	@RequestMapping(value = "/goNoticeDetail")
	public ModelAndView goNoticeDetail(int nnum) {
		System.out.println("nnum=="+nnum);
		mav = am.execute(nnum, 4);

		return mav;
	}

	//회원 관리 페이지로 이동
	@RequestMapping(value = "/goMemberMM")
	public ModelAndView goMemberMM() {
		mav = new ModelAndView();
		mav = am.execute(2);
		return mav;
	}

	//회원 삭제 
	@RequestMapping(value = "/memberDelete")
	public ModelAndView memberDelete(String mid) {
		mav = new ModelAndView();
		mav = am.execute(mid,3);
		return mav;
	}

	//블랙리스트 등록
	@RequestMapping(value = "/addBlackList")
	public ModelAndView addBlackList(String mid) {
		mav = new ModelAndView();
		mav = am.execute(mid,1);
		return mav;
	}

	//블랙리스트로 이동
	@RequestMapping(value = "/goBlack")
	public ModelAndView goBlack() {
		mav = new ModelAndView();
		mav = am.execute(3);
		return mav;
	}

	//블랙회원 일반회원으로 전환
	@RequestMapping(value = "/goBlackUpdate")
	public ModelAndView goBlackUpdate(String mid) {
		mav = new ModelAndView();
		mav = am.execute(mid,2);
		return mav;
	}

	//클라이언트 리스트 보기
	@RequestMapping(value = "/getClientList")
	public ModelAndView getClientList() {
		mav = new ModelAndView();
		mav = am.execute(4);
		return mav;
	}

	//프리랜서 리스트 보기
	@RequestMapping(value = "/getFreeLancerList")
	public ModelAndView getFreeLancerList() {
		mav = new ModelAndView();
		mav = am.execute(5);
		return mav;
	}

	//회원 아이디 검색
	@RequestMapping(value ="/searchMemberId")
	public ModelAndView searchKeyword(){
		mav=new ModelAndView();
		mav=am.searchMemberId();
		return mav;
	}

	//프로젝트 관리 페이지로 이동
	@RequestMapping(value ="/goProjectMM")
	public ModelAndView goProjectMM(){
		mav=new ModelAndView();
		mav = am.execute(6);
		return mav;
	}

	//프로젝트 삭제 
	@RequestMapping(value = "/projectDelete")
	public ModelAndView projectDelete(int pnum) {
		mav = new ModelAndView();
		mav = am.executes(pnum,1);
		return mav;
	}

	//프로젝트 개발 리스트 보기
	@RequestMapping(value ="/getDevelopList")
	public ModelAndView getDevelopList(){
		mav=new ModelAndView();
		mav = am.execute(7);
		return mav;
	}

	//프로젝트 디자인 리스트 보기
	@RequestMapping(value ="/getDesignList")
	public ModelAndView getDesignList(){
		mav=new ModelAndView();
		mav = am.execute(8);
		return mav;
	}

	//회원 아이디 검색
	@RequestMapping(value ="/searchProject")
	public ModelAndView searchProject(){
		mav=new ModelAndView();
		mav=am.searchProject();
		return mav;
	}

	//결제 관리 페이지로 이동
	@RequestMapping(value ="/goPurchaseMM")
	public ModelAndView goPurchaseMM(){
		mav=new ModelAndView();
		mav = am.execute(9);
		return mav;
	}

	//결제 상세 이동
	@RequestMapping(value ="/purchaseDetail")
	public ModelAndView purchaseDetail(int punum, int pupnum){
		mav=new ModelAndView();
		mav = am.executess(punum,pupnum, 1);
		return mav;
	}
	//결제 확인
	@RequestMapping(value ="/purchaseCheck")
	public ModelAndView purchaseCheck(int pnum, int pdpunum, double pumoney){
		mav=new ModelAndView();
		mav = am.executesss(pnum,pdpunum,pumoney, 1);
		return mav;
	}
	//결제 완료
	@RequestMapping(value ="/purchaseComplate")
	public ModelAndView purchaseComplate(int pnum){
		mav=new ModelAndView();
		mav = am.executesss(pnum, 2);
		return mav;
	}
	//결제 환불
	@RequestMapping(value ="/purchaseRefund")
	public ModelAndView purchaseRefund(int pnum){
		mav=new ModelAndView();
		mav = am.executesss(pnum, 3);
		return mav;
	}

}










