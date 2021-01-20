package parking;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParkingServiceImpl implements ParkingService{

	@Autowired private ParkingDAO dao;
	
	@Override
	public List<LatlngVO> getMarkerData() {
		
		return dao.getMarkerData();
	}

	@Override
	public ParkingVO getSingleParkingData(int id) {
		return dao.getSingleParkingData(id);
	}

	@Override
	public LatlngVO getSingleParkingLatlng(int id) {
		
		return dao.getSingleParkingLatlng(id);
	}

	@Override
	public List<ParkingVO> searchParking(String query) {
		
		return dao.searchParking(query);
	}

	@Override
	public List<ParkingVO> manageList() {
		return dao.manageList();
	}

	public int manageUpdate(ParkingVO vo) {
		return dao.manageUpdate(vo);
	}


	
	

	

}
