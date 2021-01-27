package parking;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageDTO;

@Component
public class ParkingPage extends PageDTO {
	
	private List<ParkingVO> list;
	
	public List<ParkingVO> getList() {
		return list;
	}
	
	public void setList(List<ParkingVO> list) {
		this.list = list;
	}

}
