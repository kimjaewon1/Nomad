package com.steppe.nomad.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steppe.nomad.bean.Project_bookmark;

@Repository
public class Project_bookmarkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int bookmarkInsert(Map<String, String> bmMap){
		return sqlSession.insert("project_bookmark.bookmarkInsert", bmMap);
	}

	public List<Project_bookmark> allBookmarkList(){
		return sqlSession.selectList("project_bookmark.allBookmarkList");
	}
	public List<Project_bookmark> bookmarkList(String mid){
		return sqlSession.selectList("project_bookmark.bookmarkList", mid);
	}
	public int bookmarkUpdate(Map<String, String> map){
		return sqlSession.update("project_bookmark.bookmarkUpdate",map);
	}
	public Project_bookmark bookmarkFlag(int pb_pnum){
		return sqlSession.selectOne("project_bookmark.bookmarkFlag", pb_pnum);
	}
	public List<Project_bookmark> offBookmarkList(){
		return sqlSession.selectList("project_bookmark.offBookmarkList");
	}
	public int bookmarkCount(){
		return sqlSession.selectOne("project_bookmark.bookmarkCount");
	}
	public int bookmarkMaxNum(){
		return sqlSession.selectOne("project_bookmark.bookmarkMaxNum");
	}

	public Project_bookmark bookmarkSelect(Map<String, String> map) {
		return sqlSession.selectOne("project_bookmark.bookmarkSelect", map);
	}

}
