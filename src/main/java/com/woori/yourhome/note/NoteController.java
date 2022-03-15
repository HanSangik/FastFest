package com.woori.yourhome.note;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoteController {
	@Resource(name="noteService")
	NoteService service;
	
	@RequestMapping(value="/note/list", method=RequestMethod.GET)
	String note_list(Model model, NoteDto dto)
	{
		dto.setStart(dto.getPg()*10);
		
		List<NoteDto> list = service.getList(dto);
		
		model.addAttribute("noteList", list);
		model.addAttribute("totalCnt", service.getTotal(dto));
		
		return "note/note_list";	//jsp파일명
	}
}
