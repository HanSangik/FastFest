package com.woori.yourhome.main2;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("main2Service")
public class Main2ServiceImpl implements Main2Service{
	
	@Resource(name="main2Dao")
	Main2Dao main2Dao;

	@Override
	public List<Main2Dto> getList(Main2Dto dto) {
		
		return main2Dao.getList(dto);
	}

	@Override
	public int getTotal(Main2Dto dto) {
		// TODO Auto-generated method stub
		return main2Dao.getTotal(dto);
	}

	@Override
	public void insert(Main2Dto dto) {
		main2Dao.insert(dto);
	}

	@Override
	public void update(Main2Dto dto) {
		main2Dao.update(dto);
	}

	@Override
	public void delete(Main2Dto dto) {
		main2Dao.delete(dto);		
	}

	@Override
	public Main2Dto getView(Main2Dto dto) {
		
		return main2Dao.getView(dto);
	}
	
	@Override
	public void updateLike(int id) throws Exception{
		main2Dao.updateLike(id);
	}
	
	@Override
	public void updateLikeCancel(int id) throws Exception{
		main2Dao.updateLikeCancel(id);
	}

	
	@Override
	public void insertLike(int id,String writer) throws Exception{
		main2Dao.insertLike(id, writer);
	}
	
	@Override
	public void deleteLike(int id,String writer)throws Exception{
		main2Dao.deleteLike(id, writer);
	}
	
	@Override
	public int likeCheck(int id,String writer) throws Exception{
		return main2Dao.likeCheck(id, writer);
	}
	
	@Override
	public void updateLikeCheck(int id,String writer)throws Exception{
		main2Dao.updateLikeCheck(id, writer);
	}
	
	@Override
	public void updateLikeCheckCancel(int id,String writer)throws Exception{
		main2Dao.updateLikeCheckCancel(id, writer);
	}
}
