package com.steppe.nomad.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steppe.nomad.bean.Chat;
@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int chatSubmit(Map<String, String> map){
		return sqlSession.insert("chat.chatSubmit", map);
	}
	public List<Chat> getTenList(Map<String, String> map){		
		return sqlSession.selectList("chat.getTenList", map);
	}
	public int chatMaxNum(){
		return sqlSession.selectOne("chat.chatMaxNum");
	}
	public int chatCount(){
		return sqlSession.selectOne("chat.chatCount");
	}
	public List<Chat> getChatList(Map<String, String> map) {
		return sqlSession.selectList("chat.getChatList", map);
	}
}
