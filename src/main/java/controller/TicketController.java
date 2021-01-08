package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberDTO;
import ticket.TicketDTO;
import ticket.TicketPage;
import ticket.TicketServiceImpl;

@Controller
public class TicketController {
	
	@Autowired TicketPage page;
	@Autowired TicketServiceImpl service;
	
	@RequestMapping("/ticket/list")
	public String ticketList(HttpSession session, Model model,
							@RequestParam(defaultValue = "") String search,
							@RequestParam(defaultValue = "") String keyword,
							@RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("category", "ticket");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.ticketList(page));
		
		return "ticket/list";
	}
	
	@RequestMapping("/ticket/detail")
	public String ticketDetail(Model model, int id) {
		service.ticketRead(id);
		model.addAttribute("dto", service.ticketDetail(id));
		model.addAttribute("page", page);
		model.addAttribute("crlf", "\r\n");
		return "ticket/detail";
	}
	
	@RequestMapping("/ticket/delete")
	public String ticketDelete(int id) {
		service.ticketDelete(id);
		return "redirect:/ticket";
	}
	
	@RequestMapping("ticket/write")
	public String ticketWrite() {
		return "ticket/new";
	}
	
	@RequestMapping("ticket/insert")
	public String ticketInsert(TicketDTO dto, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		dto.setWriter(member.getName());
		service.ticketInsert(dto);
		return "redirect:/ticket/log";
	}
	
	@RequestMapping("ticket/edit")
	public String ticketEdit(int id, Model model) {
		model.addAttribute("dto", service.ticketDetail(id));
		return "ticket/modify";
	}
	
	@RequestMapping("ticket/update")
	public String ticketUpdate(TicketDTO dto, HttpSession session) {
		service.ticketUpdate(dto);
		return "redirect:/ticket/detail?id=" + dto.getId();
	}
	
	@RequestMapping("ticket/faq")
	public String ticketFaq() {
		return "ticket/faq";
	}
	
	@RequestMapping("ticket/submit")
	public String ticketSubmit() {
		return "ticket/new";
	}
	
	@RequestMapping("/ticket/log")
	public String ticketLog(HttpSession session, Model model,
							@RequestParam(defaultValue = "") String search,
							@RequestParam(defaultValue = "") String keyword,
							@RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("category", "ticket");
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		String name = member.getName();
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);		
		model.addAttribute("page", service.ticketLog(page, name));
		
		return "ticket/log";
	}
	
}
