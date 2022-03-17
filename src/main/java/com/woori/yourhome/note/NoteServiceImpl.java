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

	@Override
	public NoteDto getView(String note_seq) {
		return noteDao.getView(note_seq);
	}

	@Override
	public void update(NoteDto dto) {
		noteDao.update(dto);
	}

	@Override
	public void insert(NoteDto dto) {
		noteDao.insert(dto);
	}

	@Override
	public void delete(String note_seq) {
		noteDao.delete(note_seq);
	}

	@Override
	public void updateHit(String note_seq) {
		noteDao.updateHit(note_seq);
		
	}

}
