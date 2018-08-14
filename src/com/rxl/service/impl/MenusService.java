package com.rxl.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rxl.bean.Menus;
import com.rxl.bean.Result;
import com.rxl.dao.MenusDao;
import com.rxl.service.IMenusService;
@Service
public class MenusService implements IMenusService {
	@Autowired
	private MenusDao menusDao;
	//查询全部菜单
	@Override
	public Result queryAll() {
		Result rs = Result.getSuccessResult();
		List<Map<String, Object>> list = new ArrayList<>();
		List<Menus> mlist = menusDao.queryAll();
		for (Menus menus : mlist) {
			Map<String, Object> map = new HashMap<>();
			if(menus.getLocal()==0){
				map.put("name", menus.getName());
				map.put("children", dig(mlist,menus.getId()));
				map.put("open", "false");
				map.put("url", "right?id="+menus.getId());
				map.put("target", "right");
				list.add(map);
			}
		}
		rs.setData(list);
		return rs;
	}
	//递归格式化数据
	private List<Map<String, Object>> dig(List<Menus> list, Integer id){
		List<Map<String, Object>> resp = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		for (Menus menus : list) {
			if(menus.getParentid()==id){
				List<Map<String, Object>> childlist = dig(list,menus.getId());
				if(childlist!=null&&childlist.size()>0){
					map.put("open", "false");
					map.put("children", childlist);
				}
					map.put("url", "right?id="+menus.getId());
					map.put("target", "right");
				map.put("name", menus.getName());
				resp.add(map);
			}
		}
		return resp;
	}
	//查询单个菜单
	@Override
	public Menus queryOne(Integer id) {
		Menus menus = menusDao.queryOne(id);
		return menus;
	}
	//更新数据
	@Override
	public Integer update(Menus menus) {
		Integer a = menusDao.update(menus);
		return a;
	}

}
