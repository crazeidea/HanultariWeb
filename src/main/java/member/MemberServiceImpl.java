package user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired private UserDAO dao;

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
		return dao.user_login(map);
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
