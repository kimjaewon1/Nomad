package com.steppe.nomad.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.steppe.nomad.bean.Volunteer;

@Repository
public class VolunteerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Volunteer> showApplyList(int p_num) {
		return sqlSession.selectList("volunteer.showApplyList",p_num);
	}
	
	public int checkVolunteerList(Volunteer volunteer) {
		return sqlSession.selectOne("volunteer.checkVolunteerList", volunteer);
	}
	
	public int UpdateVolunteer(int v_pnum) {
		System.out.println("DAO확인");
		return sqlSession.update("volunteer.UpdateVolunteer",v_pnum);

	}

	public List<Volunteer> chatRoomList(String mid) {
		return sqlSession.selectList("volunteer.chatRoomList",mid);
	}

	public int volunteerCheck(String p_mid) {
		return sqlSession.selectOne("volunteer.volunteerCheck",p_mid);
	}

	public int getPerson(int v_pnum) {
		return sqlSession.selectOne("volunteer.getPerson",v_pnum);
	}
	
	public List<Volunteer> getVolunteerList(int v_pnum) {//라이트 박스에서 띄우기 위한 지원자 리스트
		return sqlSession.selectList("volunteer.getVolunteerList",v_pnum);
	}

	public int insertVolunteer(Volunteer volunteer) {
		return sqlSession.insert("volunteer.insertVolunteer",volunteer);
	}

	public int getVolunteerMaxNum() {
		return sqlSession.selectOne("volunteer.getVolunteerMaxNum");
	}
	
	public int updateBid(Volunteer volunteer){
		return sqlSession.update("volunteer.updateBid",volunteer);
	}


	public int deleteVolunteer(Volunteer vl) {//지원자 삭제
		System.out.println(vl.getV_mid());
		System.out.println(vl.getV_pnum());
		return sqlSession.delete("volunteer.deleteVolunteer",vl);
	}

	public List<Volunteer> showApplyList2(Volunteer vL) {
		return sqlSession.selectList("volunteer.showApplyList2",vL);
	}
}
