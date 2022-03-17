package com.woori.yourhome.like;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woori.yourhome.gallery.GalleryDto;

@Controller
public class LikeController {
	
	@Resource(name="likeDao")
	LikeDao dao;
	
	
	@RequestMapping(value="/like/list", method=RequestMethod.GET)
	String board_list(Model model, HttpServletRequest request, LikeDto dto)
	{
		
//		System.out.println("선택 : " + dto.getKey());
//		System.out.println("검색어 : " + dto.getKeyword());
//	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		
		List<LikeDto> list = dao.getList(dto);
				
//		for(BoardDto tempDto : list)
//		{
//			System.out.println(tempDto.getTitle());
//		}
		
		model.addAttribute("likeList", list);
		model.addAttribute("totalCnt", list.size());
		
		
		return "like/like_list"; //jsp파일명
	}
	
	
	
	
	@RequestMapping("/gallery/like")
	@ResponseBody
	public HashMap<String, String> gallery_like(String userSeq, String board_id)
	{
		System.out.println("userid = "+userSeq +"\n boardid = "+board_id);
		LikeDto dto = new LikeDto();
		dto.setLike_boardId(board_id);
		dto.setLike_boardType("2");
		//dto.setLike_boardType("1");
		dto.setLike_userId(userSeq);
		
		dao.insert(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/like/isDuplicate")
	@ResponseBody  //Ajax요청시 데이타가 출력되야 한다.jsp 이동을 막는다 
	               //자바객체를  json 형태로 전환시켜서 반환한다 
	public HashMap<String, String> like_isDuplicate(LikeDto dto)
	{
		//System.out.println("like_isDuplicate------" + dto.getLike_boardId() + dto.getLike_boardType() + dto.getLike_userId());
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result",dao.isDuplicate(dto)+"");
		
		return map;
	}
	
	@RequestMapping("/gallery/unlike")
	@ResponseBody
	public HashMap<String, String> gallery_delete(String userSeq, String board_id)
	{
		System.out.println("------delete-----\nuserid = "+userSeq +"\n boardid = "+board_id);
		LikeDto dto = new LikeDto();
		dto.setLike_boardId(board_id);
		dto.setLike_boardType("2");
		dto.setLike_userId(userSeq);
		
		dao.delete(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/freeboard/like")
	@ResponseBody
	public HashMap<String, String> freeboard_like(String userSeq, String board_id)
	{
		System.out.println("userid = "+userSeq +"\n boardid = "+board_id);
		LikeDto dto = new LikeDto();
		dto.setLike_boardId(board_id);
		dto.setLike_boardType("1");
		//dto.setLike_boardType("1");
		dto.setLike_userId(userSeq);
		
		dao.insert(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/freeboard/unlike")
	@ResponseBody
	public HashMap<String, String> freeboard_delete(String userSeq, String board_id)
	{
		System.out.println("------delete-----\nuserid = "+userSeq +"\n boardid = "+board_id);
		LikeDto dto = new LikeDto();
		dto.setLike_boardId(board_id);
		dto.setLike_boardType("1");
		dto.setLike_userId(userSeq);
		
		dao.delete(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		return map;
	}
	
}
