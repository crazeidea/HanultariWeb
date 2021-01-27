package com.csslect.app.arducontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csslect.app.arducommand.ArduCommandImpl;
import com.csslect.app.arducommand.ArduSetInCommand;
import com.csslect.app.arducommand.IArduCommand;

@Controller
public class ArduController {
	
//	
//	@RequestMapping(value="/arduGetLed", method = {RequestMethod.GET, RequestMethod.POST}  )
//	public String arduGetLed(HttpServletRequest req, Model model){
//		System.out.println("arduGetLed()");
//		
//		command = new ArduGetLedCommand();
//		command.execute(model);
//		
//		return "arduGetLed";
//	}
//	
//	@RequestMapping(value = "/arduSetLed", method = {RequestMethod.GET, RequestMethod.POST})
//	public String arduSetLed(HttpServletRequest req, Model model) {
//	     System.out.println("id : " + req.getParameter("id"));     
//	     System.out.println("value : " + req.getParameter("value")); 
//	     
//	     String id = req.getParameter("id");
//	     String value = req.getParameter("value");
//	     
//	     model.addAttribute("id", id);
//	     model.addAttribute("value", value);
//	     
//	     command = new ArduSetLedCommand();
//	     command.execute(model); 
//		
//	     return "arduSetLed";
//	}
	
	@Autowired private ArduCommandImpl ardu;
	
	IArduCommand command;
		
	@RequestMapping(value = "/arduSetIn", method = {RequestMethod.GET, RequestMethod.POST})
	public String arduSetIn(HttpServletRequest req, Model model) {
	     System.out.println("arduSetIn()");     
	     //ardu.arduSetIn(); 
	     
	     System.out.println("id : " + req.getParameter("id"));
	     System.out.println("state : " + req.getParameter("state"));
	     String id = req.getParameter("id");
	     String state = req.getParameter("state");
	     
	     model.addAttribute("id", id);
	     model.addAttribute("state", state);
	     
	     command = new ArduSetInCommand();
	     command.execute(model);	     
	     
	     //커맨드, dao, db연결 
	     
	     return "arduSetIn";
	}

	
	
	
}