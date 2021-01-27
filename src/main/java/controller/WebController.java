package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import common.CommonService;
import member.MemberDTO;
import member.MemberServiceImpl;
import parking.ParkingPage;
import parking.ParkingServiceImpl;
import parking.ParkingVO;

@Controller
public class WebController {

	@Autowired private ParkingServiceImpl parkingService;
	@Autowired private ParkingPage page;
	
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
		session.setAttribute("title", "로그인");
		return "member/login";
	}
	
	//회원가입화면 요청
	@RequestMapping("/signup")
	public String sign_up(HttpSession session) {
		session.setAttribute("title", "회원가입");
		return "member/signup";
	}
	
	//관리자 페이지
	@RequestMapping("/manage")
	public String manage(HttpSession session, Model model) {
		model.addAttribute("parkings",parkingService.manageList());
		return "manage/list";
	}
	
	//주차장 상세 페이지
	@RequestMapping("/manage/detail")
	public String manageDetail(int id, Model model) {
		model.addAttribute("parking", parkingService.getSingleParkingData(id));
		return "manage/detail";
	}
	
	//주차장 정보 업데이트
	@RequestMapping("/manage/update")
	public String manageUpdate(ParkingVO vo) {
		parkingService.manageUpdate(vo);
		return "redirect:/manage";
	}
	
	@RequestMapping ("/account")
	public String account(HttpSession session) {
		MemberDTO logined = (MemberDTO) session.getAttribute("user");
		if(logined == null) return "redirect:/login";
		else return "account/account"; 
	}
	
	
	
	
	
	
}
