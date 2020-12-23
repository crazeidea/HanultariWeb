package controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.CommonCommand;
import parking.ParkingServiceImpl;
import parking.ParkingVO;

@Controller
public class AndroidController {
	
	@Autowired ParkingServiceImpl service;
	
	@RequestMapping("/getMarkerData")
	public String listnearby(HttpServletRequest req, Model model) {
		
		List<ParkingVO> list = service.getMarkerInfo();
		model.addAttribute("list", list);
		System.out.println("getMarkerData()");
		return "Android/getMarkerData";
	}
	
}
