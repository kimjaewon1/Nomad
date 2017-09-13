package com.steppe.nomad.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steppe.nomad.bean.Accounting;
import com.steppe.nomad.bean.Member;
import com.steppe.nomad.bean.Notice;
@Repository
public class AdminDao {

	//마이바티스 설정
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int noticeInsert(Notice notice) {
		return sqlSession.insert("notice.insertNotice",notice);
	}

	public int getNoticeMaxNum(Notice notice) {
		return sqlSession.selectOne("notice.getNoticeMaxNum",notice);
	}

	public List<Notice> getNoticeList(int pageNum) {
		return sqlSession.selectList("notice.getNoticeList",pageNum);
		
	}
	
	public List<Notice> getNoticeDetail(int nnum) {
		return sqlSession.selectList("notice.getNoticeDetail",nnum);
		
	}

	public int getNoticeCount() {
		return sqlSession.selectOne("notice.getNoticeCount");
	}

	public String getName(String id) {
		return sqlSession.selectOne("notice.getName",id);
	}

	public int noticeDelete(int nnum) {
		return sqlSession.delete("notice.noticeDelete",nnum);
		
	}
	public int noticeUpdate(Notice notice) {
		return sqlSession.update("notice.noticeUpdate",notice);
		
	}

	public int projectDelete(int pnum) {
		return sqlSession.delete("project.projectDelete",pnum);
		
	}

	public int getPurchaseCount() {
		return sqlSession.selectOne("accounting.getPurchaseCount");
	}

	public int getPperson(int pnum) {
		return sqlSession.selectOne("project.getPperson",pnum);
	}
	
	public double purchaseCommission(Accounting acc) {
		return sqlSession.insert("accounting.purchaseCommission",acc);
		
	}
	
	public double purchaseDeposit(Accounting acc) {
		return sqlSession.insert("accounting.purchaseDeposit",acc);
		
	}
	
	public double purchaseHold(Accounting acc) {
		return sqlSession.insert("accounting.purchaseHold",acc);
		
	}

	public Accounting getHoldMoney(int pnum) {
		return sqlSession.selectOne("accounting.getHoldMoney",pnum);
	}

}
