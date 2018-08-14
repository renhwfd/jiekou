package com.rxl.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.rxl.bean.Menus;
import com.rxl.bean.Result;
import com.rxl.service.IMenusService;

@Controller
@RequestMapping("/menus")
public class MenusAction {
	@Autowired
	private IMenusService menusService;
	
	
	@RequestMapping("/getMenus")
	@ResponseBody
	public Result getMenus(){
		Result rs = Result.getSuccessResult();
		rs = menusService.queryAll();
		return rs;
	}
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/left")
	public ModelAndView left(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("left");
		return mv;
	}
	@RequestMapping("/right")
	public ModelAndView right(Integer id){
		Menus menus = menusService.queryOne(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("menus", menus);
		mv.setViewName("right");
		return mv;
	}
	@RequestMapping("/update")
	public Result update(Menus menus){
		Result rs = Result.getSuccessResult();
		Integer num = menusService.update(menus);
		if(num!=1){
			rs.setCode("1");
			rs.setError("更新失败!");
		}
		return rs;
	}
}
