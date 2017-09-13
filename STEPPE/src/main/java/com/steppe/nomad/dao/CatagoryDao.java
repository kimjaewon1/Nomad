package com.steppe.nomad.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steppe.nomad.bean.Catagory;
import com.steppe.nomad.bean.Required_Skill;
@Repository 
public class CatagoryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Catagory> getCatagorycList1() {
		return sqlSession.selectList("catagory.getCatagorycList1");
	}

	public List<Catagory> getCatagorycList21() {
		return sqlSession.selectList("catagory.getCatagorycList21");
	}

	public List<Catagory> getCatagorycList22() {
		return sqlSession.selectList("catagory.getCatagorycList22");
	}

	
	

}
