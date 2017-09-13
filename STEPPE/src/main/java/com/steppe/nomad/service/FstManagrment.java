package com.steppe.nomad.service;

import java.util.List; 
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Answer;
import com.steppe.nomad.bean.Result;
import com.steppe.nomad.bean.Test;
import com.steppe.nomad.dao.TestDao;

@Component
public class FstManagrment implements Action{
	@Autowired
	private TestDao tDao;
	@Autowired
	private HttpSession ss;
	@Autowired
	private HttpServletRequest req;


	private ModelAndView mav;


	public ModelAndView userExecute(int cmd) {
		switch(cmd){
		case 1 :
			selectTest();
			break;
		case 2 :
			doTest();
			break;
		case 3 :
			checkTest();
			break;
		case 4 :
			fst();
			break;
		}
		return mav;
	}

	@Override
	public ModelAndView execute(int cmd) {
		switch(cmd){
		case 1 :
			showFstDetail();
			break;
		case 2 :
			insertFst();
			break;
		case 3 :
			goUpdateFst();
			break;
		case 4 :
			updateFst();
			break;
		case 5 :
			deleteFst();
			break;
		case 6 :
			showFstList();
			break;
		}
		return mav;
	}
	
	private void fst() {
		String view = null;
		mav = new ModelAndView();
		String a_mid = (String) ss.getAttribute("m_id");
		List<Result> rlist = null;
		Result res = new Result();
		StringBuilder sb = new StringBuilder();
		res.setRs_mid(a_mid);
		rlist = tDao.findName(res);
		if(ss!=null && ss.getAttribute("m_id")!=null){
		if(rlist!=null){
			for(int i=0; i<rlist.size();i++){
				Result rs = rlist.get(i);
				System.out.println(rs.getRs_tname());
				System.out.println(rs.getRs_pc());
				if(rs.getRs_pc()>50){
					sb.append("<tr><td>"+rs.getRs_tname()+"</td><td>"+rs.getRs_pc()+"%</td><td>합격입니다.</td></tr>");
				}
				}
			}
			mav.addObject("rslist", sb.toString());
			view="fst";
		}else{
			mav.addObject("msg", "로그인을 해주세요");
			view = "home";
		}
			mav.setViewName(view);
	}
	
