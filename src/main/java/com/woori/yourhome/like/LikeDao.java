package com.woori.yourhome.like;

import java.util.List;




public interface LikeDao {
	void insert(LikeDto dto);
	void delete(LikeDto dto);
	List<LikeDto> getList(LikeDto dto);
	public boolean isDuplicate(LikeDto dto);
}
