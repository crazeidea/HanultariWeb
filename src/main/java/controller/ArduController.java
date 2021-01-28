package controller;

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
		if(state == 0) {
			service.ArduSetIn(dto);
			System.out.println("Stopper " + stopperid + "IN");
		} else if (state == 1) {
			service.ArduSetOut(dto);
			System.out.println("Stopper " + stopperid + "OUT");
		}
		
		
		
	}

	
	
	
}