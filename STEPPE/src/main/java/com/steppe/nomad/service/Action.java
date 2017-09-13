package com.steppe.nomad.service;

import org.springframework.web.servlet.ModelAndView;

import com.steppe.nomad.bean.Test;

public interface Action {
	public ModelAndView execute(int cmd); //BoardMM구현
	public ModelAndView execute(Test test, int cmd); //MemberMM구현
}
