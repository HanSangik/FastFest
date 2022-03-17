package com.woori.yourhome.main2;

import java.util.List;

public interface Main2Dao {
	List<Main2Dto> getList(Main2Dto dto);
	int getTotal(Main2Dto dto);
	void insert(Main2Dto dto );
	void update(Main2Dto dto );
	void delete(Main2Dto dto );
	Main2Dto getView(Main2Dto dto);
	//void update_likehi
	void updateLike(int id) throws Exception;
	void updateLikeCancel(int id) throws Exception;
	void insertLike(int id, String writer) throws Exception;
	void deleteLike(int id, String writer) throws Exception;
	int likeCheck(int id, String writer) throws Exception;
	void updateLikeCheck(int id, String writer) throws Exception;
	void updateLikeCheckCancel(int id, String writer) throws Exception;
}
