package member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberService{
	
	@Autowired private SqlSession sql;

	@Override
	public int member_join(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sql.insert("member.mapper.signup", dto);
	}

	@Override
	public MemberDTO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean member_id_check(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sql.update("member.mapper.update", dto);
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
		return (Integer)sql.selectOne("member.mapper.checkemail", email) != null ? true : false;
	}

	public MemberDTO getUserData(int id) {
		return sql.selectOne("member.mapper.getuserdata", id);
	}


}
