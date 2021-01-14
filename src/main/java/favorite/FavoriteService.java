package favorite;

import java.util.HashMap;
import java.util.List;

public interface FavoriteService {
	
	List<FavoriteDTO> checkFavorite(HashMap<String, Integer> map);

}
