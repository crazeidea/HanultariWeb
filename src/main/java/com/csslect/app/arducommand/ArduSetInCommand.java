package com.csslect.app.arducommand;

import org.springframework.ui.Model;

import com.csslect.app.ardudao.ArduDao;


public class ArduSetInCommand implements IArduCommand{	
	
	@Override
	public void execute(Model model) {
		int id = Integer.parseInt((String)model.asMap().get("id"));
		int state = Integer.parseInt((String)model.asMap().get("state"));
		
		ArduDao adao = new ArduDao();
		adao.arduSetIn(id, state);		
			
	}	 

}
