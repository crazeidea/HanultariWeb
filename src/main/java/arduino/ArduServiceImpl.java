package arduino;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArduServiceImpl implements ArduService {
	
	@Autowired ArduDAO dao;

	@Override
	public void ArduSetIn(ArduDTO dto) {
		dao.ArduSetIn(dto);
		
	}

	@Override
	public void ArduSetOut(ArduDTO dto) {
		dao.ArduSetOut(dto);
		
	}

	public int getSeat(int stopperid) {
		return dao.getSeat(stopperid);
	}

	public void updateLayoutFirst(HashMap<String, Integer> map) {
		dao.updateLayoutFirst(map);
		
	}

	public int getLength(int parking) {
		return dao.getLength(parking);
	}

	public void updateLayoutLast(HashMap<String, Integer> map) {
		dao.updateLayoutLast(map);
		
	}

	public void updateLayoutMiddle(HashMap<String, Integer> map) {
		dao.updateLayoutMiddle(map);
		
	}

	public void addParked(int parking) {
		dao.addParked(parking);
		
	}

	public void subParked(int parking) {
		dao.subParked(parking);
	}

}
