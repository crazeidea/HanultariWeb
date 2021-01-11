package favorite;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAO implements FavoriteService {
	
	@Autowired SqlSession sql;

	@Override
	public List<FavoriteDTO>checkFavorite(HashMap<String, Integer> map) {
		return sql.selectList("favorite.mapper.check", map);
	}

	public void insertFavorite(HashMap<String, Integer> map) {
		 sql.insert("favorite.mapper.insert", map);
	}

	public void deleteFavorite(HashMap<String, Integer> map) {
		 sql.delete("favorite.mapper.delete", map);
		
	}

	public List<FavoriteDTO> getFavorite(Integer id) {
		return sql.selectList("favorite.mapper.get", id);
	}

}
