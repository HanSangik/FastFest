package com.woori.yourhome.main;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woori.yourhome.main2.Main2Dto;
import com.woori.yourhome.main2.Main2Service;

@Controller
public class MainController {

   @Resource(name="MainService")
   MainService service;
   
   @Resource(name="main2Service")
   Main2Service service2;
   
   @RequestMapping("/")
   String Main_list(MainDto dto, Model model, HttpServletRequest request, Main2Dto dto2)
   {
	 
	   dto.setPageSize(6);
	      dto.setStart(0);
      model.addAttribute("mainList", service.getList(dto));
      //model.addAttribute("mainList", service.getList(dto));
      
      
      dto2.setPageSize(4);
      dto2.setStart(0);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		dto2.setUserSeq(id);
		
		List<Main2Dto> list = service2.getList(dto2);

		
		model.addAttribute("main2List", list);
		
    
      
      return "/home";
   }
   
  
   
   }



