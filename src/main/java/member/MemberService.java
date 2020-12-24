package user;

import java.util.HashMap;

public interface UserService {
	//CRUD: Create, Read, Update, Delete
	int user_join(UserDTO dto);	//회원가입시 회원정보 저장
	UserDTO user_login(HashMap<String, String> map);//회원정보 로그인
	boolean user_id_check(String id);//회원가입시 아이디 중복확인
	int user_update(UserDTO dto);//정보보기에서 회원정보 변경저장
	int user_delete(String id);//회원탈퇴
	boolean user_social_id(UserDTO dto);//소셜로그인시 회원이메일 존재하는지
	int user_social_insert(UserDTO dto);//소셜로그인시 회원정보 신규저장
	int user_social_update(UserDTO dto);//소셜로그인시 회원정보 변경저장
}
