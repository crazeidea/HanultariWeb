package controller;

import java.net.http.HttpRequest;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberDTO;
import member.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired CommonService common;
	@Autowired MemberServiceImpl service;
	
	@RequestMapping("/signup/execute")
	public String signup(MemberDTO dto, HttpServletRequest request, HttpSession session) {
		if (service.member_join(dto) == 1) {
			common.htmlSend(dto.getEmail(), dto.getName(), session);
		};
		session.setAttribute("user", dto);
		return "redirect:/";
	};
	
	@ResponseBody @RequestMapping("/signup/android")
	public boolean signupAndroid(String json) {
		System.out.println(json);
		JSONObject object = new JSONObject(json);
		MemberDTO dto = new MemberDTO();
		dto.setEmail(object.getString("email"));
		dto.setName(object.getString("name"));
		dto.setPw(object.getString("pw"));
		dto.setTel(object.getString("tel"));
		if(service.member_join(dto) == 1) return true;
		else return false;			
	}
	
	@ResponseBody @RequestMapping("/checkEmail")
	public boolean checkEmail(String email) {
		return service.checkEmail(email);
	}
	
	@ResponseBody @RequestMapping("/login/execute")
	public boolean login(String email, String pw, HttpSession session) {
		System.out.println(email + ", " + pw);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);		
		MemberDTO dto = service.member_login(map);
		session.setAttribute("user", dto);
		return dto == null ? false : true;
	}
	
	@ResponseBody @RequestMapping("/login/android")
	public MemberDTO loginAndroid(String email, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);
		MemberDTO dto = service.member_login(map);
		if(dto != null) return dto;
		else return null;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		session.removeAttribute("user");
		String referer = req.getHeader("referer");
		return "redirect:" + referer;
	}
	
	
	
	
	
}
