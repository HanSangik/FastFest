package com.woori.yourhome.free_board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woori.yourhome.board.BoardDto;

@Controller
public class FreeBoardController {

   @Resource(name="freeboardService")
   FreeBoardService service;
   
   @RequestMapping("/freeboard/list")
   String freeboard_list(FreeBoardDto dto, Model model)
   {
	  dto.setStart(dto.getPg()*dto.getPageSize());
	  
      model.addAttribute("boardList", service.getList(dto));
      model.addAttribute("totalCnt", service.getTotal(dto));
      return "/freeboard/freeboard_list";
   }
   
   @RequestMapping("/freeboard/datalist")
   @ResponseBody
   List<FreeBoardDto> freeboard_datalist(FreeBoardDto dto)
   {
      return service.getList(dto);
   }
   
   
   @RequestMapping(value="/freeboard/save",  method=RequestMethod.POST)
   @ResponseBody
   HashMap<String, String> freeboard_save( FreeBoardDto dto)
   {
      if(dto.getGroup_id()==0)
         service.insert(dto);
      else {
         service.insert_reply(dto); //  답글
      }
      
      
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("result", "success");
      return map;
   }
   
   @RequestMapping(value="/freeboard/update",  method=RequestMethod.POST)
   @ResponseBody
   HashMap<String, String> freeboard_update( FreeBoardDto dto)
   {
      service.update(dto);
    
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("result", "success");
      return map;
   }
   
   @RequestMapping("/freeboard/write")
   String freeboard_write(Model model)
   {
      FreeBoardDto dto=new FreeBoardDto();
      model.addAttribute("boardDto", dto);
      
      return "/freeboard/freeboard_write";
   }
   
   
   @RequestMapping("/freeboard/modify")
   String freeboard_modify(Model model, FreeBoardDto dto)
   {
	  System.out.println("---------------111111111----------------" + service.getView(dto));
      

	  model.addAttribute("boardDto", service.getView(dto));
	  model.addAttribute("mode", "");
	  
      return "/freeboard/freeboard_write";
   }
   
   @RequestMapping("/freeboard/view")
   String freeboard_write(FreeBoardDto paramDto, Model model)
   {
	  System.out.println("[FreeBoardController freeboard_write ================]" + paramDto);
      FreeBoardDto dto= service.getView(paramDto);
      
      
      System.out.println("[FreeBoardController freeboard_write ================]" + dto);
      model.addAttribute("boardDto", dto);

      return "/freeboard/freeboard_view";
   }
   
   @RequestMapping("/freeboard/reply")
   String freeboard_reply(FreeBoardDto paramDto, Model model)
   {
      FreeBoardDto dto= service.getView(paramDto);
      
      //dto.setTitle("Re:" + dto.getTitle());
      dto.setSeq("");
      dto.setContents("");
      
      model.addAttribute("boardDto", dto);
      model.addAttribute("mode", "reply");
      
      System.out.println("freeboard_reply------------------>" + dto);
      return "/freeboard/freeboard_write";
   }
   
   @RequestMapping(value="/freeboard/delete")
	String freeboard_delete(FreeBoardDto dto)
	{
		service.delete(dto.getSeq());
		
		return "redirect:/freeboard/list";  //글쓰고나면
	}
   
	@ResponseBody
	@RequestMapping(value = "/freeboard/updateLike" , method = RequestMethod.POST)
	public int updateLike(int seq, String userid)throws Exception{
		
		System.out.println("-----------------------------" + seq + "/" +userid);
		//return 0;
		
		int likeCheck = service.likeCheck(seq, userid);
		if(likeCheck == 0) {
			//좋아요 처음누름
			service.insertLike(seq, userid); //like테이블 삽입
			service.updateLike(seq);	//게시판테이블 +1
			service.updateLikeCheck(seq, userid);//like테이블 구분자 1
		}else if(likeCheck == 1) {
			service.updateLikeCheckCancel(seq, userid); //like테이블 구분자0
           service.updateLikeCancel(seq); //게시판테이블 - 1
			service.deleteLike(seq, userid); //like테이블 삭제
		}
		return likeCheck;
	}
}








