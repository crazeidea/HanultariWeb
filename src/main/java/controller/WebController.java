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
	
	//공지사항 상세페이지 화면요청, int id를 쓰면 500 에러 등장
	@RequestMapping("/detail.no")
	public String detail(Model model) {
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
	public String list(HttpSession session, Model model) {
		return "notice/list";
	}
	
	//메인화면 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session)  {
		return "index";
	}
	
	//로그인화면 호출
	@RequestMapping("/login")
	public String login() {
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
	public String sign_up() {
		return "member/signup";
	}
	
	
	
}
