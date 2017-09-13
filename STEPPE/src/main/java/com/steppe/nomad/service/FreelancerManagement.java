package com.steppe.nomad.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.GenericTableMetaDataProvider;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.steppe.nomad.bean.Career;
import com.steppe.nomad.bean.Client_mypage;
import com.steppe.nomad.bean.Member;
import com.steppe.nomad.bean.Portfolio;
import com.steppe.nomad.bean.Profile;
import com.steppe.nomad.bean.Project;
import com.steppe.nomad.bean.Purchase_detail;
import com.steppe.nomad.bean.Skill;
import com.steppe.nomad.bean.Volunteer;
import com.steppe.nomad.dao.AccountingDao;
import com.steppe.nomad.bean.VeryLike;
import com.steppe.nomad.dao.FreelancerDao;
import com.steppe.nomad.dao.ProjectDao;
import com.steppe.nomad.dao.VolunteerDao;
import com.steppe.nomad.userClass.UploadFile;

@Service
public class FreelancerManagement {
	@Autowired
	private FreelancerDao fDao;
	@Autowired
	private VolunteerDao vDao;
	@Autowired
	private ProjectDao pDao;
	@Autowired
	private HttpSession ss; // request.getSession();
	@Autowired
	private HttpServletRequest req; // request.getSession();
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AccountingDao aDao;

	private ModelAndView mav;
	private String jsonStr;

	public String executeAjax(Career career, int cmd) {
		switch (cmd) {
		case 1:
			insertCareer(career);
			break;
		case 2:
			showCareer(career);
			break;
		case 3:
			deleteCareer(career);
			break;
		}
		return jsonStr;
	}

	public String executeAjax(Profile profile, int cmd) {
		switch (cmd) {
		case 1:
			insertProfile(profile);
			break;
		case 2:
			showProfile(profile);
			break;
		case 3:
			deleteProfile(profile);
			break;
		}
		return jsonStr;
	}

	public String executeAjax(Skill skill, int cmd) {
		switch (cmd) {
		case 1:
			addSkill(skill);
			break;
		case 2:
			showSkill(skill);
			break;
		case 3:
			deleteSkill(skill);
		}
		return jsonStr;
	}

	public String executeAjax(Portfolio portfolio, int cmd) {
		switch (cmd) {
		case 1:
			showPortfolioList(portfolio);
			break;
		}
		return jsonStr;
	}

	public ModelAndView execute(int cmd, MultipartHttpServletRequest multi, MultipartFile[] files) {
		switch (cmd) {
		case 1:
			insertPortfolio(multi, files);
			break;
		}
		return mav;
	}

	public ModelAndView execute(Portfolio portfolio, int cmd) {
		switch (cmd) {
		case 1:
			showPortfolioDetail(portfolio);
			break;
		case 2:
			goPortfolioUpdate(portfolio);
			break;
		case 3:
			updatePortfolio(portfolio);
			break;
		case 4:
			deletePortfolio(portfolio);
			break;
		}
		return mav;
	}

	public ModelAndView execute(Volunteer volunteer, int cmd) {
		switch (cmd) {
		case 1:
			insertVolunteer(volunteer);
			break;
		}
		return mav;
	}

	public ModelAndView execute(Project project, int cmd) {
		switch (cmd) {
		case 1:
			getWaitProjectList(project);
			break;

		}
		return mav;
	}

