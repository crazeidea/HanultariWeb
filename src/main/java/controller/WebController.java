package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import user.UserDTO;
import user.UserServiceImpl;

@Controller
public class WebController {

	@Autowired private UserServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(WebController.class);
	
	//메인화면 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session)  {
		return "home";
	}
	
	//로그인화면 호출
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	//로그인 요청
	@RequestMapping("/applogin")
	public boolean login(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		UserDTO dto = service.user_login(map);
		session.setAttribute("login_info", dto);
		return dto==null ? false : true;
	}
	
}
