package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import command.CommonService;
import member.MemberDTO;
import member.MemberServiceImpl;
import parking.ParkingServiceImpl;

@Controller
public class WebController {

	@Autowired private MemberServiceImpl memberService;
	@Autowired private ParkingServiceImpl parkingService;
	@Autowired private CommonService common;
	
	//메인화면 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home()  {
		return "index";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "/about";
	}
	
	//로그인화면 호출
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("page", "login");
		return "member/login";
	}
	
	//회원가입화면 요청
	@RequestMapping("/signup")
	public String sign_up(HttpSession session) {
		session.setAttribute("page", "signup");
		return "member/signup";
	}
	
	
	
	
	
	
}
