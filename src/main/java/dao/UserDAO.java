package com.hanultari.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.hanultari.dto.UserDTO;
import com.hanultari.service.UserService;

@Repository
public class UserDAO implements UserService{

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
		// TODO Auto-generated method stub
		return null;
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


}