	private ModelAndView getWaitProjectList(Project project) {
		System.out.println("옴?");
		mav = new ModelAndView();
		String view = null;
		String p_mid = (String) ss.getAttribute("m_id");
		String v_mid = (String) ss.getAttribute("m_id");// 작업전을 위해
		// String pd_mid = (String) ss.getAttribute("m_id");//진행중
		// List<Project> plist3=null;

		List<Client_mypage> plist1 = null;
		List<Client_mypage> plist2 = null;
		List<Client_mypage> plist3 = null;
		System.out.println("받아옴?" + p_mid);
		plist1 = pDao.getWaitProjectList(v_mid);
		plist2 = pDao.getOnGoingProjectList(v_mid);
		plist3 = pDao.getCompleteProjectList(v_mid);
		System.out.println(plist1);
		System.out.println(plist2);
		if (ss != null && ss.getAttribute("m_id") != null) {
			if (plist1 != null) {
				StringBuilder sb = new StringBuilder();
				sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
				sb.append("<tr>");
				sb.append("<th style='text-align:center;'>" + "지원자번호" + "</th>");
				sb.append("<th style='text-align:center;'>" + "프로젝트번호" + "</th>");
				sb.append("<th style='text-align:center;'>" + "프로젝트제목" + "</th>");
				sb.append("<th style='text-align:center;'>" + "입찰가" + "</th>");
				sb.append("<th style='text-align:center;'>" + "지원취소" + "</th>");
				sb.append("</tr>");
				for (int i = 0; i < plist1.size(); i++) {
					Client_mypage p1 = plist1.get(i);
					sb.append("<tr>");
					sb.append("<th style='text-align:center;'>" + p1.getV_num() + "</th>");
					sb.append("<th style='text-align:center;'>" + p1.getP_num() + "</th>");
					sb.append("<th style='text-align:center;'><a href='goProjectDetail?p_num=" + p1.getP_num() + "'>" + p1.getP_title()
							+ "</a></th>");
					sb.append("<th style='text-align:center;'>" + p1.getV_bid() + "&nbsp;만원</th>");
					sb.append("<th style='text-align:center;'><a href='goVolunteerdelete?p_num=" + p1.getP_num() + "'><button class='btn' style='margin-top:0px;'>" + "취소"
							+ "</button></a></th>");
					sb.append("</tr>");
				}
				sb.append("</table>");
				mav.addObject("plist1", sb.toString());
			}
			if (plist2 != null) {
				StringBuilder sb1 = new StringBuilder();
				sb1.append("<table class='table table-responsive' style='text-align:center; color:black;'");
				sb1.append("<tr>");
				sb1.append("<th style='text-align:center;'>" + "지원번호" + "</th>");
				sb1.append("<th style='text-align:center;'>" + "프로젝트번호" + "</th>");
				sb1.append("<th style='text-align:center;'>" + "프로젝트제목" + "</th>");
				sb1.append("<th style='text-align:center;'>" + "매출" + "</th>");
				sb1.append("<th style='text-align:center;'>" + "현금흐름" + "</th>");
				sb1.append("</tr>");
				for (int i = 0; i < plist2.size(); i++) {
					Client_mypage p2 = plist2.get(i);
					sb1.append("<tr>");
					sb1.append("<th style='text-align:center;'>" + p2.getV_num() + "</th>");
					sb1.append("<th style='text-align:center;'>" + p2.getP_num() + "</th>");
					sb1.append("<th style='text-align:center;'><a href='goProjectDetail?p_num=" + p2.getP_num() + "'>" + p2.getP_title()
							+ "</a></th>");
					sb1.append("<th style='text-align:center;'>" + p2.getSales() + "&nbsp;만원</th>");
					sb1.append("<th style='text-align:center;'><a href='getCashflow?p_num=" + p2.getP_num() + "'><button class='btn'>" + "현금흐름"
							+ "</button></a></th>");
					sb1.append("</tr>");
				}
				sb1.append("</table>");
				mav.addObject("plist2", sb1.toString());
			}
			if (plist3 != null) {
				StringBuilder sb2 = new StringBuilder();
				sb2.append("<table class='table table-responsive' style='text-align:center; color:black;'");
				sb2.append("<tr>");
				sb2.append("<th style='text-align:center;'>" + "지원번호" + "</th>");
				sb2.append("<th style='text-align:center;'>" + "프로젝트번호" + "</th>");
				sb2.append("<th style='text-align:center;'>" + "프로젝트제목" + "</th>");
				sb2.append("<th style='text-align:center;'>" + "매출" + "</th>");
				sb2.append("<th style='text-align:center;'>" + "현금흐름" + "</th>");
				sb2.append("</tr>");
				for (int i = 0; i < plist3.size(); i++) {
					Client_mypage p3 = plist3.get(i);
					sb2.append("<tr style='text-align:center;'>");
					sb2.append("<th style='text-align:center;'>" + p3.getV_num() + "</th>");
					sb2.append("<th style='text-align:center;'>" + p3.getP_num() + "</th>");
					sb2.append("<th><a href='goProjectDetail?p_num=" + p3.getP_num() + "'>" + p3.getP_title()
							+ "</a></th>");
					sb2.append("<th style='text-align:center;'>" + p3.getSales() + "&nbsp; 만원</th>");
					sb2.append("<th><a href='getCashflowfinish?p_num=" + p3.getP_num() + "'><button>" + "현금흐름"
							+ "</button></a></th>");
					sb2.append("</tr>");
				}
				sb2.append("</table>");
				mav.addObject("plist3", sb2.toString());
			}
		}
		view = "myPageFr";
		mav.setViewName(view);
		return mav;
	}

	private ModelAndView insertVolunteer(Volunteer volunteer) {
		String view = null;
		mav = new ModelAndView();
		int v_pnum = Integer.parseInt(req.getParameter("v_pnum"));
		int v_bid = Integer.parseInt(req.getParameter("v_bid"));
		String m_id = (String) ss.getAttribute("m_id");
		volunteer.setV_num(vDao.getVolunteerMaxNum() + 1);
		volunteer.setV_ptteam(0);
		volunteer.setV_pnum(Integer.parseInt(req.getParameter("v_pnum")));
		volunteer.setV_mid(m_id);
		volunteer.setV_bid(Integer.parseInt(req.getParameter("v_bid")));
		if (ss != null && ss.getAttribute("m_id") != null) {
			System.out.println(vDao.checkVolunteerList(volunteer));
			if (vDao.checkVolunteerList(volunteer) == 0) {
				System.out.println(volunteer.getV_bid());
				vDao.insertVolunteer(volunteer);
				System.out.println("실행확인1");
				pDao.VolunteerUpdate(v_pnum, m_id);
				System.out.println("실행확인2");
				mav.setViewName("redirect:goProjectDetail?p_num=" + v_pnum);
			} else if (vDao.checkVolunteerList(volunteer) > 0) {
				System.out.println("얍");
				vDao.updateBid(volunteer);
				System.out.println("완료?");
				mav.setViewName("redirect:goProjectDetail?p_num=" + v_pnum);
			}
		}
		return mav;
	}

	private void addSkill(Skill skill) {
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			String id = (String) ss.getAttribute("m_id");
			skill.setSk_num(fDao.getSkillMaxNum() + 1);
			skill.setM_id(id);
			skill.setSk_name(req.getParameter("sk_name"));
			System.out.println(req.getParameter("sk_name"));
			skill.setSk_grade(req.getParameter("sk_grade"));
			System.out.println(req.getParameter("sk_grade"));
			skill.setSk_career(req.getParameter("sk_career"));
			System.out.println(req.getParameter("sk_career"));
			if (fDao.insertSkill(skill) != 0) {
				List<Skill> sklist = fDao.getSkillList(id);
				System.out.println(sklist);
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(sklist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
			}

		} else {
			System.out.println("실패");
			view = "skillInfo";
		}
	}

