package com.woori.yourhome.note;

import java.util.List;

public interface NoteService {

	
	List<NoteDto> getList(NoteDto dto);
	int getTotal(NoteDto dto);
}
