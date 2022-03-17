package com.woori.yourhome.main2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("main2Dao")
public class Main2DaoImpl implements Main2Dao{

	@Autowired 
	SqlSessionTemplate sm;
	
	
	@Override
	public List<Main2Dto> getList(Main2Dto dto) {
		return sm.selectList("Main2_getList", dto);
	}

	@Override
	public int getTotal(Main2Dto dto) {
		
		return sm.selectOne("Main2_getTotal", dto);
	}

	@Override
	public void insert(Main2Dto dto) {
		sm.insert("Main2_insert", dto);
	}

	@Override
	public void update(Main2Dto dto) {
		sm.update("Main2_update", dto);		
	}

	@Override
	public void delete(Main2Dto dto) {
		sm.delete("Main2_delete", dto);		
	}

	@Override
	public Main2Dto getView(Main2Dto dto) {
		return sm.selectOne("Main2_getView", dto);
	}

	@Override
	public void updateLike(int id) throws Exception{
	 sm.update("Main2.updateLike", id);
	}
	
	@Override
	public void updateLikeCancel(int id) throws Exception{
		 sm.update("Main2.updateLikeCancel", id);

	}

	
	@Override
	public void insertLike(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.insert("Main2.insertLike", map);
	}
	
	@Override
	public void deleteLike(int id,String writer)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.delete("Main2.deleteLike", map);
	}
	
	@Override
	public int likeCheck(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		return sm.selectOne("Main2.likeCheck", map);
	}
	
	@Override
	public void updateLikeCheck(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.update("Main2.updateLikeCheck", map);
		
	}
			
	@Override
	public void updateLikeCheckCancel(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.update("Main2.updateLikeCheckCancel", map);
	}

}
