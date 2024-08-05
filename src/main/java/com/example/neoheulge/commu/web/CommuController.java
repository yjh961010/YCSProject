package com.example.neoheulge.commu.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.neoheulge.commu.service.CommuService;
import com.example.neoheulge.dto.CommuDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/commu")
public class CommuController {

	@Autowired
	CommuService commuService;
	
	
	
	@GetMapping("/commuList.do")
	public String commuList(HttpServletRequest req) {
		List<CommuDTO> list = commuService.commuList();
		req.setAttribute("commuList", list);
		return "commu/commuList";
	}
	
	@GetMapping("/commuWrite.do")
	public String commuWriteForm(HttpServletRequest req, 
			@RequestParam(value = "id", required = false, defaultValue = "0") Integer id) {
		
		 CommuDTO dto = new CommuDTO();
			if(id !=0) {
			 dto = commuService.getCommu(id);
			}else{
				dto.setId(0);
		        dto.setRe_step(0);
		        dto.setRe_level(0);
			}
			req.setAttribute("getCommu",dto);
			return "commu/commuWrite";
		
	}
	
	@PostMapping("/commuWrite.do")
	public String commuWrite(HttpServletRequest req, CommuDTO dto) {
		
		 if (dto.getId() == 0) {    // 새 글인 경우
			 commuService.commuNewSetp(dto.getId());
		        dto.setRe_step(0);
		        dto.setRe_level(0);
		    } else {                    // 답글인 경우
		    	commuService.commuReStep(dto.getRe_step());
		        dto.setRe_step(dto.getRe_step() + 1);
		        dto.setRe_level(dto.getRe_level() + 1);
		    }

		
		int res = commuService.commuWrite(dto);
		return "redirect:commuList.do";
	}
	
	@GetMapping("/commuContent.do")
	public String content(HttpServletRequest req, int id) {
		int res = commuService.commuViews(id);
		CommuDTO dto = commuService.getCommu(id);
		req.setAttribute("getCommu",dto);

		return "commu/commuContent";
	}
	
	@RequestMapping("/commuDelete.do")
	public String commuDelete(HttpServletRequest req, int id) {
		int res = commuService.commuDelete(id);
		return "redirect:commuList.do";
	}

	@GetMapping("/commuUpdate.do")
	public String commuUpdateForm(HttpServletRequest req, int id) {
		CommuDTO dto = commuService.getCommu(id);
		req.setAttribute("getCommu", dto);
		return "commu/commuUpdate";
	}
	
	@PostMapping("/commuUpdate.do")
	public String commuUpdate(@ModelAttribute CommuDTO dto, BindingResult result) {
		if (result.hasErrors()) {	//만약에 dto객체를 만드는 중 오류가 발생했다면.. 
			//여기는 오류를 내가 알아서 해결하는 코드
			dto.setId(0);
		}
		int res = commuService.commuUpdate(dto);
		return "redirect:commuList.do";

	}
}
