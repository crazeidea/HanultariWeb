package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import favorite.FavoriteDTO;
import favorite.FavoriteServiceImpl;
import member.MemberDTO;
import parking.ParkingVO;

@Controller
public class FavoriteController {
	
	@Autowired FavoriteServiceImpl service;
	
	@ResponseBody @RequestMapping("/checkFavorite")
	public boolean checkFavorite(Integer id, HttpSession session) {
		HashMap<String, Integer> map = new HashMap<>();
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		Integer memberid = member.getId();
		map.put("memberid", memberid);
		map.put("parkingid", id);
		List<FavoriteDTO> list = service.checkFavorite(map);
		System.out.println(list);
		System.out.println(list.isEmpty());
		
		return list.isEmpty() ? true : false;
	}
	
	@ResponseBody @RequestMapping("/checkFavoriteAndroid")
	public boolean checkFavoriteAndroid(Integer id, Integer userid) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memberid", userid);
		map.put("parkingid", id);
		List<FavoriteDTO> list = service.checkFavorite(map);
		return list.isEmpty() ? false : true;
	}
	
	@ResponseBody @RequestMapping("/insertFavorite")
	public void insertFavorite(Integer id, HttpSession session) {
		HashMap<String, Integer> map = new HashMap<>();
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		Integer memberid = member.getId();
		map.put("memberid", memberid);
		map.put("parkingid", id);
		service.insertFavorite(map);
	}
	
	@ResponseBody @RequestMapping("/insertFavoriteAndroid")
	public void insertFavoriteAndroid(Integer id, Integer userid) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memberid", userid);
		map.put("parkingid", id);
		service.insertFavorite(map);
	}
	
	@ResponseBody @RequestMapping("/deleteFavorite")
	public void deleteFavorite(Integer id, HttpSession session) {
		HashMap<String, Integer> map = new HashMap<>();
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		Integer memberid = member.getId();
		map.put("memberid", memberid);
		map.put("parkingid", id);
		service.deleteFavorite(map);
	}
	
	@ResponseBody @RequestMapping("/deleteFavoriteAndroid")
	public void deleteFavoriteAndroid(Integer id, Integer userid) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memberid", userid);
		map.put("parkingid", id);
		service.deleteFavorite(map);
	}
	
	@ResponseBody @RequestMapping("/getFavorite")
	public List<FavoriteDTO> getFavorite(Integer id, HttpSession session) {
		
		return service.getFavorite(id);
	}

}
