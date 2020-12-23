package parking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParkingServiceImpl implements ParkingService{

	@Autowired private ParkingDAO dao;
	
	@Override
	public List<LatlngVO> getMarkerInfo() {
		
		return dao.getMarkerInfo();
	}

}
