package com.woori.yourhome.note;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woori.yourhome.board.BoardDto;

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
	
	@RequestMapping(value="/note/view", method=RequestMethod.GET)
	String note_view(String note_seq, Model model)
	{
		System.out.println("note_view-------------" + note_seq);
		
		service.updateHit(note_seq);		/////////
		
		NoteDto dto = service.getView(note_seq);
		model.addAttribute("noteDto", dto);
		
		
		return "note/note_view";
	}
	
	@RequestMapping(value="/note/write")
	String note_write(Model model)
	{
		model.addAttribute("noteDto", new NoteDto());
		return "note/note_write";
	}
	
	@RequestMapping(value="/note/save")
	String note_save(NoteDto dto)
	{
		if( dto.getNote_seq().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/note/list";	//글쓰고 리스트 리다이렉트
	}
	
	@RequestMapping(value="/note/delete")
	String note_delete(NoteDto dto)
	{
		service.delete(dto.getNote_seq());
		
		return "redirect:/note/list";	//글쓰고 리스트 리다이렉트
	}
	

	@RequestMapping(value="/note/modify")
	String note_modify(NoteDto dto, Model model)
	{
		model.addAttribute("noteDto", service.getView(dto.getNote_seq()) );
		
		return "note/note_write"; //write.jsp 로 이동한다 
	}
}
