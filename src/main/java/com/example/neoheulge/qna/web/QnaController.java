package com.example.neoheulge.qna.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.neoheulge.dto.QnaDTO;
import com.example.neoheulge.qna.service.QnaService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@GetMapping("/qnaList.do")
	public String qnaList(HttpServletRequest req) {
		List<QnaDTO> list = qnaService.qnaList();
		req.setAttribute("qnaList", list);
		return "qna/qnaList";
	}
	
	@GetMapping("/qnaWrite.do")
	public String qnaWriteForm(HttpServletRequest req, 
			@RequestParam(value = "id", required = false, defaultValue = "0") Integer id) {
		
		 QnaDTO dto = new QnaDTO();
			if(id !=0) {
			 dto = qnaService.getQna(id);
			}else{
				dto.setId(0);
		        dto.setRe_step(0);
		        dto.setRe_level(0);
			}
			req.setAttribute("getQna",dto);
			return "qna/qnaWrite";
		
	}
	
	@PostMapping("/qnaWrite.do")
	public String qnaWrite(HttpServletRequest req, QnaDTO dto) {
		
		 if (dto.getId() == 0) {    // 새 글인 경우
			 qnaService.qnaNewSetp(dto.getId());
		        dto.setRe_step(0);
		        dto.setRe_level(0);
		    } else {                    // 답글인 경우
		    	qnaService.qnaReStep(dto.getRe_step());
		        dto.setRe_step(dto.getRe_step() + 1);
		        dto.setRe_level(dto.getRe_level() + 1);
		    }

		
		int res = qnaService.qnaWrite(dto);
		return "redirect:qnaList.do";
	}
	
	@GetMapping("/qnaContent.do")
	public String content(HttpServletRequest req, int id) {
		int res = qnaService.qnaViews(id);
		QnaDTO dto = qnaService.getQna(id);
		req.setAttribute("getQna",dto);

		return "qna/qnaContent";
	}
	
	@RequestMapping("/qnaDelete.do")
	public String qnaDelete(HttpServletRequest req, int id) {
		int res = qnaService.qnaDelete(id);
		return "redirect:qnaList.do";
	}

	@GetMapping("/qnaUpdate.do")
	public String qnaUpdateForm(HttpServletRequest req, int id) {
		QnaDTO dto = qnaService.getQna(id);
		req.setAttribute("getQna", dto);
		return "qna/qnaUpdate";
	}
	
	@PostMapping("/qnaUpdate.do")
	public String qnaUpdate(@ModelAttribute QnaDTO dto, BindingResult result) {
		if (result.hasErrors()) {	//만약에 dto객체를 만드는 중 오류가 발생했다면.. 
			//여기는 오류를 내가 알아서 해결하는 코드
			dto.setId(0);
		}
		int res = qnaService.qnaUpdate(dto);
		return "redirect:qnaList.do";

	}
}
