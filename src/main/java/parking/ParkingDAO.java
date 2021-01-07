package parking;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParkingDAO implements ParkingService {

	@Autowired private SqlSession sql;
	
	@Override
	public List<LatlngVO> getMarkerData() {
		return sql.selectList("parking.mapper.marker");
	}

	@Override
	public ParkingVO getSingleParkingData(int id) {
		return sql.selectOne("parking.mapper.singleparking", id);
	}

	@Override
	public LatlngVO getSingleParkingLatlng(int id) {
	
		return sql.selectOne("parking.mapper.singleparkinglatlng", id);
	}

	@Override
	public List<ParkingVO> searchParking(String query) {
			
		return sql.selectList("parking.mapper.searchparking", query);
	}


	
}
