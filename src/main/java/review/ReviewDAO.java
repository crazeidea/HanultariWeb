package review;

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

}
