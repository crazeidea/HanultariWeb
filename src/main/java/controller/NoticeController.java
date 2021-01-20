package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberDTO;
import notice.NoticeDTO;
import notice.NoticePage;
import notice.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	@Autowired NoticePage page;
	@Autowired NoticeServiceImpl service;
	
	@RequestMapping("/notice")
	public String noticeList(HttpSession session, Model model) {
		session.setAttribute("category", "notice");
		model.addAttribute("notice", service.noticeList());
		
		return "notice/list";
	}
	
	@RequestMapping("/notice/detail")
	public String noticeDetail(Model model, int id) {
		service.noticeRead(id);
		model.addAttribute("dto", service.noticeDetail(id));
		model.addAttribute("page", page);
		model.addAttribute("crlf", "\r\n");
		return "notice/detail";
	}
	
	@RequestMapping("/notice/delete")
	public String noticeDelete(int id) {
		service.noticeDelete(id);
		return "redirect:/notice";
	}
	
	@RequestMapping("notice/write")
	public String noticeWrite() {
		return "notice/write";
	}
	
	@RequestMapping("notice/insert")
	public String noticeInsert(NoticeDTO dto, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		dto.setWriter(member.getNickname());
		service.noticeInsert(dto);
		return "redirect:/notice";
	}
	
	@RequestMapping("notice/edit")
	public String noticeEdit(int id, Model model) {
		model.addAttribute("dto", service.noticeDetail(id));
		return "notice/modify";
	}
	
	@RequestMapping("notice/update")
	public String noticeUpdate(NoticeDTO dto, HttpSession session) {
		service.noticeUpdate(dto);
		return "redirect:/notice/detail?id=" + dto.getId();
		
	}
	
}
