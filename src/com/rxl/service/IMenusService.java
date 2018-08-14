package com.rxl.service;

import org.springframework.stereotype.Repository;

import com.rxl.bean.Menus;
import com.rxl.bean.Result;

@Repository
public interface IMenusService {
	Result queryAll();
	Menus queryOne(Integer id);
	Integer update(Menus menus);
}
