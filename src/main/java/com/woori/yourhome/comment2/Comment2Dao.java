package com.woori.yourhome.comment2;

import java.util.List;

public interface Comment2Dao {
	List<Comment2Dto> getList(Comment2Dto dto);
	void insert(Comment2Dto dto);
	Comment2Dto comment_getView(Comment2Dto dto);
	void comment_update(Comment2Dto dto);
	void comment_delete(Comment2Dto dto);
}
