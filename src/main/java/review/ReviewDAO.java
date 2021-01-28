package review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewDAO implements ReviewService{

	@Autowired SqlSession sql;
	
	@Override
	public List<ReviewDTO> getReview(int id) {
		return sql.selectList("review.mapper.get", id);
	}

	public int insertReview(ReviewDTO dto) {
		return sql.insert("review.mapper.insert", dto);
	}

	public int checkReview(HashMap<String, Integer> map) {
		return sql.selectOne("review.mapper.check", map);
	}

	public void updateReview(ReviewDTO dto) {
		sql.update("review.mapper.update", dto);
	}

}
