package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberDTO;
import ticket.TicketDTO;
import ticket.TicketPage;
import ticket.TicketServiceImpl;

@Controller
public class TicketController {
	
	@Autowired TicketPage page;
	@Autowired TicketServiceImpl service;
	
	@RequestMapping("/ticket/list")
	public String ticketList(HttpSession session, Model model) {
		session.setAttribute("category", "ticket");
		session.setAttribute("ticket", service.ticketList());
		return "ticket/list";
	}
	
	@RequestMapping("/ticket/detail")
	public String ticketDetail(Model model, int id) {
		model.addAttribute("dto", service.ticketDetail(id));
		model.addAttribute("answer", service.ticketGetAnswer(id));
		return "ticket/detail";
	}
	
	@RequestMapping("/ticket/delete")
	public String ticketDelete(int id, HttpSession session) {
		MemberDTO logined = (MemberDTO) session.getAttribute("user");
		service.ticketDelete(id);
		if(logined != null && logined.getAdmin() != null) return "redirect:/ticket/list";
		else return "redirect:/ticket/log";
	}
	
	@RequestMapping("ticket/write")
	public String ticketWrite() {
		return "ticket/new";
	}
	
	@RequestMapping("ticket/reply")
	public String ticketReply(int id, Model model) {
		model.addAttribute("ticket", service.ticketDetail(id));
		return "ticket/reply";
	}
	
	@RequestMapping("ticket/insert")
	public String ticketInsert(TicketDTO dto, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		dto.setWriter(member.getName());
		service.ticketInsert(dto);
		return "redirect:/ticket/log";
	}
	
	@RequestMapping("ticket/answer")
	public String ticketAnswer(TicketDTO dto) {
		service.ticketAnswer(dto);
		return "redirect:/ticket/list";
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
	public String ticketLog(HttpSession session, Model model) {
		session.setAttribute("category", "ticket");
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		if(member != null) {
		String name = member.getName();
		List<TicketDTO> list = service.ticketLog(name);
		model.addAttribute("ticket", list);		
		return "ticket/log";
		} else {
		return "redirect: /login";
		}
	}
	
	@ResponseBody @RequestMapping("/getTicket")
	public List<TicketDTO> getTicket(String writer) {
		return service.ticketLog(writer);
	}
	
	
}
