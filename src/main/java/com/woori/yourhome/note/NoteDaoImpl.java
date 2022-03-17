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

	@Override
	public NoteDto getView(String note_seq) {
		return sm.selectOne("Note_getView", note_seq);
	}

	@Override
	public void update(NoteDto dto) {
		sm.update("Note_update", dto);
	}

	@Override
	public void insert(NoteDto dto) {
		sm.insert("Note_insert", dto);
	}

	@Override
	public void delete(String note_seq) {
		sm.delete("Note_delete", note_seq);
	}

	@Override
	public void updateHit(String note_seq) {
		sm.update("Note_update_hit", note_seq);
		
	}
	
	

}
