package com.example.neoheulge.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.neoheulge.admin.service.AdminDAO;
import com.example.neoheulge.admin.service.AdminService;
import com.example.neoheulge.dto.MemberDTO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired 
	private AdminService adminservice;
    @GetMapping("/adminMember.do")
    public String adminMember() {
    	   
    	    return "admin/adminMember";
    	}
    @PostMapping("/searchMember.do")
    @ResponseBody
    public Map<String, Object> searchMember(
        @RequestParam(value = "searchType", defaultValue = "all") String searchType,
        @RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword,
        @RequestParam(value = "page", defaultValue = "1") int page, // 현재 페이지
        @RequestParam(value = "size", defaultValue = "5") int size  // 페이지 크기
    ) {
      
        int offset = (page - 1) * size;

      
        List<MemberDTO> members;
        if ("all".equals(searchType)) {
            members = adminservice.MemberAll(offset, size);
        } else {
            members = adminservice.searchMember(searchType, searchKeyword, offset, size);
        }
        

        int totalCount = adminservice.getTotalCount(searchType, searchKeyword);
        int totalPages = (int) Math.ceil((double) totalCount / size);
        Map<String, Object> response = new HashMap<>();
        response.put("members", members);
        response.put("totalPages", totalPages);
        response.put("currentPage", page);
        
        //System.out.println("totalPages:" + totalPages);
        return response;
    }
    @GetMapping("/updateMemberForm.do")
    public String showUpdateForm(@RequestParam("memberID") String memberID, Model model) {
        // memberID를 사용하여 데이터베이스에서 회원 정보를 조회합니다.
        MemberDTO mdto = adminservice.findMemberById(memberID);
        
        // 모델에 회원 정보를 추가합니다.
        model.addAttribute("member", mdto);
        System.out.println("memberID: "+ mdto.getMemberID());
     //   System.out.println("memberDATE:"+mdto.getSignup_date());
        // 업데이트 페이지로 이동합니다.
        return "admin/updateMemberForm"; // JSP 페이지 이름
    }
    
}
