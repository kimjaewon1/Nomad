package com.steppe.nomad.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steppe.nomad.bean.Evaluate;

@Repository
public class ClientDao {
	//마이바티스 설정
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String getSenderEmail(String sender) {
		return sqlSession.selectOne("client.getSenderEmail",sender);
	}
	public String getReciverEmail(String reciver) {
		return sqlSession.selectOne("client.getReciverEmail",reciver);
	}
	public int insertProjectEvaluate(Evaluate eva) {
		return sqlSession.insert("evaluate.insertProjectEvaluate",eva);
	}
	public int getEVMaxNum() {
		return sqlSession.selectOne("evaluate.getEVMaxNum");
	}
	public int getEVCount() {
		return sqlSession.selectOne("evaluate.getEVCount");
	}
}
