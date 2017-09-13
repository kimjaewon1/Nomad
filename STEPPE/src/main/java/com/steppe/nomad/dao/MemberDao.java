package com.steppe.nomad.dao;

import java.util.List; 
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.steppe.nomad.bean.Member;
import com.steppe.nomad.bean.Notice;


@Repository 
public class MemberDao {

	//마이바티스 설정
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public String getId(Member member) {
		return sqlSession.selectOne("member.getId", member);
	}
	
	public String getPwds(Member member) {
		return sqlSession.selectOne("member.getPwds", member);
	}

	public String isId(String id) {
		return sqlSession.selectOne("member.isId", id);
	}
	public String isName(String name) {
		return sqlSession.selectOne("member.isName", name);
	}
	
	public String isEmail(String email) {
		System.out.println("MemberDao email="+email);
		return sqlSession.selectOne("member.isEmail", email);
	}
	
	public int getLoginResult(Member mb) { //id, pw 넘김

		return sqlSession.selectOne("member.getLoginResult",mb);
	}
	public Member getMemberInfo(String m_id) {//로그인한 사람의 모든 정보를 가져온다

		return sqlSession.selectOne("member.getMemberInfo",m_id);
	}
	public String getPwd(String m_id) {

		return sqlSession.selectOne("member.getPwd",m_id);
	}

	@Transactional
	public int memberInsert(Member member, Map<String, String> fMap) {
		//게시판 테이블에 글을 입력
		int m = memberInsert(member);
		//파일 테이블에 파일을 입력
		int mfnum = getMFMaxNum()+1;
		System.out.println("mfnum="+mfnum);
		String id = member.getM_id();
		System.out.println("id="+id);
		fMap.put("mfnum", String.valueOf(mfnum));
		fMap.put("id", id);
		int f = fileInsert(fMap);

		if(m!=0 && f!=0){
			return 1; //Transactional 성공시
		}return 0; //Transactional 실패시 


	}

	private int getMFMaxNum() {
		return sqlSession.selectOne("member.getMFMaxNum");
	}

	private int fileInsert(Map<String, String> fMap) {
		return sqlSession.insert("member.fileInsert",fMap);
	}

	public int memberInsert(Member member) {
		System.out.println("m_id = " + member.getM_id());
		int result = sqlSession.insert("member.memberInsert",member);
		System.out.println("result="+result);
		return result;

	}
	public String getKind(String m_id) {

		return sqlSession.selectOne("member.getKind",m_id);

	}

	public void updateInfo(Member member, Map<String,String> map){
		System.out.println("실행");
		String m_pw = member.getM_pw();
		String m_name = member.getM_name();
		String m_id = member.getM_id();
		String m_email = member.getM_email();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		updateMemberInfo(member);
		updateMFile(map);
		
	}
	public int updateMemberInfo(Member member){
		return sqlSession.update("member.updateMemberInfo", member);
	}
	public int updateMFile(Map<String,String> map){
		return sqlSession.update("member.updateMFile", map);
	}
	public List<Member> getMemberList(int pageNum) {
		return sqlSession.selectList("member.getMemberList",pageNum);
	}

	public int addBlackList(String m_id) {
		return sqlSession.update("member.addBlackList", m_id);		
	}

	public List<Member> getBlackList(int pageNum) {
		return sqlSession.selectList("member.getBlackList",pageNum);
	}

	public int goBlackUpdate(String m_id) {
		return sqlSession.update("member.goBlackUpdate", m_id);

	}

	public List<Member> getClientList(int pageNum) {
		return sqlSession.selectList("member.getClientList",pageNum);
	}

	public List<Member> getFreeLancerList(int pageNum) {
		return sqlSession.selectList("member.getFreeLancerList",pageNum);
	}

	public List<Member> getSearchResult(String keyword) {
		return sqlSession.selectList("member.getSearchResult", keyword);
	}

	public int memberDelete(String m_id) {
		return sqlSession.delete("member.memberDelete",m_id);
		
	}

	public int getMemberCount() {
		return sqlSession.selectOne("member.getMemberCount");
	}
	public int getMemberCLCount() {
		return sqlSession.selectOne("member.getMemberCLCount");
	}
	public int getMemberFRCount() {
		return sqlSession.selectOne("member.getMemberFRCount");
	}

	public String CheckPw(String m_id) {
		return sqlSession.selectOne("member.CheckPw",m_id);
	}

	public int deleteMemberMake(String m_id) {
		return sqlSession.delete("member.deleteMemberMake",m_id);
		
	}
	public String getStatus(String m_id) {
		return sqlSession.selectOne("member.getStatus", m_id);
	}

}