	private void checkTest() {
		System.out.println("이응?");
		String view = null;
		mav = new ModelAndView();
		Answer ans = new Answer();
		List<Test> tlist = null;
		Test test = new Test();
		int a_insertnum = 0;
		StringBuilder sb = new StringBuilder();
		if(req.getParameter("answer")==null){
			a_insertnum = 5;
		}else{
			a_insertnum = Integer.parseInt(req.getParameter("answer"));
		}
		int a_tnum = Integer.parseInt(req.getParameter("a_tnum"));
		String a_tname = req.getParameter("a_tname");
		test.setT_name(a_tname);
		test.setT_num(a_tnum);
		int t_answer = tDao.getT_answer(test);
		String a_mid = (String) ss.getAttribute("m_id");
		System.out.println(a_insertnum);
		System.out.println(a_tnum);
		ans.setA_num(tDao.getAnswerMaxNum()+1);
		ans.setA_mid(a_mid);
		ans.setA_tnum(a_tnum);
		ans.setA_insertnum(a_insertnum);
		ans.setA_tname(a_tname);
		if(a_insertnum == t_answer){
			int a_check = 1;
			ans.setA_check(a_check);
		}else{
			int a_check = 0;
			ans.setA_check(a_check);
		}
		if(tDao.insertAnswer(ans)!=0){
			int tCnt = tDao.getTestCnt(ans);
			tlist = tDao.getTestList(a_tname);
			System.out.println("세션"+tCnt+"의 값 : "+ss.getAttribute("No"+tCnt+"a"));
			int No = (Integer) ss.getAttribute("No"+tCnt+"a");
			System.out.println("문제번호 : "+tCnt);
			if(tCnt<=9){
				ss.removeAttribute("No"+tCnt+"a");
				Test t = tlist.get(No);
				System.out.println("번호 : "+t.getT_num());
				sb.append("<table class='tableFst'><tr class = 'tr01'><td class='tdName'><input type = 'text' id = 'a_tname' name = 'a_tname' value="+t.getT_name()+" readonly='readonly'/></td><td colspan = '3' class='fstContent'><h3>"+t.getT_content()+"</h3></td></tr>");
				sb.append("<tr><td rowspan='4' class='td00'>문제"+(tCnt+1)+"</td><td class='td01'>1번 : </td><td class='td02'>"+t.getT_no1()+"</td><td class='td03'><input type='radio' name='answer' id='answer1' value='1'/></td></tr>");
				sb.append("<tr class = 'tr01'><td class='td01'>2번 : </td><td class='td02'>"+t.getT_no2()+"</td><td class='td03'><input type='radio' name='answer' id='answer2' value='2'/></td></tr>");
				sb.append("<tr><td class='td01'>3번 : </td><td class='td02'>"+t.getT_no3()+"</td><td class='td03'><input type='radio' name='answer' id='answer3' value='3'/></td></tr>");
				sb.append("<tr class = 'tr01'><td class='td01'>4번 : </td><td class='td02'>"+t.getT_no4()+"</td><td class='td03'><input type='radio' name='answer' id='answer4' value='4'/></td></tr>");
				sb.append("<tr><td colspan = '4' style='text-align:right;'><input id = 'a_tnum' 'type='hidden' name='a_tnum' value="+t.getT_num()+" readonly='readonly' /><input type = 'button' value = '입력' id='check'/></td></tr></table>");
				sb.append("<div id='ViewTimer'></div>");
			} 
			if(tCnt>=10) {
				System.out.println("결과");
				ss.removeAttribute("No"+tCnt+"a");
				System.out.println("세션"+tCnt+"의 값 : "+ss.getAttribute("No"+tCnt+"a"));
				int sum = tDao.getSum(ans);
				Result res = new Result();
				res.setRs_num(tDao.getResultMaxNum()+1);
				res.setRs_mid(a_mid);
				res.setRs_tname(a_tname);
				int rs_pc = (sum*10);
				res.setRs_pc(rs_pc);
				System.out.println(rs_pc);
				if(sum>5){
					int r_num = tDao.selectResult(res);
					System.out.println(r_num);
					if(r_num==0){
						tDao.insertResult(res);
					}
					if(r_num<rs_pc){
						tDao.updateResult(res);
					}
				}
				sb.append("<table class='tableFst'><tr><td class='lastTd'>시험이 끝났습니다. 정답 비율 "+rs_pc+"% 입니다.</td></tr>");
				sb.append("<tr><td colspan = '3' class='lastA'><button class='endButton'><a href='fst' class='AA'>시험종료</a></button></td></tr></table>");
			}
		}
			view = "fstTestContent";
			mav.addObject("tlist", sb.toString());
			mav.setViewName(view);
		}

