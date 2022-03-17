package com.woori.yourhome.note;

import java.util.List;

public interface NoteDao {
	
	List<NoteDto> getList(NoteDto dto);
	int getTotal(NoteDto dto);
	NoteDto getView(String note_seq);
	void update(NoteDto dto);
	void insert(NoteDto dto);
	void delete(String note_seq);
	void updateHit(String note_seq);

}
