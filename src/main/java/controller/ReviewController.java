package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberDTO;
import review.ReviewDTO;
import review.ReviewServiceImpl;

@Controller
public class ReviewController {

	@Autowired ReviewServiceImpl service;
	
	@ResponseBody @RequestMapping("/getReviews")
	public List<ReviewDTO> getReviews(int id, HttpSession session) {
		return service.getReview(id);
	}
	
	@ResponseBody @RequestMapping("/review/insert")
	public boolean reviewInsert(int parking_id, int rating, String content, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		int member_id = member.getId();
		ReviewDTO dto = new ReviewDTO();
		dto.setParking_id(parking_id);
		dto.setMember_id(member_id);
		dto.setRating(rating);
		dto.setContent(content);
		boolean result = service.insertReview(dto) > 0 ? true : false;
		return result;
	}
	
}
