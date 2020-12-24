package user;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO implements UserService{
	
	@Autowired @Qualifier("") private SqlSession sql;

	@Override
	public int user_join(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean user_id_check(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserDTO user_login(HashMap<String, String> map) {
		return sql.selectOne("user.mapper.login", map);
	}

	@Override
	public int user_update(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int user_delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean user_social_id(UserDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int user_social_insert(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int user_social_update(UserDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}


}
