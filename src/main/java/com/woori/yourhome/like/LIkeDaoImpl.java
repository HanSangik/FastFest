package com.woori.yourhome.like;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("likeDao")
public class LIkeDaoImpl implements LikeDao{
	
	@Autowired 
	SqlSessionTemplate sm;
	
	@Override
	public void insert(LikeDto dto) {
		// TODO Auto-generated method stub
		sm.insert("Like_insert", dto);
	}

	@Override
	public void delete(LikeDto dto) {
		// TODO Auto-generated method stub
		sm.delete("Like_delete", dto);
	}

	@Override
	public List<LikeDto> getList(LikeDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Like_getList", dto);
	}

	@Override
	public boolean isDuplicate(LikeDto dto) {
		int cnt = sm.selectOne("Like_isduplicate", dto);
		if(cnt==0)
			return false; //중복아님, 사용가능한 아이디임  
		else
			return true; //이미 사용중임 
	}

}