	private void showSkill(Skill skill) {
		mav = new ModelAndView();
		String view = null;
		List<Skill> sklist = null;
		System.out.println("기술정보 들어옴");
		if (ss != null && ss.getAttribute("m_id") != null) {
			String m_id = (String) ss.getAttribute("m_id");
			System.out.println(m_id);
			sklist = fDao.getSkillList(m_id);
			System.out.println(sklist);
			if (sklist != null) {
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(sklist);
				System.out.println("jsonStr : " + jsonStr);
				mav.addObject("slist", jsonStr);
				view = "skillInfo";
			}
		}
		view = "skillInfo";
		mav.setViewName(view);
	}

	private void deleteSkill(Skill skill) {
		System.out.println("기술정보 삭제 들어옴");
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			int sk_num = Integer.parseInt(req.getParameter("num"));
			if (fDao.deleteSKill(sk_num) != 0) {
				System.out.println("기술정보 삭제 성공");
			} else {
				System.out.println("기술정보 삭제 실패");
			}
			view = "skillInfo";
			mav.setViewName(view);
		}
	}

	private void insertProfile(Profile profile) {
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			String id = (String) ss.getAttribute("m_id");
			profile.setPro_num(fDao.getProfileMaxNum() + 1);
			profile.setM_id(id);
			System.out.println(id);
			profile.setPro_content(req.getParameter("pro_content"));
			System.out.println(req.getParameter("pro_content"));
			if (fDao.insertProfile(profile) != 0) {
				List<Profile> prlist = fDao.getProfileList(id);
				System.out.println(prlist);
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(prlist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
			}

		} else {
			System.out.println("실패");
			view = "profile";
		}
	}

	private void showProfile(Profile profile) {
		mav = new ModelAndView();
		String view = null;
		List<Profile> prlist = null;
		System.out.println("프로필들어옴");
		if (ss != null && ss.getAttribute("m_id") != null) {
			String m_id = (String) ss.getAttribute("m_id");
			System.out.println(m_id);
			prlist = fDao.getProfileList(m_id);
			System.out.println(prlist);
			if (prlist != null) {
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(prlist);
				System.out.println("jsonStr : " + jsonStr);
				mav.addObject("prlist", jsonStr);
				view = "profile";
				/*
				 * StringBuilder sb = new StringBuilder(); for(int i=0;
				 * i<prlist.size(); i++){ Profile pr=prlist.get(i);
				 * sb.append("<tr><td>"+c.getCa_num()+"</td>");
				 * sb.append("<tr><td>"+pr.getM_name()+"</td>");
				 * sb.append("<td>"+pr.getM_image()+"</td>");
				 * sb.append("<td>"+pr.getPro_content()+"</td></tr>"); }
				 * mav.addObject("prlist", sb.toString());
				 */
			}
			view = "profile";
			mav.setViewName(view);
		}
	}

	private void deleteProfile(Profile profile) {
		System.out.println("프로필 삭제 들어옴");
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			int pro_num = Integer.parseInt(req.getParameter("num"));
			if (fDao.deleteProfile(pro_num) != 0) {
				System.out.println("프로필 삭제 성공");
			} else {
				System.out.println("프로필 삭제 실패");
			}
			view = "profile";
			mav.setViewName(view);
		}
	}

	private void insertCareer(Career career) {
		System.out.println("경력인서트들어옴");
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			String id = (String) ss.getAttribute("m_id");
			career.setCa_num(fDao.getCareerMaxNum() + 1);
			/* career.setCa_num(String.valueOf(fDao.getCareerMaxNum()+1)); */
			career.setM_id(id.toString());
			career.setCa_term(req.getParameter("ca_term"));
			career.setCa_company(req.getParameter("ca_company"));
			career.setCa_rank(req.getParameter("ca_rank"));
			System.out.println("ca_rank=" + req.getParameter("ca_rank"));
			if (fDao.insertCareer(career) != 0) {
				List<Career> clist = fDao.getCareerList(id);
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(clist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
				mav.addObject("clist", jsonStr);
				view = "careerInfo";
			}

		} else {
			System.out.println("실패");
			view = "careerInfo";
		}
	}

	private void showCareer(Career career) {
		mav = new ModelAndView();
		String view = null;
		List<Career> clist = null;
		System.out.println("경력 출력 들어옴");
		if (ss != null && ss.getAttribute("m_id") != null) {
			String m_id = (String) ss.getAttribute("m_id");
			System.out.println(m_id);
			clist = fDao.getCareerList(m_id);
			System.out.println(clist);
			if (clist != null) {
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(clist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
				mav.addObject("clist", jsonStr);
				view = "careerInfo";
				/*
				 * StringBuilder sb = new StringBuilder(); for(int i=0;
				 * i<clist.size(); i++){ Career c=clist.get(i);
				 * sb.append("<tr><td>"+c.getCa_num()+"</td>");
				 * sb.append("<tr><td>"+c.getCa_term()+"</td>");
				 * sb.append("<td>"+c.getCa_company()+"</td>");
				 * sb.append("<td>"+c.getCa_rank()+"</td>");
				 * sb.append("<td><a href='deleteCareerInfo?Ca_num="+c.getCa_num
				 * ()+"'>"+"삭제"+"</a></td></tr>"); } mav.addObject("clist",
				 * sb.toString());
				 */
			}
			view = "careerInfo";
			mav.setViewName(view);
		}
	}

	private void deleteCareer(Career career) {
		System.out.println("경력 삭제 들어옴");
		String view = null;
		mav = new ModelAndView();
		if (ss != null && ss.getAttribute("m_id") != null) {
			int ca_num = Integer.parseInt(req.getParameter("num"));
			if (fDao.deleteCareer(ca_num) != 0) {
				System.out.println("경력 삭제 성공");
			} else {
				System.out.println("경력 삭제 실패");
			}
			view = "careerInfo";
			mav.setViewName(view);
		}
	}

	private void insertPortfolio(MultipartHttpServletRequest multi, MultipartFile[] files) {
		System.out.println("실행?");
		mav = new ModelAndView();
		String view = null;
		// MultipartFile[] files = request.getParameter("pf_image[]");
		if (ss != null && ss.getAttribute("m_id") != null) {
			String pf_mid = (String) ss.getAttribute("m_id");
			String pf_title = multi.getParameter("pf_title");
			String pf_term = multi.getParameter("pf_term");
			String pf_contribute = multi.getParameter("pf_contribute");
			String pf_content = multi.getParameter("pf_content");
			// int check = Integer.parseInt(multi.getParameter(""))
			// Map<String, Object> pfMap = null;
			UploadFile upload = new UploadFile();
			// pfMap = upload.fileUp(multi);
			// List<Map<String, Object>> mapList = upload.fileUp(multi, files);
			List<String> mapList = upload.fileUp(multi, files);
			Portfolio portfolio = new Portfolio();
			portfolio.setPf_mid(pf_mid);
			if (fDao.getPortfolioCount() != 0) {
				portfolio.setPf_num(fDao.getPortfolioMaxNum() + 1);
			} else {
				portfolio.setPf_num(1);
			}
			portfolio.setPf_title(pf_title);
			portfolio.setPf_term(pf_term);
			portfolio.setPf_contribute(pf_contribute);
			portfolio.setPf_content(pf_content);
			// insert 값 부족
			System.out.println("portfolio num:" + portfolio.getPf_num());
			if (fDao.insertPortfolio(portfolio) != 0) {
				List<Portfolio> pflist = fDao.getPortfolioList(pf_mid);
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(pflist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
				mav.addObject("pflist", jsonStr);
				view = "portfolio";
			}
			// pfDao.portFolioInsert(portfolio);
			int pfNum = fDao.getPortfolioMaxNum();
			fDao.portfolioFileInsert(mapList, pfNum);
			System.out.println("ㅎㅇ:"+mapList);
			mav.setViewName("portfolio");
		}
	}

	private void showPortfolioList(Portfolio portfolio) {
		mav = new ModelAndView();
		String view = null;
		List<Portfolio> pflist = null;
		System.out.println("포트폴리오 출력 들어옴");
		if (ss != null && ss.getAttribute("m_id") != null) {
			String m_id = (String) ss.getAttribute("m_id");
			System.out.println(m_id);
			pflist = fDao.getPortfolioList(m_id);
			System.out.println(pflist);
			if (pflist != null) {
				Gson jsonObj = new Gson();
				jsonStr = jsonObj.toJson(pflist);
				System.out.println("jsonStr : " + jsonStr);
				// jsonObj=new HashMap<String,List<Reply>>();
				// jsonObj.put("rlist", rlist); //hashMap에 저장
				/*
				 * StringBuilder sb = new StringBuilder(); for(int i=0;
				 * i<clist.size(); i++){ Career c=clist.get(i);
				 * sb.append("<tr><td>"+c.getCa_num()+"</td>");
				 * sb.append("<tr><td>"+c.getCa_term()+"</td>");
				 * sb.append("<td>"+c.getCa_company()+"</td>");
				 * sb.append("<td>"+c.getCa_rank()+"</td>");
				 * sb.append("<td><a href='deleteCareerInfo?Ca_num="+c.getCa_num
				 * ()+"'>"+"삭제"+"</a></td></tr>"); } mav.addObject("clist",
				 * sb.toString());
				 */
			}
		}
	}

	private ModelAndView showPortfolioDetail(Portfolio portfolio) {
		mav = new ModelAndView();
		String view = null;
		// List<Portfolio> pflist = null;
		System.out.println("포트폴리오 상세 들어옴");
		if (ss != null && ss.getAttribute("m_id") != null) {
			int pf_num = Integer.parseInt(req.getParameter("pfnum"));
			String pf_mid = (String) ss.getAttribute("m_id");
			System.out.println(pf_num);
			System.out.println(pf_mid);
			// pflist = fDao.getPortfolioList(pf_mid);
			List<Portfolio> pf = fDao.getPortfolioDetailList(pf_num);
			System.out.println(pf);
			if (pf != null) {
				StringBuilder sb = new StringBuilder();
				for (int i = 0; i < pf.size(); i++) {
					Portfolio pf1 = pf.get(i);
					if (i < 1) {
						sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
						sb.append("<tr><td style='width:10%; text-align:center;'>" + "제목" + "</td>");
						sb.append("<td>" + pf1.getPf_title() + "</td></tr>");
						sb.append("<tr><td style='text-align:center;'>" + "기간" + "</td>");
						sb.append("<td>" + pf1.getPf_term() + "</td></tr>");
						sb.append("<tr><td style='text-align:center;'>" + "참여율" + "</td>");
						sb.append("<td colspan='3'>" + pf1.getPf_contribute() + "</td></tr>");
						sb.append("<tr><td style='text-align:center;'>" + "내용" + "</td>");
						sb.append("<td colspan='3'>" + pf1.getPf_content() + "</td></tr>");
						sb.append("<tr rowspan='4'><td style='vertical-align:middle; text-align:center;'>" + "포트폴리오"
								+ "</td>");
						sb.append("<td colspan='4'><img style='width:100%; height:100%;' src='resources/upload/"
								+ pf1.getPt_sysname() + "'</td></tr>");
						sb.append("</table>");
					} else {
						sb.append("<table class='table table-responsive' style='text-align:center; color:black;'");
						sb.append("<tr><td><img style='width:100%; height:100%;' src='resources/upload/"
								+ pf1.getPt_sysname() + "'</td></tr>");
						sb.append("</table>");
					}
				}
				sb.append("<form action='deletePortfolio' method='post' id='portfolio'>");
				sb.append("<input type='hidden' name='pfnum' value=" + pf_num + " />");
				mav.addObject("portfolio", sb.toString());
				mav.addObject("pf_num", pf_num);
				System.out.println("대따");
			}
			view = "portfolioDetail";
			mav.setViewName(view);

		}
		return mav;
	}

	private void goPortfolioUpdate(Portfolio portfolio) {
		mav = new ModelAndView();
		String view = null;
		System.out.println("가자 업데이트로!");
		int pf_num = Integer.parseInt(req.getParameter("pf_num"));
		System.out.println(pf_num);
		mav.addObject("pf_num", pf_num);
		view = "portfolioUpdate";
		mav.setViewName(view);
	}

	private void updatePortfolio(Portfolio portfolio) {
		System.out.println("포트폴리오 업데이트!!");
		String view = null;
		mav = new ModelAndView();
		int pf_num = Integer.parseInt(req.getParameter("pfnum"));
		if (ss != null && ss.getAttribute("m_id") != null) {
			String pf_mid = (String) ss.getAttribute("m_id");
			System.out.println(pf_num);
			System.out.println(pf_mid);

			String pf_title = req.getParameter("pf_title");
			System.out.println(pf_title);
			String pf_term = req.getParameter("pf_term");
			String pf_contribute = req.getParameter("pf_contribute");
			String pf_content = req.getParameter("pf_content");
			portfolio.setPf_num(pf_num);
			portfolio.setPf_title(pf_title);
			portfolio.setPf_term(pf_term);
			portfolio.setPf_contribute(pf_contribute);
			portfolio.setPf_content(pf_content);

			fDao.updatePortfolio(portfolio);
			mav.addObject("portfolio", portfolio);
		}
		List<Portfolio> pf = fDao.getPortfolioDetailList(pf_num);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pf.size(); i++) {
			Portfolio pf1 = pf.get(i);
			if (i < 1) {
				sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
				sb.append("<tr><th style='text-align:center;'>" + "제목" + "</th></tr>");
				sb.append("<tr><td>" + pf1.getPf_title() + "</td></tr>");
				sb.append("<tr><th style='text-align:center;'>" + "기간" + "</th></tr>");
				sb.append("<tr><td>" + pf1.getPf_term() + "</td></tr>");
				sb.append("<tr><th style='text-align:center;'>" + "참여율" + "</th></tr>");
				sb.append("<tr><td>" + pf1.getPf_contribute() + "</td></tr>");
				sb.append("<tr><th style='text-align:center;'>" + "내용" + "</th></tr>");
				sb.append("<tr><td>" + pf1.getPf_content() + "</td></tr>");
				sb.append("<tr><th style='text-align:center;'>" + "포트폴리오" + "</th></tr>");
				sb.append("<tr><td><img src='resources/upload/" + pf1.getPt_sysname() + "'</td></tr>");
				sb.append("</table>");
			} else {
				sb.append("<table class='table table-responsive' style='text-align:center; color:black;'");
				sb.append("<tr><td><img src='resources/upload/" + pf1.getPt_sysname() + "'</td></tr>");
				sb.append("</table>");
			}
		}
		sb.append("<form action='deletePortfolio' method='post' id='portfolio'>");
		sb.append("<input type='hidden' name='pfnum' value=" + pf_num + " />");
		mav.addObject("portfolio", sb.toString());
		view = "portfolioDetail";
		mav.setViewName(view);
	}

	private void deletePortfolio(Portfolio portfolio) {
		System.out.println("포트폴리오 삭제 들어옴");
		String view = null;
		mav = new ModelAndView();
		System.out.println(req.getParameter("pfnum"));
		if (ss != null && ss.getAttribute("m_id") != null) {
			int pf_num = Integer.parseInt(req.getParameter("pfnum"));
			if (fDao.deletePortfolio(pf_num) != 0) {
				System.out.println("포트폴리오 삭제 성공");
			} else {
				System.out.println("포트폴리오 삭제 실패");
			}
			view = "portfolio";
			mav.setViewName(view);
		}
	}

	// 프리랜서 상세보기내 경력정보 추출 메소드

	private void showFreelancerCareer(Career career) {
		mav = new ModelAndView();
		String view = null;
		List<Career> clist = null;
		int ca_num = Integer.parseInt(req.getParameter("ca_num"));
		System.out.println(ca_num);
		clist = fDao.getCareerList(ca_num);
		System.out.println(clist);
		if (clist != null) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < clist.size(); i++) {
				Career c = clist.get(i);
				sb.append("<tr><td>" + c.getCa_num() + "</td>");
				sb.append("<td><a href='goMyCareer?Ca_num=" + c.getCa_num() + "'>" + c.getCa_term() + "</a></td>");
				sb.append("<td>" + c.getCa_company() + "</td>");
				sb.append("<td>" + c.getCa_rank() + "</td>");
				sb.append("<td>" + "삭제" + "</td></tr>");
			}
			mav.addObject("clist", sb.toString());
		}
		view = "careerInfo";
		mav.setViewName(view);
	}

	// 프리랜서 페이지 프리랜서 리스트 표출 메소드
	public ModelAndView showList() {
		mav = new ModelAndView();
		String view = null;
		List<Member> flist = null;
		flist = fDao.getFreelancer();
		if (flist != null) {
			StringBuilder sb = new StringBuilder();
			sb.append("<div class='container' style='height:100%;'>");
			sb.append("<div class='row'>");
			sb.append("<form style='float: right' action='searchKeywordFr' id='searchForm' method='get'>");
			sb.append("<input type='text' id='keyword' name='keyword' placeholder='프리랜서 이름'/>");
			sb.append("<input type='button' id='search' value='검색'>");
			sb.append("</form>");
			sb.append("</div>");
			for (int i = 0; i < flist.size(); i++) {
				Member f = flist.get(i);
				sb.append("<div class='col-md-3 col-sm-6 hero-feature'>");
				sb.append("<div class='thumbnail'>");
				sb.append("<img src='resources/upload/" + f.getMf_sysname() + "' alt=''>");
				System.out.println(f.getMf_sysname());
				sb.append("<div class='caption'>");
				sb.append("<h3 style='text-align:center;'>" + f.getM_name() + "</h3>");
				sb.append("<p style='text-align:center;'>" + f.getM_email() + "</p>");
				sb.append("<p style='text-align:center; color:skyblue;'>좋아요 : " + fDao.CntLike(f.getM_id()) + "개</p>");
				sb.append(
						"<p style='text-align:center;'><a style='color:white;' class='btn btn-default' href='goFreelancerDetail?m_id="
								+ f.getM_id() + "'>" + "상세보기" + "</a>" + "</p>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("</div>");
			}
			sb.append("</div>");
			mav.addObject("flist", sb.toString());
		}

		view = "freelancer";
		mav.setViewName(view);
		return mav;

	}

	// 프리랜서 상세보기 메소드
	public ModelAndView showDetail() {

		mav = new ModelAndView();
		String view = null;
		String sm_id=(String) ss.getAttribute("m_id");
		if(sm_id==null){
			mav.addObject("msg","로그인이 필요한 서비스입니다.");
			view="login";
			mav.setViewName(view);
			
		}
		else{
			String m_id = (String) req.getParameter("m_id");
			String l_mgetid = (String) req.getParameter("m_id");
			List<Career> career = null;
			List<Skill> skill = null;
			List<Portfolio> portfolio;
			System.out.println(m_id);
			fDao.getFreelancerDetail(m_id);
			mav.addObject("like", fDao.CntLike(l_mgetid));
			mav.addObject("photo", fDao.getProfilePhoto(m_id));
			mav.addObject("freelancer", fDao.getFreelancerDetail(m_id));
	
			// 상세보기 내 경력정보 추출
			career = fDao.getCareer(m_id);
	
			// 상세보기 내 기술정보 추출
			skill = fDao.getSkill(m_id);
	
			// 상세보기 내 포트폴리오 추출
			portfolio = fDao.getPortfolioList(m_id);
	
			if (career != null) {
				StringBuilder sb = new StringBuilder();
				sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
				sb.append("<tr>");
				sb.append("<th style='text-align:center;'>" + "경력" + "</th>");
				sb.append("<th style='text-align:center;'>" + "회사" + "</th>");
				sb.append("<th style='text-align:center;'>" + "직급" + "</th>");
				sb.append("</tr>");
				for (int i = 0; i < career.size(); i++) {
					Career c = career.get(i);
					sb.append("<tr>");
					sb.append("<td>" + c.getCa_term() + "</td>");
					sb.append("<td>" + c.getCa_company() + "</td>");
					sb.append("<td>" + c.getCa_rank() + "</td>");
					sb.append("</tr>");
				}
				sb.append("</table>");
				mav.addObject("career", sb.toString());
			}
			if (skill != null) {
				StringBuilder sb = new StringBuilder();
				sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
				sb.append("<tr>");
				sb.append("<th style='text-align:center;'>" + "기술명" + "</th>");
				sb.append("<th style='text-align:center;'>" + "기술 등급" + "</th>");
				sb.append("<th style='text-align:center;'>" + "기술 사용기간" + "</th>");
				sb.append("</tr>");
				for (int i = 0; i < skill.size(); i++) {
					Skill s = skill.get(i);
					sb.append("<tr>");
					sb.append("<td>" + s.getSk_name() + "</td>");
					sb.append("<td>" + s.getSk_grade() + "</td>");
					sb.append("<td>" + s.getSk_career() + "</td>");
					sb.append("</tr>");
				}
				sb.append("</table>");
				mav.addObject("skill", sb.toString());
			}
			if (portfolio != null) {
				StringBuilder sb = new StringBuilder();
				sb.append("<div class='container'>");
				sb.append("<h1 style='color:black; text-align:center;'>포트폴리오 리스트</h1>");
				for (int i = 0; i < portfolio.size(); i++) {
					Portfolio p = portfolio.get(i);
					sb.append("<table class='table table-responsive' style='text-align:center; color:black;'>");
					sb.append("<tr>");
					sb.append("<td colspan='4'>" + "<a href='#contents_layer' onClick='articleView(" + p.getPf_num()
							+ ")'><img src='resources/upload/" + p.getPt_sysname() + "'></a></td>");
					sb.append("</tr>");
					sb.append("<tr>");
					sb.append("<td>제목</td>");
					sb.append("<td>" + p.getPf_title() + "</td>");
					sb.append("</tr>");
					sb.append("<tr>");
					sb.append("<td>기간</td>");
					sb.append("<td>" + p.getPf_term() + "</td>");
					sb.append("</tr>");
					sb.append("<tr>");
					sb.append("<td>기여도</td>");
					sb.append("<td>" + p.getPf_contribute() + "</td>");
					sb.append("</tr>");
					sb.append("<tr>");
					sb.append("<td>내용</td>");
					sb.append("<td>" + p.getPf_content() + "</td>");
					sb.append("</tr>");
					sb.append("</table>");
				}
				sb.append("</div>");
				mav.addObject("port", sb.toString());
			}
			view = "freelancerDetail";
			mav.setViewName(view);
		}
		return mav;

	}

	// 프리랜서 페이지에서 검색 메소드
	public ModelAndView searchFreelancer() {
		mav = new ModelAndView();
		String view = null;
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		List<Member> slist = null;
		slist = fDao.getSearchResult(keyword);
		System.out.println("검색결과:" + slist);
		if (slist != null) {
			StringBuilder sb = new StringBuilder();
			sb.append("<div class='container' style='height:100%;'>");
			sb.append("<div class='row'>");
			sb.append("<form style='float: right' action='searchKeywordFr' id='searchForm' method='get'>");
			sb.append("<input type='text' id='keyword' name='keyword' placeholder='프리랜서 이름'/>");
			sb.append("<input type='button' id='search' value='검색'>");
			sb.append("</form>");
			sb.append("</div>");
			for (int i = 0; i < slist.size(); i++) {
				Member r = slist.get(i);
				sb.append("<div class='col-md-3 col-sm-6 hero-feature'>");
				sb.append("<div class='thumbnail'>");
				sb.append("<img src='resources/upload/" + r.getMf_sysname() + "' alt=''>");

				sb.append("<div class='caption'>");
				sb.append("<h3 style='text-align:center;'>" + r.getM_name() + "</h3>");
				sb.append("<p style='text-align:center;'>" + r.getM_email() + "</p>");
				sb.append("<p style='text-align:center; color:skyblue;'>좋아요 : " + fDao.CntLike(r.getM_id()) + "개</p>");
				sb.append(
						"<p style='text-align:center;'><a style='color:white;' class='btn btn-default' href='goFreelancerDetail?m_id="
								+ r.getM_id() + "'>" + "상세보기" + "</a>" + "</p>");
				sb.append("</div>");
				sb.append("</div>");
				sb.append("</div>");
			}
			sb.append("</div>");
			mav.addObject("slist", sb.toString());
		}
		view = "freelancer";
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView deleteVolunteer() {// 지원자 삭제
		mav = new ModelAndView();
		String view = null;
		int v_pnum = Integer.parseInt(req.getParameter("p_num"));
		int p_num = Integer.parseInt(req.getParameter("p_num"));
		String v_mid = (String) ss.getAttribute("m_id");
		Volunteer vl = new Volunteer();
		vl.setV_pnum(v_pnum);
		vl.setV_mid(v_mid);
		// int delete=vDao.deleteVolunteer(vl);
		if (vDao.deleteVolunteer(vl) != 0) {// 프로젝트 지원 인원수 감소
			System.out.println("삭제 성공");
			Project project = new Project();
			project.setP_vol(pDao.getProjectMaxVol(p_num) - 1);
			project.setP_num(p_num);
			if (pDao.dropProjectVol(project) != 0) {
				System.out.println("인원 수 감소 성공");

				view = "redirect:goMyPage";
				mav.setViewName(view);
				return mav;

			}
		}

		return null;
	}

	public ModelAndView getCashflow() {// 프리랜서 현금흐름 보기
		mav = new ModelAndView();
		String view = null;

		int pu_pnum = Integer.valueOf(req.getParameter("p_num"));
		// String pd_mid=ss.getAttribute("m_id").toString();
		int pd_punum = aDao.getPu_num(pu_pnum);
		System.out.println(pd_punum);
		Purchase_detail pd = new Purchase_detail();
		// pd.setPd_mid(pd_mid);
		// pd.setPd_punum(pd_punum);

		List<Purchase_detail> PListFr = null;
		List<Purchase_detail> PListAr = null;
		PListFr = aDao.getPurchaseListFr(pd_punum);// 계약금 받아오기
		PListAr = aDao.getPurchaseListAr(pd_punum);// 예상매출 받아오기
		System.out.println(PListFr);
		System.out.println(PListAr);

		if (PListFr != null) {
			StringBuilder sb = new StringBuilder();
			// sb.append("<form action='goMyPageFr' name='MyPageFr'
			// method='get'>");
			sb.append("<table class='table table-responsive'>");
			sb.append("<tr><th>현금흐름번호</th><th>결제번호</th><th>계약금</th></tr>");

			for (int i = 0; i < PListFr.size(); i++) {
				System.out.println("ddddd");
				Purchase_detail pd1 = PListFr.get(i);
				sb.append("<tr><td>" + pd1.getPd_num() + "</td>");
				sb.append("<td>" + pd1.getPd_punum() + "</td>");
				sb.append("<td>" + pd1.getPd_money() + "</td></tr>");
			}

			sb.append("</table>");
			sb.append("<br/><br/>");
			// sb.append("<input type='submit' value='마이페이지 가기'/>");
			// sb.append("</form>");
			System.out.println(sb);
			mav.addObject("pListFr", sb.toString());
			view = "FreePurchase";
			mav.setViewName(view);
		}
		if (PListAr != null) {
			StringBuilder sb = new StringBuilder();
			sb.append("<form action='goMyPageFr' name='MyPageFr' method='get'>");
			sb.append("<table class='table table-responsive'>");
			sb.append("<tr><th>현금흐름번호</th><th>결제번호</th><th>예상매출액</th></tr>");

			for (int i = 0; i < PListAr.size(); i++) {
				System.out.println("ddddd");
				Purchase_detail pd1 = PListAr.get(i);
				sb.append("<tr><td>" + pd1.getPd_num() + "</td>");
				sb.append("<td>" + pd1.getPd_punum() + "</td>");
				sb.append("<td>" + pd1.getPd_money() + "</td></tr>");
			}
			sb.append("</table>");
			sb.append("<br/><br/>");
			sb.append("<input class='btn' type='submit' value='마이페이지 가기'/>");
			sb.append("</form>");
			System.out.println(sb);
			mav.addObject("PListAr", sb.toString());
			view = "FreePurchase";
			mav.setViewName(view);
		}
		return mav;
	}

	public ModelAndView getCashflowfinish() {// 최종 현금흐름
		mav = new ModelAndView();
		String view = null;
		int pu_pnum = Integer.valueOf(req.getParameter("p_num"));
		int pd_punum = aDao.getPu_num(pu_pnum);

		System.out.println(pd_punum);
		Purchase_detail pd = new Purchase_detail();
		pd.setPd_punum(pd_punum);
		pd.setPd_catagory("A");
		List<Purchase_detail> finallyList = null;
		finallyList = aDao.getFinishFlow(pd);// 최종 매출액 받아오기

		if (finallyList != null) {
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < finallyList.size(); i++) {
				System.out.println("ddddd");
				Purchase_detail pd1 = finallyList.get(i);
				sb.append("<tr><td>" + pd1.getPd_num() + "</td>");
				sb.append("<td>" + pd1.getPd_punum() + "</td>");
				sb.append("<td>" + pd1.getPd_money() + "</td></tr>");
			}
			System.out.println(sb);
			mav.addObject("finallyList", sb.toString());
			view = "finalPurchase";
			mav.setViewName(view);
		}
		return mav;
	}

	public ModelAndView LightBox(int cmd) {
		switch (cmd) {
		case 1:
			portView();
			break;
		}
		return mav;
	}

	public ModelAndView executeProfile(int cmd) {
		switch (cmd) {
		case 1:
			goMyProfile();
			break;

		}
		return mav;
	}

	private ModelAndView portView() {
		mav = new ModelAndView();
		String view = null;
		System.out.println("포트폴리오 라이트박스");
		int pf_num = Integer.parseInt(req.getParameter("pf_num"));
		System.out.println(pf_num);
		List<Portfolio> pf = fDao.getPortfolioDetailList(pf_num);
		System.out.println(pf);
		if (pf != null) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < pf.size(); i++) {
				Portfolio pf1 = pf.get(i);
				if (i < 1) {
					sb.append("<table class='table table-striped' style='text-align:center; color:black;'");
					sb.append("<tr><td style='text-align:center;'>" + "제목" + "</td><td>" + pf1.getPf_title() + "</td>");
					sb.append("<td style='text-align:center;'>" + "기간" + "</td><td>" + pf1.getPf_term() + "</td></tr>");
					sb.append("<tr><td style='text-align:center;'>" + "참여율" + "</td><td colspan='3' >"
							+ pf1.getPf_contribute() + "</td></tr>");
					sb.append("<tr><td style='text-align:center;'>" + "내용" + "</td><td colspan='3'>"
							+ pf1.getPf_content() + "</td></tr>");
					sb.append("<tr><td colspan='4' style='text-align:center;'>" + "포트폴리오" + "</td></tr>");
					sb.append("<tr colspan='4'><td colspan='4'><img src='resources/upload/" + pf1.getPt_sysname()
							+ "'</td></tr>");
					sb.append("</table>");
				} else {
					sb.append("<table class='table table-responsive' style='text-align:center; color:black;'");
					sb.append("<tr><td colspan='2'><img src='resources/upload/" + pf1.getPt_sysname() + "'</td></tr>");
					sb.append("</table>");
				}
			}
			sb.append("<form action='deletePortfolio' method='post' id='portfolio'>");
			sb.append("<input type='hidden' name='pfnum' value=" + pf_num + " />");
			mav.addObject("portfolio", sb.toString());
		}
		view = "LightBox";
		mav.setViewName(view);
		return mav;
	}

	private void goMyProfile() {
		mav = new ModelAndView();
		String view = null;
		if (ss != null && ss.getAttribute("m_id") != null) {
			String m_id = (String) ss.getAttribute("m_id");
			System.out.println("아이디 : " + m_id);
			mav.addObject("member", fDao.getName(m_id));
		}
		view = "profile";
		mav.setViewName(view);
	}

	public ModelAndView execute(int cmd) {
		switch (cmd) {
		case 1:
			likeInsert();
			break;
		}
		return mav;
	}

	private void likeInsert() {
		mav = new ModelAndView();
		String view = null;
		VeryLike vr = new VeryLike();
		System.out.println(fDao.getLikeMaxNum() + 1);
		System.out.println(req.getParameter("getid"));
		System.out.println((String) ss.getAttribute("m_id"));
		int l_num = (fDao.getLikeMaxNum() + 1);
		String l_mgetid = req.getParameter("getid");
		String l_msetid = (String) ss.getAttribute("m_id");
		vr.setL_num(l_num);
		vr.setL_mgetid(l_mgetid);
		vr.setL_msetid(l_msetid);
		if (ss != null && ss.getAttribute("m_id") != null) {
			if (fDao.selectLike(vr) == 0) {
				fDao.insertLike(vr);
			} else if (fDao.selectLike(vr) > 0) {
				fDao.deleteLike(vr);
			}
		}
		System.out.println(fDao.CntLike(l_mgetid));
		mav.addObject("like", fDao.CntLike(l_mgetid));
		view = "redirect:/goFreelancerDetail?m_id=" + l_mgetid;
		mav.setViewName(view);
	}

}
