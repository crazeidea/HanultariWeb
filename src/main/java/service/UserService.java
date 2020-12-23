package com.hanultari.service;

import java.util.HashMap;

import com.hanultari.dto.UserDTO;

public interface UserService {
	//CRUD: Create, Read, Update, Delete
	int user_join(UserDTO dto);	//회원가입시 회원정보 저장
	boolean user_id_check(String id);//회원가입시 아이디 중복확인
	UserDTO user_login(HashMap<String, String> map);//회원정보 로그인
	int user_update(UserDTO dto);//정보보기에서 회원정보 변경저장
	int user_delete(String id);//회원탈퇴
}
