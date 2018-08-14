package com.rxl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rxl.bean.Menus;

@Repository
public interface MenusDao {

	List<Menus> queryAll();
	Menus queryOne(Integer id);
	Integer update(Menus menus);
}
