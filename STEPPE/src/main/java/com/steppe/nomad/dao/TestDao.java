package com.steppe.nomad.dao;

import java.util.List;  

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steppe.nomad.bean.Answer;
import com.steppe.nomad.bean.Result;
import com.steppe.nomad.bean.Test;

@Service
public class TestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Test> getTestList(String t_name) {
		return sqlSession.selectList("test.getTestList", t_name);
	}

	public Test showFstDetail(int t_num) {
		return sqlSession.selectOne("test.showFstDetail",t_num);
	}

	public int getTestMaxNum() {
		return sqlSession.selectOne("test.getTestMaxNum");
	}

	public int insertFst(Test test) {
		return sqlSession.insert("test.insertFst", test);
	}

	public int updateFst(Test test) {
		return sqlSession.update("test.updateFst", test);
	}

	public int deleteAnsNum(int t_num) {
		return sqlSession.delete("test.deleteAnsNum", t_num);
	}
	
	public int deleteFst(int t_num) {
		return sqlSession.delete("test.deleteFst", t_num);
	}

	public int getTestCnt(Answer ans) {
		return sqlSession.selectOne("test.getTestCnt", ans);
	}

	public int getAnswerMaxNum() {
		return sqlSession.selectOne("test.getAnswerMaxNum");
	}

	public int getT_answer(Test test) {
		return sqlSession.selectOne("test.getT_answer", test);
	}

	public int insertAnswer(Answer ans) {
		return sqlSession.insert("test.insertAnswer", ans);
	}

	public List<Test> getFstTest(int t_num) {
		return sqlSession.selectList("test.getFstTest",t_num);
	}

	public int getSum(Answer ans) {
		return sqlSession.selectOne("test.getSum", ans);
	}

	public int deleteAnswer(Answer ans) {
		return sqlSession.delete("test.deleteAnswer", ans);
	}

	public int getResultMaxNum() {
		return sqlSession.selectOne("test.getResultMaxNum");
	}

	public int insertResult(Result res) {
		return sqlSession.insert("test.insertResult", res);
	}

	public int selectResult(Result res) {
		return sqlSession.selectOne("test.selectResult", res);
	}

	public int updateResult(Result res) {
		return sqlSession.update("test.updateResult", res);
	}

	public List<Result> findName(Result res) {
		return sqlSession.selectList("test.findName",res);
	}

	
}
