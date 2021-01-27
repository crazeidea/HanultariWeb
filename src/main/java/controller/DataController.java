package controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import common.CommonCommand;
import common.SearchLocation;
import member.MemberDTO;
import parking.LatlngVO;
import parking.ParkingServiceImpl;
import parking.ParkingVO;

@Controller
public class DataController {

	@Autowired
	ParkingServiceImpl service;

	@ResponseBody
	@RequestMapping("/getMarkerData")
	public List<LatlngVO> listnearby(HttpServletRequest req, Model model) {

		List<LatlngVO> list = service.getMarkerData();
		System.out.println("INFO : Marker Data Requested");
		return list;
	}

	@ResponseBody
	@RequestMapping("/getSingleParkingData")
	public ParkingVO getSingleParkingData(int id) {
		return service.getSingleParkingData(id);
	}
	

	@ResponseBody
	@RequestMapping("/searchLocation")
	public JSONArray searchLocation(String query, Model model) {
		JSONArray result = new JSONArray();
		JSONParser parser = new JSONParser();
		JSONObject data;
		try {
			data = (JSONObject) parser.parse(SearchLocation.search(query));
			JSONArray array = (JSONArray) data.get("items");
			if (array.size() > 0) {
				for (int i = 0; i < array.size(); i++) {
					JSONObject object = (JSONObject) array.get(i);
					if (String.valueOf(object.get("address")).contains("광주광역시"))
						result.add(object);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		return result;
		}
	}
	
	@ResponseBody @RequestMapping("/searchParking")
	public List<ParkingVO> searchParking(String query, Model model) throws ParseException {
		return service.searchParking(query);
	}
	


}
