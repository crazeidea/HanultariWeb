package arduino;

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

}
