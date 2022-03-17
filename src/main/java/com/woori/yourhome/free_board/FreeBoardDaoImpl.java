package com.woori.yourhome.free_board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("freeboardDao")
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<FreeBoardDto> getList(FreeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("FreeBoard_getList", dto);
	}

	@Override
	public void insert(FreeBoardDto dto) {
		sm.insert("FreeBoard_insert", dto);
	}

	@Override
	public void insert_reply(FreeBoardDto dto) {
		sm.update("FreeBoard_updateLevel", dto);
		sm.insert("FreeBoard_reply", dto);
	}

	@Override
	public FreeBoardDto getView(FreeBoardDto dto) {

		return sm.selectOne("FreeBoard_getView", dto);
	}

	@Override
	public void updateLike(int seq) throws Exception{
	 sm.update("FreeBoard.updateLike", seq);
	}
	
	@Override
	public void updateLikeCancel(int seq) throws Exception{
		 sm.update("FreeBoard.updateLikeCancel", seq);

	}

	
	@Override
	public void insertLike(int seq,String userid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("seq", seq);
		sm.insert("FreeBoard.insertLike", map);
	}
	
	@Override
	public void deleteLike(int seq,String userid)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("seq", seq);
		sm.delete("FreeBoard.deleteLike", map);
	}
	
	@Override
	public int likeCheck(int seq,String userid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("seq", seq);
		return sm.selectOne("FreeBoard.likeCheck", map);
	}
	
	@Override
	public void updateLikeCheck(int seq,String userid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("seq", seq);
		sm.update("FreeBoard.updateLikeCheck", map);
		
	}
			
	@Override
	public void updateLikeCheckCancel(int seq,String userid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("seq", seq);
		sm.update("FreeBoard.updateLikeCheckCancel", map);
	}

	@Override
	public int getTotal(FreeBoardDto dto) {
		
		return sm.selectOne("FreeBoard_getTotal", dto);
	}

	@Override
	public void delete(String seq) {
		sm.delete("FreeBoard_delete", seq);
	}

	@Override
	public void update(FreeBoardDto dto) {
		sm.update("FreeBoard_update", dto);
	}
	

}
