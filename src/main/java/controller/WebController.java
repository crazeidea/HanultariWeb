package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.MemberDTO;
import member.MemberServiceImpl;

@Controller
public class WebController {

	@Autowired private MemberServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(WebController.class);
	
	//메인화면 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session)  {
		return "home";
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
	@RequestMapping("/sign_up")
	public String sign_up() {
		return "member/sign_up";
	}
	
	
	
}
