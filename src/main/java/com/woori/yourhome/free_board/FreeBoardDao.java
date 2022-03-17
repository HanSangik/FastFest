package com.woori.yourhome.free_board;

import java.util.List;

public interface FreeBoardDao {
	List<FreeBoardDto> getList(FreeBoardDto dto);
	void insert(FreeBoardDto dto);
	void insert_reply(FreeBoardDto dto);
	FreeBoardDto getView(FreeBoardDto dto);
	//void update_likehi
	void updateLike(int seq) throws Exception;
	void updateLikeCancel(int seq) throws Exception;
	void insertLike(int seq, String userid) throws Exception;
	void deleteLike(int seq, String userid) throws Exception;
	int likeCheck(int seq, String userid) throws Exception;
	void updateLikeCheck(int seq, String userid) throws Exception;
	void updateLikeCheckCancel(int seq, String userid) throws Exception;
	int getTotal(FreeBoardDto dto);
	void delete(String seq);
	void update(FreeBoardDto dto);
}
