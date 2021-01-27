package com.csslect.app.arducommand;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.csslect.app.ardudao.ArduDao;
import com.csslect.app.ardudto.ArduDto;

@Service
public class ArduCommandImpl implements ArduCommand {

	@Override
	public void arduSetIn() {
		ArduDao adao = new ArduDao();
//		adao.arduSetIn();
//		ArrayList<ArduDto> adtos = adao.arduGetLed();
//		
//		model.addAttribute("arduGetLed", adtos); 
		
	}

	@Override
	public void arduSetOut() {
		
//		String id = (String)model.asMap().get("id");
//		String value = (String)model.asMap().get("value");
//		
//		ArduDao adao = new ArduDao();
//		
//		ArrayList<ArduDto> adtos = adao.arduSetLed(id, value);
//		
//		//model.addAttribute("arduSetLed", adtos); 
//		
	
	}

}
