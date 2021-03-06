package review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewDAO dao;
	
	@Override
	public List<ReviewDTO> getReview(int id) {
		return dao.getReview(id);
	}

	public int insertReview(ReviewDTO dto) {
		return dao.insertReview(dto);
		
	}

	public int checkReview(HashMap<String, Integer> map) {
		return dao.checkReview(map);
		
	}

	public void updateReview(ReviewDTO dto) {
		dao.updateReview(dto);
		
	}

}
