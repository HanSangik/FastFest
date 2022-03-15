package com.woori.yourhome.note;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noteDao")	//없으면 스프링이 이거 보고 객체를 못 만듬.
public class NoteDaoImpl implements NoteDao{

	
	@Autowired
	SqlSessionTemplate sm;	//sm객체를 통해서 디비 데이터를 읽고 쓰기.
	
	@Override
	public List<NoteDto> getList(NoteDto dto) {

		return sm.selectList("Note_getList", dto);
	}

	@Override
	public int getTotal(NoteDto dto) {
		return sm.selectOne("Note_getTotal",dto);
	}
	
	

}
