package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.MemberDTO;
import member.MemberServiceImpl;
import notice.NoticServiceImpl;
import notice.NoticeDTO;
import notice.NoticePage;

@Controller
public class WebController {

	@Autowired private MemberServiceImpl service;
	@Autowired private NoticServiceImpl service1;	//위의 멤버서비스랑 충돌나서 서비스1으로 임시로 했습니다
	@Autowired private NoticePage page;
	private static final Logger logger = LoggerFactory.getLogger(WebController.class);
	
	//답글저장처리
	@RequestMapping("/reply_insert.no")
	public String reply_insert(NoticeDTO dto, HttpSession session) {
		dto.setWriter(((MemberDTO)session.getAttribute("login_info")).getId());
		service1.notice_reply_insert(dto);
		return "redirect:list.no";
	}
	
	//답글쓰기 화면
	@RequestMapping("/reply.no")
	public String reply(int id, Model model) {
		model.addAttribute("dto", service1.notice_detail(id));
		return "notice/reply";
	}
	
	//공지사항 변경 저장처리
	@RequestMapping("/update.no")
	public String update(NoticeDTO dto, HttpSession session) {
		service1.notice_update(dto);
		return "redirect:detail.no?id="+ dto.getId();
	}
	
	//공지사항 수정화면 
	@RequestMapping("/modify.no")
	public String modify(Model model, int id) {
		model.addAttribute("dto", service1.notice_detail(id));
		return "notice/modify";
	}
	
	//공지사항 삭제처리 
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		service1.notice_delete(id);
		return "redirect:list.no";
	}
	
	//공지사항 첨부된 첨부파일 다운로드 요청
	
	//공지사항 상세페이지 화면요청
	@RequestMapping("/detail.no")
	public String detail(Model model, int id) {
		service1.notice_read(id);
		model.addAttribute("dto", service1.notice_detail(id));
		model.addAttribute("page", page);
		model.addAttribute("crlf", "\r\n");
		return "notice/detail";
	}
	
	//공지사항 작성페이지 저장요청
	@RequestMapping("/insert.no")
	public String insert(NoticeDTO dto, HttpSession session, MultipartFile file) {
		MemberDTO member = (MemberDTO)session.getAttribute("login_info");
		dto.setWriter(member.getId());
		
		service1.notice_insert(dto);
		
		return "redirect:list.no";
	}
	
	//공지사항 작성페이지 화면
	@RequestMapping("/create.no")
	public String notice() {
		return "notice/create";
	}
	
	//공지사항 목록 화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model
						, @RequestParam(defaultValue = "") String search
						, @RequestParam(defaultValue = "") String keyword 
						, @RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("category", "no");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service1.notice_list(page));
		return "notice/list";
	}
	
	//메인화면 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session)  {
		return "index";
	}
	
	//로그인화면 호출
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("page", "login");
		return "member/login";
	}
	
	//로그인 요청
	@RequestMapping("/applogin")
	public boolean login(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		MemberDTO dto = service.member_login(map);
		session.setAttribute("login_info", dto);
		return dto==null ? false : true;
	}
	
	//회원가입화면 요청
	@RequestMapping("/signup")
	public String sign_up(HttpSession session) {
		session.setAttribute("page", "signup");
		return "member/signup";
	}
	
	
	
}
