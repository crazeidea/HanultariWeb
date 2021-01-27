package member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired private MemberDAO dao;

	@Override
	public int member_join(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.member_join(dto);
	}

	@Override
	public MemberDTO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public boolean member_id_check(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.updateMember(dto);
	}

	@Override
	public int member_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean member_social_id(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int member_social_insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int member_social_update(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean checkEmail(String email) {
		return dao.checkEmail(email);
		
	}

	public MemberDTO getUserData(int id) {
		return dao.getUserData(id);
	}

	
}
