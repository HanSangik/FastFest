package com.woori.yourhome.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woori.yourhome.comment.CommentDto;
import com.woori.yourhome.comment2.Comment2Dto;

@Controller 
public class BoardController {

	//@Autowired
	@Resource(name="boardService")
	BoardService service;
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	String board_list(Model model, BoardDto dto)
	{
		
//		System.out.println("선택 : " + dto.getKey());
//		System.out.println("검색어 : " + dto.getKeyword());
//		
		dto.setStart( dto.getPg()*10); 
		
		List<BoardDto> list = service.getList(dto);
		
		
//		for(BoardDto tempDto : list)
//		{
//			System.out.println(tempDto.getTitle());
//		}
		
		model.addAttribute("boardList", list);
		model.addAttribute("totalCnt", service.getTotal(dto));
		
		return "board/board_list"; //jsp파일명
	}
	
	//  /board/view?id=1
	@RequestMapping(value="/board/view", method=RequestMethod.GET)
	String board_view(String id, Model model)
	{
		BoardDto dto = service.getView(id);
		model.addAttribute("boardDto", dto);
		return "board/board_view";
	}
	
	
	@RequestMapping(value="/board/write")
	String board_write(Model model)
	{
		model.addAttribute("boardDto", new BoardDto()); 
		return "board/board_write";
	}
	
	@RequestMapping(value="/board/save")
	String board_save(BoardDto dto)
	{
		
		if( dto.getId().equals(""))
			service.insert(dto);
		else 
			service.update(dto);
		
		return "redirect:/board/list";  //글쓰고나면
	}

	@RequestMapping(value="/board/delete")
	String board_delete(BoardDto dto)
	{
		service.delete(dto.getId());
		
		return "redirect:/board/list";  //글쓰고나면
	}
	
	@RequestMapping(value="/board/modify")
	String board_modify(BoardDto dto, Model model)
	{
		model.addAttribute("boardDto", service.getView(dto.getId()) );
		
		return "board/board_write"; //write.jsp 로 이동한다 
	}
	
	
	@RequestMapping(value="/comment/write")
	@ResponseBody
	HashMap<String, String> comment_write(CommentDto dto)
	{
		System.out.println("comment_id : " + dto.getComment_id());
		if( dto.getComment_id().equals(""))
			service.comment_insert(dto);
		else
			service.comment_update(dto);
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}
	
	@RequestMapping(value="/comment/list")
	@ResponseBody
	List<CommentDto> comment_list(CommentDto dto)
	{
		System.out.println("board_id : " + dto.getBoard_id());
		List<CommentDto> list = service.getCommentList(dto);
		return list; 
	}
	
	
	@RequestMapping(value="/comment/getView")
	@ResponseBody
	CommentDto comment_getView(CommentDto dto)
	{
		System.out.println("id : " + dto.getId());
		CommentDto resultDto = service.getCommentView(dto);
		return resultDto; 
	}
	

	@RequestMapping(value="/comment/delete")
	@ResponseBody
	HashMap<String, String> comment_delete(CommentDto dto)
	{
		service.comment_delete(dto);
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}	
	
	
	
	@RequestMapping(value="/comment2/write")
	@ResponseBody
	HashMap<String, String> comment2_write(Comment2Dto dto)
	{
		System.out.println("comment_id : " + dto.getComment_id());
		if( dto.getComment_id().equals(""))
			service.comment2_insert(dto);
		else
			service.comment2_update(dto);
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}
	
	@RequestMapping(value="/comment2/list")
	@ResponseBody
	List<Comment2Dto> comment2_list(Comment2Dto dto)
	{
		System.out.println("board_id : " + dto.getBoard_id());
		List<Comment2Dto> list = service.getComment2List(dto);
		return list; 
	}
	
	
	@RequestMapping(value="/comment2/getView")
	@ResponseBody
	Comment2Dto comment2_getView(Comment2Dto dto)
	{
		System.out.println("id : " + dto.getId());
		Comment2Dto resultDto = service.getComment2View(dto);
		return resultDto; 
	}
	

	@RequestMapping(value="/comment2/delete")
	@ResponseBody
	HashMap<String, String> comment2_delete(Comment2Dto dto)
	{
		service.comment2_delete(dto);
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}	
	
}



















