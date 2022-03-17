package com.woori.yourhome.gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("galleryDao")
public class GalleryDaoImpl implements GalleryDao{

	@Autowired 
	SqlSessionTemplate sm;
	
	
	@Override
	public List<GalleryDto> getList(GalleryDto dto) {
		return sm.selectList("Gallery_getList", dto);
	}

	@Override
	public int getTotal(GalleryDto dto) {
		
		return sm.selectOne("Gallery_getTotal", dto);
	}

	@Override
	public void insert(GalleryDto dto) {
		sm.insert("Gallery_insert", dto);
	}

	@Override
	public void update(GalleryDto dto) {
		sm.update("Gallery_update", dto);		
	}

	@Override
	public void delete(GalleryDto dto) {
		sm.delete("Gallery_delete", dto);		
	}

	@Override
	public GalleryDto getView(GalleryDto dto) {
		return sm.selectOne("Gallery_getView", dto);
	}

	@Override
	public void updateLike(int id) throws Exception{
	 sm.update("Gallery.updateLike", id);
	}
	
	@Override
	public void updateLikeCancel(int id) throws Exception{
		 sm.update("Gallery.updateLikeCancel", id);

	}

	
	@Override
	public void insertLike(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.insert("Gallery.insertLike", map);
	}
	
	@Override
	public void deleteLike(int id,String writer)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.delete("Gallery.deleteLike", map);
	}
	
	@Override
	public int likeCheck(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		return sm.selectOne("Gallery.likeCheck", map);
	}
	
	@Override
	public void updateLikeCheck(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.update("Gallery.updateLikeCheck", map);
		
	}
			
	@Override
	public void updateLikeCheckCancel(int id,String writer) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("id", id);
		sm.update("Gallery.updateLikeCheckCancel", map);
	}

}
