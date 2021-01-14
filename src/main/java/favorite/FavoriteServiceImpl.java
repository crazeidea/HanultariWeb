package favorite;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parking.ParkingVO;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired FavoriteDAO dao;
	
	@Override
	public List<FavoriteDTO> checkFavorite(HashMap<String, Integer> map) {
		return dao.checkFavorite(map);
	}

	public void insertFavorite(HashMap<String, Integer> map) {
		dao.insertFavorite(map);
		
	}

	public void deleteFavorite(HashMap<String, Integer> map) {
		dao.deleteFavorite(map);
		
	}

	public List<FavoriteDTO> getFavorite(Integer id) {
		return dao.getFavorite(id);
	}

}
