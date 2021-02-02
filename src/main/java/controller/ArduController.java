package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import arduino.ArduDTO;
import arduino.ArduServiceImpl;

@Controller
public class ArduController {
	
	@Autowired ArduServiceImpl service; 
	
	@ResponseBody @RequestMapping(value = "/arduSetIn", method = {RequestMethod.GET, RequestMethod.POST})
	public void arduSetIn(HttpServletRequest req, Model model) {
		int stopperid = Integer.parseInt(req.getParameter("stopper"));
		int parking = Integer.parseInt(req.getParameter("parking"));
		int state = Integer.parseInt(req.getParameter("state"));
		ArduDTO dto = new ArduDTO();
		dto.setParking(parking);
		dto.setStopper(stopperid);
		dto.setState(state);
		if(state == 0) { // 입차			
			service.ArduSetIn(dto);
			int seat = service.getSeat(stopperid);
			int length = service.getLength(parking);
			HashMap<String, Integer> map = new HashMap<>();
			map.put("parking", parking);
			map.put("seat", seat);
			System.out.println("Stopper " + stopperid + " IN Seat : " + seat + " length : " + length);
			service.addParked(parking);
			if(seat == 1) {
				service.updateLayoutFirst(map);
			} else if (seat == (length-1)) {
				service.updateLayoutLast(map);
			} else {
				service.updateLayoutMiddle(map);
			}
		} else if (state == 1) { // 출차
			service.ArduSetOut(dto);
			int seat = service.getSeat(stopperid);
			int length = service.getLength(parking);
			HashMap<String, Integer> map = new HashMap<>();
			map.put("parking", parking);
			map.put("seat", seat);
			System.out.println("Stopper " + stopperid + " OUT Seat : " + seat + " length : " + length);
			service.subParked(parking);
			if(seat == 1) {
				service.updateLayoutFirst(map);
			} else if (seat == (length-1)) {
				service.updateLayoutLast(map);
			} else {
				service.updateLayoutMiddle(map);
			}
			
		}
		
		
		
	}

	
	
	
}