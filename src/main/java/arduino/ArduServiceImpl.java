package arduino;

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

}
