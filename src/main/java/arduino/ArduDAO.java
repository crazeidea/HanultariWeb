package arduino;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ArduDAO implements ArduService{

	@Autowired SqlSession sql; 
	
	@Override
	public void ArduSetIn(ArduDTO dto) {
		sql.insert("ardu.mapper.insert", dto);
	}

	@Override
	public void ArduSetOut(ArduDTO dto) {
		sql.update("ardu.mapper.update", dto);
	}

	@Override
	public int getSeat(int stopper) {
		return sql.selectOne("ardu.mapper.getseat", stopper);
	}

	public void updateLayoutFirst(HashMap<String, Integer> map) {
		sql.update("ardu.mapper.updatefirst", map);
		
	}

	public int getLength(int parking) {
		return sql.selectOne("ardu.mapper.getlength", parking);
	}

	public void updateLayoutLast(HashMap<String, Integer> map) {
		sql.update("ardu.mapper.updatelast", map);
		
	}

	public void updateLayoutMiddle(HashMap<String, Integer> map) {
		sql.update("ardu.mapper.updatemiddle", map);
		
	}

	public void addParked(int parking) {
		sql.update("ardu.mapper.addparked", parking);
		
	}

	public void subParked(int parking) {
		sql.update("ardu.mapper.subparked", parking);
	}

}