		private void doTest() { //문제 풀기 시작
			String view = null;
			mav = new ModelAndView();
			System.out.println(req.getParameter("t_name"));
			String t_name = req.getParameter("t_name");
			String a_mid = (String) ss.getAttribute("m_id");
			Answer ans = new Answer();
			ans.setA_tname(t_name);
			ans.setA_mid(a_mid);
			System.out.println(t_name);
			System.out.println(a_mid);
			tDao.deleteAnswer(ans);
			int tCnt = tDao.getTestCnt(ans);
			List<Test> tlist = null;
			int a[] = new int[10];
			Random r = new Random();
			StringBuilder sb = new StringBuilder();
			if(ss!=null && ss.getAttribute("m_id")!=null){
				tlist = tDao.getTestList(t_name);
				if(ss.getAttribute("No"+tCnt+"a")==null){
					for(int i=0; i<10; i++){
						a[i] = r.nextInt(tlist.size());
						for(int j=0;j<i;j++){
							if(a[i] == a[j]){
								System.out.println("중복 제거");
								i--;
							}
						}
					}
					for(int k=0; k<10; k++){
						ss.setAttribute("No"+k+"a", a[k]);
						Test t = tlist.get(a[k]);
						System.out.println(t.getT_num());
					}
					ss.setAttribute("No"+10+"a", 10);
				}
			}else{
				mav.addObject("msg", "로그인을 해주세요");
				view = "home";
			}
			System.out.println(ss.getAttribute("No"+tCnt+"a"));
			int No = (Integer) ss.getAttribute("No"+tCnt+"a");
			Test t = tlist.get(No);
			System.out.println("번호 : "+t.getT_num());
			if(tCnt<10){
				sb.append("<table class='tableFst'><tr class = 'tr01'><td class='tdName'><input type = 'text' id = 'a_tname' name = 'a_tname' value="+t.getT_name()+" readonly='readonly'/></td><td colspan = '3' class='fstContent'><h3>"+t.getT_content()+"</h3></td></tr>");
				sb.append("<tr><td rowspan='4' class='td00'>문제"+(tCnt+1)+"</td><td class='td01'>1번 : </td><td class='td02'>"+t.getT_no1()+"</td><td class='td03'><input type='radio' name='answer' id='answer1' value='1'/></td></tr>");
				sb.append("<tr class = 'tr01'><td class='td01'>2번 : </td><td class='td02'>"+t.getT_no2()+"</td><td class='td03'><input type='radio' name='answer' id='answer2' value='2'/></td></tr>");
				sb.append("<tr><td class='td01'>3번 : </td><td class='td02'>"+t.getT_no3()+"</td><td class='td03'><input type='radio' name='answer' id='answer3' value='3'/></td></tr>");
				sb.append("<tr class = 'tr01'><td class='td01'>4번 : </td><td class='td02'>"+t.getT_no4()+"</td><td class='td03'><input type='radio' name='answer' id='answer4' value='4'/></td></tr>");
				sb.append("<tr><td colspan = '4' style='text-align:right;'><input id = 'a_tnum' 'type='hidden' name='a_tnum' value="+t.getT_num()+" readonly='readonly' /><input type = 'button' value = '입력' id='check'/></td></tr></table>");
				sb.append("<div id='ViewTimer'></div>");
				ss.removeAttribute("No"+tCnt+"a");
				view = "fstTestContent";
			}
			mav.addObject("tlist", sb.toString());
			mav.setViewName(view);
		}

		private void selectTest() { //문제 풀기 공지
			System.out.println(req.getParameter("t_name"));
			String view = null;
			mav = new ModelAndView();
			if(ss!=null && ss.getAttribute("m_id")!=null){
			String t_name = req.getParameter("t_name");
			mav.addObject("test",t_name);
				view = "fstTest";
			}else{
				mav.addObject("msg", "로그인을 해주세요");
				view = "home";
			}
			mav.setViewName(view);
		}

		private void deleteFst() { //관리자 시험 문제 삭제
			String view = null;
			mav = new ModelAndView();
			System.out.println("계정명:"+ss.getAttribute("m_id"));
			int t_num = Integer.parseInt(req.getParameter("t_num"));
			if(ss!=null && ss.getAttribute("m_id").equals("admin")){
				System.out.println(t_num);
				if(tDao.deleteAnsNum(t_num)!=0){
					if(tDao.deleteFst(t_num)!=0){
						mav.addObject("msg", "문제 삭제 성공");
					}else{
						mav.addObject("msg", "문제 삭제 실패");
					}
				}else{
					if(tDao.deleteFst(t_num)!=0){
						mav.addObject("msg", "문제 삭제 성공");
					}else{
						mav.addObject("msg", "문제 삭제 실패");
					}
				}
				view = "fstMm";
			}else{
				System.out.println("관리자가 아닙니다.");
				mav.addObject("msg", "관리자가 아닙니다.");
				view = "home";
			}
			mav.setViewName(view);
		}

