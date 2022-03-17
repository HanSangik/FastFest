package com.woori.yourhome.comment2;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("comment2Dao")
public class Comment2DaoImpl implements Comment2Dao{

	@Autowired 
	SqlSessionTemplate sm;
	
	@Override
	public List<Comment2Dto> getList(Comment2Dto dto) {
		return sm.selectList("Comment2_getList", dto);
	}

	@Override
	public void insert(Comment2Dto dto) {
		sm.insert("Comment2_insert", dto);
	}

	@Override
	public Comment2Dto comment_getView(Comment2Dto dto) {
		
		return sm.selectOne("Comment2_getView", dto);
	}

	@Override
	public void comment_update(Comment2Dto dto) {
		sm.update("Comment2_update", dto);
	}

	@Override
	public void comment_delete(Comment2Dto dto) {
		sm.delete("Comment2_delete", dto);		
	}

}




