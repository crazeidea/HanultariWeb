package parking;

import java.util.List;

public interface ParkingService {
	List<LatlngVO> getMarkerData();
	LatlngVO getSingleParkingLatlng(int id);
	ParkingVO getSingleParkingData(int id);
	List<ParkingVO> searchParking(String query);
	List<ParkingVO> manageList();

}
