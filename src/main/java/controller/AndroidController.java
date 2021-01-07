package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import parking.LatlngVO;
import parking.ParkingServiceImpl;

@Controller
public class AndroidController {

	@Autowired ParkingServiceImpl service;
	
	@RequestMapping("/getParkingPanorama")
	public String getParkingPanorama(int id, Model model) {
		LatlngVO latlng = (LatlngVO) service.getSingleParkingLatlng(id);
		model.addAttribute("lat", latlng.getLat());
		model.addAttribute("lng", latlng.getLng());
		return "Android/getParkingPanorama";
	}
	

}
