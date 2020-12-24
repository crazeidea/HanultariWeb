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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import command.CommonCommand;
import parking.LatlngVO;
import parking.ParkingServiceImpl;
import parking.ParkingVO;

@Controller
public class AndroidController {
	
	@Autowired ParkingServiceImpl service;
	
	
	@ResponseBody @RequestMapping("/getMarkerData")
	public List<LatlngVO> listnearby(HttpServletRequest req, Model model) {
		
		List<LatlngVO> list = service.getMarkerData();
		System.out.println("getMarkerData()");
		return list;
	}
	
	@ResponseBody @RequestMapping("/getSingleParkingData")
	public ParkingVO getSingleParkingData(int id) {
		return service.getSingleParkingData(id);
	}

}
