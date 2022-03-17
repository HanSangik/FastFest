package com.woori.yourhome.free_board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("freeboardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Resource(name="freeboardDao")
	FreeBoardDao dao;

	@Override
	public List<FreeBoardDto> getList(FreeBoardDto dto) {
		
		return dao.getList(dto);
	}

	@Override
	public void insert(FreeBoardDto dto) {
		dao.insert(dto);
		
	}

	@Override
	public void insert_reply(FreeBoardDto dto) {
		dao.insert_reply(dto);
	}

	@Override
	public FreeBoardDto getView(FreeBoardDto dto) {
		
		return dao.getView(dto);
	}

	@Override
	public void updateLike(int seq) throws Exception{
		 dao.updateLike(seq);
	}
	
	@Override
	public void updateLikeCancel(int seq) throws Exception{
		dao.updateLikeCancel(seq);
	}

	
	@Override
	public void insertLike(int seq,String userid) throws Exception{
			dao.insertLike(seq, userid);
	}
	
	@Override
	public void deleteLike(int seq,String userid)throws Exception{
			dao.deleteLike(seq, userid);
	}
	
	@Override
	public int likeCheck(int seq,String userid) throws Exception{
		return dao.likeCheck(seq, userid);
	}
	
	@Override
	public void updateLikeCheck(int seq,String userid)throws Exception{
		dao.updateLikeCheck(seq, userid);
	}
	
	@Override
	public void updateLikeCheckCancel(int seq,String userid)throws Exception{
		dao.updateLikeCheckCancel(seq, userid);
	}

	@Override
	public int getTotal(FreeBoardDto dto) {
		return dao.getTotal(dto);
	}

	@Override
	public void delete(String seq) {
		dao.delete(seq);
	}

	@Override
	public void update(FreeBoardDto dto) {
		dao.update(dto);
	}
}
