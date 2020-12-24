package parking;

import java.util.List;

public interface ParkingService {
	List<LatlngVO> getMarkerData();
	ParkingVO getSingleParkingData(int id);

}