		private void updateFst() { //관리자 시험 문제 수정
			String view = null;
			mav = new ModelAndView();
			Test test = new Test();
			if(ss!=null && ss.getAttribute("m_id").equals("admin")){
				int t_answer = Integer.parseInt(req.getParameter("t_answer"));
				int t_num = Integer.parseInt(req.getParameter("t_num"));
				test.setT_num(t_num);
				test.setT_name(req.getParameter("t_name"));
				test.setT_content(req.getParameter("t_content"));
				test.setT_answer(t_answer);
				test.setT_no1(req.getParameter("t_no1"));
				test.setT_no2(req.getParameter("t_no2"));
				test.setT_no3(req.getParameter("t_no3"));
				test.setT_no4(req.getParameter("t_no4"));
				if(tDao.updateFst(test)!=0){
					System.out.println("문제수정성공");
					mav.addObject("msg", "문제수정성공");
				}else{
					System.out.println("문제수정실패");
					mav.addObject("msg", "문제수정실패");
				}
				view = "fstMm";
			}else{
				mav.addObject("msg", "관리자가 아닙니다.");
				System.out.println("관리자가 아닙니다.");
				view = "home";
			}
			mav.setViewName(view);
		}

		private void goUpdateFst() { //관리자 시험 문제 페이지이동
			String view = null;
			mav= new ModelAndView();
			int t_num = Integer.parseInt(req.getParameter("t_num"));
			mav.addObject("test",tDao.showFstDetail(t_num));
			view = "fstUpdate";
			mav.setViewName(view);
		}

		private void insertFst() { //관리자 시험 문제 추가
			String view = null;
			mav = new ModelAndView();
			Test test = new Test();
			if(ss!=null && ss.getAttribute("m_id").equals("admin")){
				int t_answer = Integer.parseInt(req.getParameter("t_answer"));
				test.setT_num(tDao.getTestMaxNum()+1);
				test.setT_name(req.getParameter("t_name"));
				test.setT_content(req.getParameter("t_content"));
				test.setT_answer(t_answer);
				test.setT_no1(req.getParameter("t_no1"));
				test.setT_no2(req.getParameter("t_no2"));
				test.setT_no3(req.getParameter("t_no3"));
				test.setT_no4(req.getParameter("t_no4"));
				System.out.println(test);
				if(tDao.insertFst(test)!=0){
					System.out.println("문제추가성공");
					mav.addObject("msg", "문제추가성공");
				}else{
					System.out.println("문제추가실패");
					mav.addObject("msg", "문제추가실패");
				}
				view = "fstMm";
			}else{
				mav.addObject("msg", "관리자가 아닙니다.");
				System.out.println("관리자가 아닙니다.");
				view = "home";
				
			}
			mav.setViewName(view);
		}

		private void showFstDetail() { //관리자 시험 문제 상세보기
			String view = null;
			mav= new ModelAndView();
			int t_num = Integer.parseInt(req.getParameter("t_num"));
			mav.addObject("test",tDao.showFstDetail(t_num));
			view = "fstDetail";
			mav.setViewName(view);
		}

		private void showFstList() { //관리자 시험 문제 리스트 보기
			mav=new ModelAndView();
			String view = null;
			List<Test> tlist = null;
			String t_name = req.getParameter("FstList");
			System.out.println(t_name);
			tlist = tDao.getTestList(t_name);
			System.out.println(tlist);
			if(ss!=null && ss.getAttribute("m_id").equals("admin")){
			if(tlist!=null){
				StringBuilder sb = new StringBuilder();
				for(int i=0; i<tlist.size(); i++){
					Test t=tlist.get(i);
					sb.append("<tr><td class = 't1'>"+t.getT_num()+"</td>");
					sb.append("<td class = 't2'><a class='a2' href='showFstDetail?t_num="+t.getT_num()+"'>"+t.getT_content()+"</a></td>");
					sb.append("<td class = 't3'>"+t.getT_answer()+"</td>");
					sb.append("<td class = 't4'><a  class='a4' href='goUpdateFst?t_num="+t.getT_num()+"'>수정</a></td></tr>");
				}
				mav.addObject("tlist", sb.toString());
				mav.addObject("tname", t_name);
			}
				view="fstMm";
			}else{
				mav.addObject("msg", "관리자가 아닙니다.");
				view="home";
			}
			mav.setViewName(view);
		}

		@Override
		public ModelAndView execute(Test test, int cmd) {
			// TODO Auto-generated method stub
			return null;
		}

	}
