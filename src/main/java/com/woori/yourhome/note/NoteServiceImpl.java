package com.woori.yourhome.note;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noteService")
public class NoteServiceImpl implements NoteService{

	@Autowired
	@Resource(name="noteDao")
	NoteDao noteDao;

	@Override
	public List<NoteDto> getList(NoteDto dto) {
		return noteDao.getList(dto);
	}
	
	@Override
	public int getTotal(NoteDto dto) {
		
		return noteDao.getTotal(dto);
	}

}
