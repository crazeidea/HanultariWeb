package controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonParser;

import command.CommonCommand;
import command.Search;
import parking.LatlngVO;
import parking.ParkingServiceImpl;
import parking.ParkingVO;

@Controller
public class DataController {
	
	@Autowired ParkingServiceImpl service;
	
	
	@ResponseBody @RequestMapping("/getMarkerData")
	public List<LatlngVO> listnearby(HttpServletRequest req, Model model) {
		
		List<LatlngVO> list = service.getMarkerData();
		System.out.println("INFO : Marker Data Requested");
		return list;
	}
	
	@ResponseBody @RequestMapping("/getSingleParkingData")
	public ParkingVO getSingleParkingData(int id) {
		return service.getSingleParkingData(id);
	}
	
	@ResponseBody @RequestMapping("/search")
	public JSONArray search(String query, Model model) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject data =  (JSONObject) parser.parse(Search.search(query));
		JSONArray array = (JSONArray) data.get("items");
		return array;
	}

}
